  
var express = require('express');
const router = express.Router();
const hl7controller = require("./hl7/hl7.controller");
const datastructures = require("./datastructures/datastructures.controller");

router.use('/api/hl7',hl7controller)
router.use('/api/datastructures',datastructures)
module.exports = router;