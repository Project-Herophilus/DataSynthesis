  
var express = require('express');
const router = express.Router();
// Constants
const dataexistingcontroller = require("./querydata/dataexisting.controller");
const dataegeneratedcontroller = require("./querydata/datagenerated.controller");
const datamodelcontroller = require("./querydata/datamodel.controller");
const hl7controller = require("./industrystds/hl7.controller");
const impldatacontroller = require("./querydata/implementationdata.controller");
const refdatacontroller = require("./querydata/referencedata.controller");
const termsdatacontroller = require("./querydata/termsdata.controller");
//const datastructures = require("./datastructures/datastructures.controller");
const dataplatformcontroller = require("./querydata/dataplatform.controller");
// Defined Specific Routers - Tied to Constants
router.use('/api/querydata/dataexisting',dataexistingcontroller)
router.use('/api/querydata/datagenerated',dataegeneratedcontroller)
router.use('/api/querydata/datamodel',datamodelcontroller)
router.use('/api/querydata/dataplatform',dataplatformcontroller)
router.use('/api/industrystds',hl7controller)
router.use('/api/querydata/implementationdata',impldatacontroller)
router.use('/api/querydata/referencedata',refdatacontroller)
router.use('api/querydata/termsdata',termsdatacontroller)
//router.use('/api/datastructures',datastructures)

module.exports = router;