const express = require('express');
const appService = require('./appService');

const router = express.Router();

// ----------------------------------------------------------
// API endpoints
// Modify or extend these routes based on your project's needs.
router.get('/check-db-connection', async (req, res) => {
    const isConnect = await appService.testOracleConnection();
    if (isConnect) {
        res.send('connected');
    } else {
        res.send('unable to connect');
    }
});


router.get('/review-table', async (req, res) => {
    const tableContent = await appService.fetchReviewtableFromDb();
    res.json({data: tableContent});
});

router.get('/user-account-table', async (req, res) => {
    const tableContent = await appService.fetchUserAccountTableFromDb();
    res.json({data: tableContent});
});

router.get('/director-table', async (req, res) => {
    const tableContent = await appService.fetchDirectorTableFromDb();
    res.json({data: tableContent});
});

router.get('/media-table', async (req, res) => {
    const tableContent = await appService.fetchMediaTableFromDb();
    res.json({data: tableContent});
});

router.post("/insert-review", async (req, res) => {
    const {reviewID, commentText, starNum, email, mediaID} = req.body;
    const insertResult = await appService.insertReview(reviewID, commentText, starNum, email, mediaID);
    if (insertResult) {
        res.json({ success: true });
    } else {
        res.status(500).json({ success: false });
    }
});

router.post("/insert-useraccount", async (req, res) => {
    const {email, phoneNum, userName, dateOfBirth} = req.body;
    const insertResult = await appService.insertUserAccount(email, phoneNum, userName, dateOfBirth);
    if (insertResult) {
        res.json({ success: true });
    } else {
        res.status(500).json({ success: false });
    }
});

router.delete("/delete-review", async (req, res) => {
    console.log('DELETE REVIEW RECEIVED ON BACKEND');
    const {reviewID, email, mediaID} = req.body;
    const deleteResult = await appService.deleteReview(reviewID, email, mediaID);
    if (deleteResult) {
        res.json({ success: true });
    } else {
        res.status(500).json({ success: false });
    }
});
router.post("/update-user-phone", async (req, res) => {
    console.log('UPDATE PHONE RECEIVED ON BACKEND');
    const {oldPhone, newPhone} = req.body;
    const insertResult = await appService.updateUserPhone(oldPhone, newPhone);
    if (insertResult) {
        res.json({ success: true });
    } else {
        res.status(500).json({ success: false });
    }
});

router.post("/update-user-name", async (req, res) => {
    console.log('UPDATE NAME RECEIVED ON BACKEND');
    const {oldName, newName} = req.body;
    const updateResult = await appService.updateUserName(oldName, newName);
    if (updateResult) {
        res.json({ success: true });
    } else {
        res.status(500).json({ success: false });
    }
});

router.get("/select-review", async (req, res) => {
    try {
        const insertResult = await appService.selectReview();
        res.json({ success: true, data: insertResult });
    } catch (error) {
        res.status(500).json({ success: false});
    }
});

router.get("/project-review", async (req, res) => {
    try {
        const insertResult = await appService.projectReview();
        res.json({ success: true, data: insertResult });
    } catch (error) {
        res.status(500).json({ success: false});
    }
});

router.post("/find-media-producer", async (req, res) => {
    console.log('FIND-MEDIA-PRODUCER RECEIVED ON BACKEND');
    const {producerID} = req.body;
    try {
        const insertResult = await appService.joinMediaProducer(producerID);
        res.json({ success: true, data: insertResult });
    } catch (error) {
        res.status(500).json({ success: false});
    }
});

router.get("/find-reviewed-media", async (req, res) => {
    try {
        const insertResult = await appService.findReviewedMedia();
        res.json({ success: true, data: insertResult });
    } catch (error) {
        res.status(500).json({ success: false});
    }
});

router.post("/find-media-genre", async (req, res) => {
    console.log('FIND-MEDIA-GENRE RECEIVED ON BACKEND');
    const {genreName} = req.body;
    try {
        const insertResult = await appService.findMediaGenre(genreName);
        res.json({ success: true, data: insertResult });
    } catch (error) {
        res.status(500).json({ success: false});
    }
});

router.post("/find-media-genre-producer", async (req, res) => {
    const {genreName,producerID} = req.body;
    try {
        const insertResult = await appService.findMediaGenreProducer(genreName, producerID);
        res.json({ success: true, data: insertResult });
    } catch (error) {
        res.status(500).json({ success: false});
    }
});

router.get("/find-director-genre", async (req, res) => {
    try {
        const insertResult = await appService.findDirectorGenre();
        res.json({ success: true, data: insertResult });
    } catch (error) {
        res.status(500).json({ success: false});
    }
});


module.exports = router;