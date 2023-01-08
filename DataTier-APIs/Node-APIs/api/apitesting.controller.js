const express = require("express");
const router = express.Router();
const fs = require("fs");


router.get("/apihealthtest", async(req, res) => {
    let dataResults;
    res.setHeader("Content-Type", "text/plain");
    results = "API Test Completed on: "+ Date.now()
    res.json(results)
});
module.exports = router;