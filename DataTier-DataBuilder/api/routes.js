  
var express = require('express');
const router = express.Router();
const hl7controller = require("./hl7/hl7.controller");

router.use('/api',hl7controller)

module.exports = router;