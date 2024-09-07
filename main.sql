DROP TABLE Likes;
DROP TABLE Consumes;
DROP TABLE Directs;
DROP TABLE Acts;
DROP TABLE Review_Gets_Writes;
DROP TABLE Episode_Has;
DROP TABLE Subscription1;
DROP TABLE Subscription2;
DROP TABLE Movie;
DROP TABLE TVShow;
DROP TABLE Media;
DROP TABLE UserAccount;
DROP TABLE MediaProducer;
DROP TABLE Actor;
DROP TABLE Director;
DROP TABLE Genre1;
DROP TABLE Genre2;


CREATE TABLE Genre2(
numOfMedia INT,
isPopularGenre NUMBER(1),
PRIMARY KEY (numOfMedia)
);

CREATE TABLE Genre1(
genreName VARCHAR(50),
numOfMedia INT NOT NULL,
PRIMARY KEY (genreName),
FOREIGN KEY (numOfMedia) REFERENCES Genre2(numOfMedia)
);



CREATE TABLE Director(
directorID VARCHAR(50),
directorName VARCHAR(50) NOT NULL,
PRIMARY KEY (directorID)
);

CREATE TABLE Actor(
actorID VARCHAR(50),
actorName VARCHAR(50) NOT NULL,
PRIMARY KEY (actorID)
);

CREATE TABLE MediaProducer(
producerID VARCHAR(50),
producerName VARCHAR(50) NOT NULL,
PRIMARY KEY (producerID)
);

CREATE TABLE UserAccount(
email VARCHAR(50),
phoneNum INT NOT NULL UNIQUE,
userName VARCHAR(50) NOT NULL UNIQUE,
dateOfBirth VARCHAR(50) NOT NULL,
PRIMARY KEY (email)
);

CREATE TABLE Subscription2(
duration VARCHAR(50),
price INT NOT NULL,
PRIMARY KEY (duration)
);

CREATE TABLE Subscription1(
subscriptionID VARCHAR(50),
duration VARCHAR(50) NOT NULL,
email VARCHAR(50),
startDate VARCHAR(50) NOT NULL,
endDate VARCHAR(50) NOT NULL,
PRIMARY KEY (subscriptionID),
FOREIGN KEY (email) REFERENCES UserAccount(email) ON DELETE CASCADE,
FOREIGN KEY (duration) REFERENCES Subscription2(duration) ON DELETE CASCADE
);

CREATE TABLE Media(
mediaID VARCHAR(50),
mediaTitle VARCHAR(50) NOT NULL,
producerID VARCHAR(50),
genreName VARCHAR(50),
PRIMARY KEY (mediaID),
FOREIGN KEY (producerID) REFERENCES MediaProducer(producerID) ON DELETE CASCADE,
FOREIGN KEY (genreName) REFERENCES Genre1(genreName) ON DELETE SET NULL
);

CREATE TABLE Movie(
mediaID VARCHAR(50),
duration INT NOT NULL,
PRIMARY KEY (mediaID),
FOREIGN KEY (mediaID) REFERENCES Media(mediaID) ON DELETE CASCADE
);

CREATE TABLE TVShow(
mediaID VARCHAR(50),
numOfEpisodes INT NOT NULL,
PRIMARY KEY (mediaID),
FOREIGN KEY (mediaID) REFERENCES Media(mediaID) ON DELETE CASCADE
);

CREATE TABLE Consumes(
mediaID VARCHAR(50),
email VARCHAR(50),
PRIMARY KEY (mediaID, email),
FOREIGN KEY (mediaID) REFERENCES Media(mediaID),
FOREIGN KEY (email) REFERENCES UserAccount(email)
);

CREATE TABLE Directs(
mediaID VARCHAR(50),
directorID VARCHAR(50),
PRIMARY KEY (mediaID, directorID),
FOREIGN KEY (mediaID) REFERENCES Media(mediaID),
FOREIGN KEY (directorID) REFERENCES Director(directorID)
);

CREATE TABLE Acts(
mediaID VARCHAR(50),
actorID VARCHAR(50),
FOREIGN KEY (mediaID) REFERENCES Media(mediaID),
FOREIGN KEY (actorID) REFERENCES Actor(actorID)
);

CREATE TABLE Review_Gets_Writes(
reviewID VARCHAR(50),
commentText CHAR(250),
starNum INT NOT NULL,
email VARCHAR(50),
mediaID VARCHAR(50),
PRIMARY KEY (reviewID, email, mediaID),
FOREIGN KEY (email) REFERENCES UserAccount(email) ON DELETE CASCADE,
FOREIGN KEY (mediaID) REFERENCES Media(mediaID) ON DELETE CASCADE
);

CREATE TABLE Episode_Has(
mediaID VARCHAR(50),
episodeNum INT NOT NULL,
episodeName VARCHAR(50) NOT NULL,
season INT NOT NULL,
PRIMARY KEY (mediaID, episodeNum, episodeName),
FOREIGN KEY (mediaID) REFERENCES Media(mediaID) ON DELETE CASCADE
);

CREATE TABLE Likes(
email VARCHAR(50),
genreName VARCHAR(50),
PRIMARY KEY (email, genreName),
FOREIGN KEY (email) REFERENCES UserAccount(email) ON DELETE CASCADE,
FOREIGN KEY (genreName) REFERENCES Genre1(genreName) ON DELETE CASCADE
);


INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(0, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(1, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(2, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(3, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(4, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(5, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(6, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(7, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(8, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(9, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(10, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(11, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(12, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(13, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(14, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(15, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(16, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(17, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(18, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(19, 0);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(20, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(21, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(22, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(23, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(24, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(25, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(26, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(27, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(28, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(29, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(30, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(31, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(32, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(33, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(34, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(35, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(36, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(37, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(38, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(39, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(40, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(41, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(42, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(43, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(44, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(45, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(46, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(47, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(48, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(49, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(50, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(51, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(52, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(53, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(54, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(55, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(56, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(57, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(58, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(59, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(60, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(61, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(62, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(63, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(64, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(65, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(66, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(67, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(68, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(69, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(70, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(71, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(72, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(73, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(74, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(75, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(76, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(77, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(78, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(79, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(80, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(81, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(82, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(83, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(84, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(85, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(86, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(87, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(88, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(89, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(90, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(91, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(92, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(93, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(94, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(95, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(96, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(97, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(98, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(99, 1);
INSERT INTO Genre2 (numOfMedia, isPopularGenre) VALUES(100, 1);

INSERT INTO Director(directorID, directorName) VALUES('did1', 'Christopher Nolan');
INSERT INTO Director(directorID, directorName) VALUES('did2', 'Steven Spielberg');
INSERT INTO Director(directorID, directorName) VALUES('did3', 'Martin Scorsese');
INSERT INTO Director(directorID, directorName) VALUES('did4', 'James Cameron');
INSERT INTO Director(directorID, directorName) VALUES('did5', 'Michael Bay');

INSERT INTO Actor(actorID, actorName) VALUES('aid1', 'Tom Holland');
INSERT INTO Actor(actorID, actorName) VALUES('aid2', 'Weena Wibowo');
INSERT INTO Actor(actorID, actorName) VALUES('aid3', 'Suhayl Patel');
INSERT INTO Actor(actorID, actorName) VALUES('aid4', 'Keean Vidyarthi');
INSERT INTO Actor(actorID, actorName) VALUES('aid5', 'John Pork');

INSERT INTO MediaProducer(producerID, producerName) VALUES('mpid1', 'Walt Disney');
INSERT INTO MediaProducer(producerID, producerName) VALUES('mpid2', 'Pixar');
INSERT INTO MediaProducer(producerID, producerName) VALUES('mpid3', 'Paramount');
INSERT INTO MediaProducer(producerID, producerName) VALUES('mpid4', 'Netflix');
INSERT INTO MediaProducer(producerID, producerName) VALUES('mpid5', 'Universal Studio');

INSERT INTO Genre1 (genreName, numOfMedia) SELECT 'Horror', numOfMedia FROM Genre2 WHERE numOfMedia = 43;
INSERT INTO Genre1 (genreName, numOfMedia) SELECT 'Romance Sci-Fi', numOfMedia FROM Genre2 WHERE numOfMedia = 2;
INSERT INTO Genre1 (genreName, numOfMedia) SELECT 'Thriller', numOfMedia FROM Genre2 WHERE numOfMedia = 92;
INSERT INTO Genre1 (genreName, numOfMedia) SELECT 'Action', numOfMedia FROM Genre2 WHERE numOfMedia = 77;
INSERT INTO Genre1 (genreName, numOfMedia) SELECT 'Comedy Adventure', numOfMedia FROM Genre2 WHERE numOfMedia = 15;
INSERT INTO Genre1 (genreName, numOfMedia) SELECT 'Romance', numOfMedia FROM Genre2 WHERE numOfMedia = 83;
INSERT INTO Genre1 (genreName, numOfMedia) SELECT 'Western', numOfMedia FROM Genre2 WHERE numOfMedia = 66;
INSERT INTO Genre1 (genreName, numOfMedia) SELECT 'Fantasy', numOfMedia FROM Genre2 WHERE numOfMedia = 32;
INSERT INTO Genre1 (genreName, numOfMedia) SELECT 'Fiction', numOfMedia FROM Genre2 WHERE numOfMedia = 7;

INSERT INTO Media(mediaID, mediaTitle, producerID, genreName)
SELECT 'mid1', 'Great Movie 1', p.producerID, g.genreName
FROM MediaProducer p, Genre1 g
WHERE p.producerID='mpid1' AND g.genreName='Horror';

INSERT INTO Media(mediaID, mediaTitle, producerID, genreName)
SELECT 'mid2', 'Spectacular Movie 2', p.producerID, g.genreName
FROM MediaProducer p, Genre1 g
WHERE p.producerID='mpid2' AND g.genreName='Comedy Adventure';

INSERT INTO Media(mediaID, mediaTitle, producerID, genreName)
SELECT 'mid3', 'OK Movie 3', p.producerID, g.genreName
FROM MediaProducer p, Genre1 g
WHERE p.producerID='mpid3' AND g.genreName='Action';

INSERT INTO Media(mediaID, mediaTitle, producerID, genreName)
SELECT 'mid4', 'OK Movie 5', p.producerID, g.genreName
FROM MediaProducer p, Genre1 g
WHERE p.producerID='mpid4' AND g.genreName='Romance';

INSERT INTO Media(mediaID, mediaTitle, producerID, genreName)
SELECT 'mid5', 'Decent Movie 3', p.producerID, g.genreName
FROM MediaProducer p, Genre1 g
WHERE p.producerID='mpid5' AND g.genreName='Thriller';

INSERT INTO Media(mediaID, mediaTitle, producerID, genreName)
SELECT 'mid6', 'Great TV show 1', p.producerID, g.genreName
FROM MediaProducer p, Genre1 g
WHERE p.producerID='mpid1' AND g.genreName='Horror';

INSERT INTO Media(mediaID, mediaTitle, producerID, genreName)
SELECT 'mid7', 'Spectacular TV show', p.producerID, g.genreName
FROM MediaProducer p, Genre1 g
WHERE p.producerID='mpid2' AND g.genreName='Romance';

INSERT INTO Media(mediaID, mediaTitle, producerID, genreName)
SELECT 'mid8', 'Mid TV show', p.producerID, g.genreName
FROM MediaProducer p, Genre1 g
WHERE p.producerID='mpid3' AND g.genreName='Fantasy';

INSERT INTO Media(mediaID, mediaTitle, producerID, genreName)
SELECT 'mid9', 'OK TV show 1', p.producerID, g.genreName
FROM MediaProducer p, Genre1 g
WHERE p.producerID='mpid4' AND g.genreName='Fiction';

INSERT INTO Media(mediaID, mediaTitle, producerID, genreName)
SELECT 'mid10', 'Decent TV show 2', p.producerID, g.genreName
FROM MediaProducer p, Genre1 g
WHERE p.producerID='mpid5' AND g.genreName='Western';

INSERT INTO Media(mediaID, mediaTitle, producerID, genreName)
SELECT 'mid11', 'Another Movie', p.producerID, g.genreName
FROM MediaProducer p, Genre1 g
WHERE p.producerID='mpid5' AND g.genreName='Romance Sci-Fi';

INSERT INTO Movie(mediaID, duration) SELECT mediaID, 124 FROM Media WHERE mediaID='mid1';
INSERT INTO Movie(mediaID, duration) SELECT mediaID, 189 FROM Media WHERE mediaID='mid2';
INSERT INTO Movie(mediaID, duration) SELECT mediaID, 143 FROM Media WHERE mediaID='mid3';
INSERT INTO Movie(mediaID, duration) SELECT mediaID, 93 FROM Media WHERE mediaID='mid4';
INSERT INTO Movie(mediaID, duration) SELECT mediaID, 67 FROM Media WHERE mediaID='mid5';

INSERT INTO TVShow(mediaID, numOfEpisodes) SELECT mediaID, 14 FROM Media WHERE mediaID='mid6';
INSERT INTO TVShow(mediaID, numOfEpisodes) SELECT mediaID, 20 FROM Media WHERE mediaID='mid7';
INSERT INTO TVShow(mediaID, numOfEpisodes) SELECT mediaID, 57 FROM Media WHERE mediaID='mid8';
INSERT INTO TVShow(mediaID, numOfEpisodes) SELECT mediaID, 4 FROM Media WHERE mediaID='mid9';
INSERT INTO TVShow(mediaID, numOfEpisodes) SELECT mediaID, 25 FROM Media WHERE mediaID='mid10';


INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid1' AND directorID='did1';
INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid2' AND directorID='did1';
INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid3' AND directorID='did1';
INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid4' AND directorID='did1';
INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid5' AND directorID='did1';
INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid6' AND directorID='did1';
INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid7' AND directorID='did1';
INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid8' AND directorID='did1';
INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid9' AND directorID='did1';
INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid10' AND directorID='did1';
INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid11' AND directorID='did1';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid1' AND directorID='did2';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid2' AND directorID='did2';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid3' AND directorID='did2';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid4' AND directorID='did2';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid5' AND directorID='did2';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid6' AND directorID='did2';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid7' AND directorID='did2';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid8' AND directorID='did2';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid9' AND directorID='did2';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid10' AND directorID='did2';
--
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid1' AND directorID='did3';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid2' AND directorID='did3';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid3' AND directorID='did3';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid4' AND directorID='did3';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid5' AND directorID='did3';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid6' AND directorID='did3';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid7' AND directorID='did3';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid8' AND directorID='did3';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid9' AND directorID='did3';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid10' AND directorID='did3';
--
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid1' AND directorID='did4';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid2' AND directorID='did4';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid3' AND directorID='did4';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid4' AND directorID='did4';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid5' AND directorID='did4';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid6' AND directorID='did4';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid7' AND directorID='did4';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid8' AND directorID='did4';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid9' AND directorID='did4';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid10' AND directorID='did4';
--
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid1' AND directorID='did5';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid2' AND directorID='did5';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid3' AND directorID='did5';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid4' AND directorID='did5';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid5' AND directorID='did5';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid6' AND directorID='did5';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid7' AND directorID='did5';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid8' AND directorID='did5';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid9' AND directorID='did5';
--INSERT INTO Directs(mediaID, directorID) SELECT mediaID, directorID FROM Media, Director WHERE mediaID='mid10' AND directorID='did5';


INSERT INTO Episode_Has(mediaID, episodeNum, episodeName, season) SELECT mediaID, 12, 'Trifling tree tops', 1 FROM Media WHERE mediaID='mid6';
INSERT INTO Episode_Has(mediaID, episodeNum, episodeName, season) SELECT mediaID, 1, 'Pilot', 3 FROM Media WHERE mediaID='mid7';
INSERT INTO Episode_Has(mediaID, episodeNum, episodeName, season) SELECT mediaID, 6, 'Finale', 7 FROM Media WHERE mediaID='mid8';
INSERT INTO Episode_Has(mediaID, episodeNum, episodeName, season) SELECT mediaID, 2, 'Roundness', 2 FROM Media WHERE mediaID='mid9';
INSERT INTO Episode_Has(mediaID, episodeNum, episodeName, season) SELECT mediaID, 11, 'Uh Oh!', 3 FROM Media WHERE mediaID='mid10';

INSERT INTO Subscription2 (duration, price) VALUES ('ANNUALLY', 100);
INSERT INTO Subscription2 (duration, price) VALUES ('MONTHLY', 10);
INSERT INTO Subscription2 (duration, price) VALUES ('DAILY', 4);
INSERT INTO Subscription2 (duration, price) VALUES ('WEEKLY', 6);
INSERT INTO Subscription2 (duration, price) VALUES ('BIWEEKLY', 8);

INSERT INTO UserAccount (email, phoneNum, userName, dateOfBirth)
VALUES ('bob@gmail.com', 2041238888, 'BOB ROSS', '1995-09-12');

INSERT INTO UserAccount (email, phoneNum, userName, dateOfBirth)
VALUES ('jane@gmail.com', 4038972345, 'JANE DOE', '1990-06-08');

INSERT INTO UserAccount (email, phoneNum, userName, dateOfBirth)
VALUES ('ruth@hotmail.com', 6045892654, 'RUTH THEBOSS', '2000-01-10');

INSERT INTO UserAccount (email, phoneNum, userName, dateOfBirth)
VALUES ('michael@hotmail.com', 5876231890, 'MICHAEL GODAD', '2002-05-09');

INSERT INTO UserAccount (email, phoneNum, userName, dateOfBirth)
VALUES ('john@gmail.com', 7781459898, 'JOHN DONKINS', '2004-03-04');

INSERT INTO Subscription1 (subscriptionID, duration, email, startDate, endDate)
SELECT 'sid1', 'ANNUALLY', email, '2021-11-27', '2022-11-27'
FROM UserAccount
WHERE email = 'bob@gmail.com';

INSERT INTO Subscription1 (subscriptionID, duration, email, startDate, endDate)
SELECT 'sid2', 'MONTHLY', email, '2023-04-01', '2023-05-01'
FROM UserAccount
WHERE email = 'jane@gmail.com';

INSERT INTO Subscription1 (subscriptionID, duration, email, startDate, endDate)
SELECT 'sid3', 'DAILY', email, '2023-11-03', '2023-12-03'
FROM UserAccount
WHERE email = 'ruth@hotmail.com';

INSERT INTO Subscription1 (subscriptionID, duration, email, startDate, endDate)
SELECT 'sid4', 'WEEKLY', email, '2023-02-15', '2024-02-22'
FROM UserAccount
WHERE email = 'michael@hotmail.com';

INSERT INTO Subscription1 (subscriptionID, duration, email, startDate, endDate)
SELECT 'sid5', 'BIWEEKLY', email, '2024-01-01', '2024-01-14'
FROM UserAccount
WHERE email = 'john@gmail.com';

INSERT INTO Consumes(mediaID, email)
SELECT m.mediaID, u.email
FROM Media m, UserAccount u
WHERE m.mediaID='mid1' AND u.email='bob@gmail.com';

INSERT INTO Consumes(mediaID, email)
SELECT m.mediaID, u.email
FROM Media m, UserAccount u
WHERE m.mediaID='mid2' AND u.email='jane@gmail.com';

INSERT INTO Consumes(mediaID, email)
SELECT m.mediaID, u.email
FROM Media m, UserAccount u
WHERE m.mediaID='mid3' AND u.email='ruth@hotmail.com';

INSERT INTO Consumes(mediaID, email)
SELECT m.mediaID, u.email
FROM Media m, UserAccount u
WHERE m.mediaID='mid4' AND u.email='michael@hotmail.com';

INSERT INTO Consumes(mediaID, email)
SELECT m.mediaID, u.email
FROM Media m, UserAccount u
WHERE m.mediaID='mid5' AND u.email='john@gmail.com';

INSERT INTO Acts(mediaID, actorID) SELECT mediaID, actorID FROM Media, Actor WHERE mediaID='mid1' AND actorID='aid1';
INSERT INTO Acts(mediaID, actorID) SELECT mediaID, actorID FROM Media, Actor WHERE mediaID='mid2' AND actorID='aid2';
INSERT INTO Acts(mediaID, actorID) SELECT mediaID, actorID FROM Media, Actor WHERE mediaID='mid3' AND actorID='aid3';
INSERT INTO Acts(mediaID, actorID) SELECT mediaID, actorID FROM Media, Actor WHERE mediaID='mid4' AND actorID='aid4';
INSERT INTO Acts(mediaID, actorID) SELECT mediaID, actorID FROM Media, Actor WHERE mediaID='mid5' AND actorID='aid5';

INSERT INTO Review_Gets_Writes (reviewID, commentText, starNum, email, mediaID)
SELECT 'rid1', 'This movie sucked!', 1, u.email, m.mediaID
FROM UserAccount u
JOIN Media m ON m.mediaID = 'mid1'
WHERE u.email = 'bob@gmail.com';

INSERT INTO Review_Gets_Writes (reviewID, commentText, starNum, email, mediaID)
SELECT 'rid6', 'good movie', 1, u.email, m.mediaID
FROM UserAccount u
JOIN Media m ON m.mediaID = 'mid1'
WHERE u.email = 'jane@gmail.com';

INSERT INTO Review_Gets_Writes (reviewID, commentText, starNum, email, mediaID)
SELECT 'rid7', 'alright movie', 1, u.email, m.mediaID
FROM UserAccount u
JOIN Media m ON m.mediaID = 'mid1'
WHERE u.email = 'ruth@hotmail.com';

INSERT INTO Review_Gets_Writes (reviewID, commentText, starNum, email, mediaID)
SELECT 'rid8', 'niiiice', 1, u.email, m.mediaID
FROM UserAccount u
JOIN Media m ON m.mediaID = 'mid1'
WHERE u.email = 'john@gmail.com';

INSERT INTO Review_Gets_Writes (reviewID, commentText, starNum, email, mediaID)
SELECT 'rid9', 'gooood', 1, u.email, m.mediaID
FROM UserAccount u
JOIN Media m ON m.mediaID = 'mid1'
WHERE u.email = 'michael@hotmail.com';

INSERT INTO Review_Gets_Writes (reviewID, commentText, starNum, email, mediaID)
SELECT 'rid10', 'okayyy', 1, u.email, m.mediaID
FROM UserAccount u
JOIN Media m ON m.mediaID = 'mid1'
WHERE u.email = 'ruth@hotmail.com';

INSERT INTO Review_Gets_Writes (reviewID, commentText, starNum, email, mediaID)
SELECT 'rid2', 'I am a new person after watching this. RECOMMEND!!!!', 5, ua.email, m.mediaID
FROM UserAccount ua
JOIN Media m ON m.mediaID = 'mid2'
WHERE ua.email = 'jane@gmail.com';

INSERT INTO Review_Gets_Writes (reviewID, commentText, starNum, email, mediaID)
SELECT 'rid3', 'This movie was great!', 3, ua.email, m.mediaID
FROM UserAccount ua
JOIN Media m ON m.mediaID = 'mid3'
WHERE ua.email = 'ruth@hotmail.com';

INSERT INTO Review_Gets_Writes (reviewID, commentText, starNum, email, mediaID)
SELECT 'rid4', 'This show was so epic!', 4, ua.email, m.mediaID
FROM UserAccount ua
JOIN Media m ON m.mediaID = 'mid4'
WHERE ua.email = 'michael@hotmail.com';

INSERT INTO Review_Gets_Writes (reviewID, commentText, starNum, email, mediaID)
SELECT 'rid5', 'Mid TV show to be honest', 2, ua.email, m.mediaID
FROM UserAccount ua
JOIN Media m ON m.mediaID = 'mid5'
WHERE ua.email = 'john@gmail.com';




commit;