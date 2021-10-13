  
var express = require('express');
const router = express.Router();
// Constants
const dataexistingcontroller = require("./querydata/dataexisting.controller");
const hl7controller = require("./hl7/hl7.controller");
//const datastructures = require("./datastructures/datastructures.controller");
// Defined Specific Routers
router.use('/api/querydata/dataexisting',dataexistingcontroller)
router.use('/api/hl7',hl7controller)
//router.use('/api/datastructures',datastructures)

module.exports = router;