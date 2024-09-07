const oracledb = require('oracledb');
const loadEnvFile = require('./utils/envUtil');

const envVariables = loadEnvFile('./.env');

// Database configuration setup. Ensure your .env file has the required database credentials.
const dbConfig = {
    user: envVariables.ORACLE_USER,
    password: envVariables.ORACLE_PASS,
    connectString: `${envVariables.ORACLE_HOST}:${envVariables.ORACLE_PORT}/${envVariables.ORACLE_DBNAME}`,
    poolMin: 1,
    poolMax: 3,
    poolIncrement: 1,
    poolTimeout: 60
};

// initialize connection pool
async function initializeConnectionPool() {
    try {
        await oracledb.createPool(dbConfig);
        console.log('Connection pool started');
    } catch (err) {
        console.error('Initialization error: ' + err.message);
    }
}

async function closePoolAndExit() {
    console.log('\nTerminating');
    try {
        await oracledb.getPool().close(10); // 10 seconds grace period for connections to finish
        console.log('Pool closed');
        process.exit(0);
    } catch (err) {
        console.error(err.message);
        process.exit(1);
    }
}

initializeConnectionPool();

process
    .once('SIGTERM', closePoolAndExit)
    .once('SIGINT', closePoolAndExit);


// ----------------------------------------------------------
// Wrapper to manage OracleDB actions, simplifying connection handling.
async function withOracleDB(action) {
    let connection;
    try {
        connection = await oracledb.getConnection(); // Gets a connection from the default pool
        return await action(connection);
    } catch (err) {
        console.error(err);
        throw err;
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error(err);
            }
        }
    }
}


// ----------------------------------------------------------
// Core functions for database operations
// Modify these functions, especially the SQL queries, based on your project's requirements and design.
async function testOracleConnection() {
    return await withOracleDB(async (connection) => {
        return true;
    }).catch(() => {
        return false;
    });
}

async function fetchReviewtableFromDb() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(`SELECT * FROM Review_Gets_Writes`);
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function fetchUserAccountTableFromDb() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(`SELECT * FROM UserAccount`);
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function fetchMediaTableFromDb() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(`SELECT * FROM Media`);
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function fetchDirectorTableFromDb() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(`SELECT * FROM Director`);
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function insertReview(reviewID, commentText, starNum, email, mediaID) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `INSERT INTO Review_Gets_Writes (reviewID, commentText, starNum, email, mediaID) VALUES (:reviewID, :commentText, :starNum, :email, :mediaID)`,
            [reviewID, commentText, starNum, email, mediaID],
            { autoCommit: true }

        );
        console.log(reviewID);
        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        return false;
    });
}


async function deleteReview(reviewID, email, mediaID) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `DELETE FROM Review_Gets_Writes WHERE reviewID = :reviewID AND email = :email AND mediaID = :mediaID`,
            [reviewID, email, mediaID],
            { autoCommit: true }
        );

        console.log('DELETE REVIEW RECEIVED ON VERY BACKEND');
        return result.rowsAffected && result.rowsAffected > 0;
    }).catch((err) => {
        console.error(err);
        return false;
    });
}


async function insertUserAccount(email, phoneNum, userName, dateOfBirth) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `INSERT INTO UserAccount (email, phoneNum, userName, dateOfBirth) VALUES (:email, :phoneNum, :userName, :dateOfBirth)`,
            [email, phoneNum, userName, dateOfBirth],
            { autoCommit: true }
        );

        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        return false;
    });
}

async function updateUserPhone(oldPhone, newPhone) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `UPDATE UserAccount SET phoneNum=:newPhone where phoneNum=:oldPhone`,
            [newPhone, oldPhone],
            { autoCommit: true }
        );
        console.log('UPDATE PHONE RECEIVED ON VERY BACKEND');
        console.log(result);
        console.log(result.rowsAffected);
        console.log(result.rowsAffected > 0);
        return result.rowsAffected && result.rowsAffected > 0;
    }).catch((err) => {
        console.error(err);
        return false;
    });

}

async function updateUserName(oldName, newName) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `UPDATE UserAccount SET userName=:newName where userName=:oldName`,
            [newName, oldName],

            { autoCommit: true }
        );

        console.log('UPDATE NAME RECEIVED ON VERY BACKEND');
        console.log(result);
        console.log(result.rowsAffected);
        console.log(result.rowsAffected > 0);
        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        return false;
    });
}

async function selectReview() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT * FROM Review_Gets_Writes WHERE starNum > 3`
        );

        return result.rows;
    }).catch(() => {
        return [];
    });
}


async function projectReview() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT reviewID,commentText,starNum FROM Review_Gets_Writes`
        );
        return result.rows;
    }).catch(() => {
        return [];
    });
}
//comment
async function joinMediaProducer(producerID) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT m.mediaID, m.mediaTitle, m.producerID, m.genreName 
             FROM Media m
             JOIN MediaProducer p ON m.ProducerID = p.ProducerID
             WHERE p.ProducerID = :producerID`,
            [producerID],
            { autoCommit: true }
        );

        return result.rows;
    }).catch(() => {
        return false;
    });
}

async function findReviewedMedia() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT m.mediaID, m.mediaTitle, m.producerID, m.genreName
                FROM Media m
                JOIN Review_Gets_Writes r ON m.mediaID = r.mediaID
                GROUP BY m.mediaID, m.mediaTitle, m.producerID, m.genreName
                HAVING COUNT(r.reviewID) > 5`

        );
        console.log('FIND MEDIA PRODUCER RECEIVED ON VERY BACKEND');
        console.log(result)
        return result.rows;
    }).catch(() => {
        return false;
    });
}

async function findMediaGenre(genreName) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT m.mediaID, m.mediaTitle, m.producerID, m.genreName
             FROM Media m
             JOIN Genre1 g ON m.genreName = g.genreName
             WHERE g.genreName = :genreName`,
            [genreName],
            { autoCommit: true }
        );
        console.log('FIND MEDIA GENRE RECEIVED ON VERY BACKEND');
        console.log(result);
        return result.rows;
    }).catch(() => {
        return false;
    });
}

async function findMediaGenreProducer(genreName, producerID) {
     return await withOracleDB(async (connection) => {
         const result = await connection.execute(
               `SELECT m.mediaID, m.mediaTitle, m.producerID, m.genreName, COUNT(*)
                FROM Media m
                JOIN Genre1 g ON m.genreName = g.genreName
                JOIN MediaProducer p ON m.producerID = p.producerID
                WHERE g.genreName = :genreName
                  AND p.producerID = :producerID
                GROUP BY m.mediaID, m.mediaTitle, m.producerID, m.genreName`,
             [genreName, producerID],
             { autoCommit: true }
         );
         console.log('FIND MEDIA PROD+GENRE RECEIVED ON VERY BACKEND');
         console.log(result)
         return result.rows;
     }).catch(() => {
         return false;
     });
 }

async function findDirectorGenre() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT d.directorName
             FROM Director d
             JOIN Directs d2 ON d.directorID = d2.directorID
             JOIN Media m ON d2.mediaID = m.mediaID
             JOIN Genre1 g ON m.genreName = g.genreName
             GROUP BY d.directorName
             HAVING COUNT(DISTINCT g.genreName) = (SELECT COUNT(*) FROM Genre1)`,
        );
        console.log('FIND DIRECTOR ALL GENRES RECEIVED ON VERY BACKEND');
        console.log(result);
        return result.rows;
    }).catch(() => {
        return false;
    });
}



module.exports = {
    testOracleConnection,
    fetchReviewtableFromDb,
    fetchUserAccountTableFromDb,
    fetchDirectorTableFromDb,
    fetchMediaTableFromDb,
    insertReview,
    insertUserAccount,
    deleteReview,
    updateUserPhone,
    updateUserName,
    selectReview,
    projectReview,
    joinMediaProducer,
    findReviewedMedia,
    findMediaGenre,
    findMediaGenreProducer,
    findDirectorGenre
};