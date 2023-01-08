  
var express = require('express');
const router = express.Router();
// Constants
const apihealthcontroller = require("./apitesting.controller");
const dataexistingcontroller = require("./querydata/dataexisting.controller");
const dataegeneratedcontroller = require("./querydata/datagenerated.controller");
const datamanagementcontroller = require("./upsertdata/datamanagement.controller");
const datamodelcontroller = require("./querydata/datamodel.controller");
const dataplatformcontroller = require("./querydata/dataplatform.controller");
const datarndmcontroller = require("./randomquerydata/randomdata.controller");
const generatedatacontroller = require("./datagenerators/dataattributegenerator.controller");
const generatedatastructurescontroller = require("./datagenerators/datastructure.controller");
const hl7controller = require("./industrystds/hl7.controller");
const impldatacontroller = require("./querydata/implementationdata.controller");
const refdatacontroller = require("./querydata/referencedata.controller");
const termdatacontroller = require("./querydata/termsdata.controller");
// Defined Specific Routers - Tied to Constants
router.use('/api/apihealth', apihealthcontroller)
router.use('/api/generatedata/generate', generatedatacontroller)
router.use('/api/generatedata/generatedatastructures', generatedatastructurescontroller)
router.use('/api/industrystds', hl7controller)
router.use('/api/querydata/dataexisting', dataexistingcontroller)
router.use('/api/querydata/datagenerated', dataegeneratedcontroller)
router.use('/api/querydata/datamodel', datamodelcontroller)
router.use('/api/querydata/dataplatform', dataplatformcontroller)
router.use('/api/querydata/implementationdata', impldatacontroller)
router.use('/api/querydata/referencedata', refdatacontroller)
router.use('/api/querydata/randomized', datarndmcontroller)
router.use('/api/querydata/terminologydata', termdatacontroller)

router.use('/api/upsertdata/datamanagement', datamanagementcontroller)

module.exports = router;
