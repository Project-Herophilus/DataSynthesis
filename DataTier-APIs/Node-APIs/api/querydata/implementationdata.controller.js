const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const express = require("express");
const router = express.Router();
const fs = require("fs");

let rdbmsType = process.env.rdbms;

/*
 *   Applications
 */
/*
router.get('/applications/:activeStatus', function (req, res) {
    const activeStatus = req.params.activeStatus;
    //console.log("Active Status: "+activeStatus);
    let StatusID;
    if (activeStatus == null || activeStatus == "active" )
    {
        StatusID = 'StatusID = 1';
    }
    if (activeStatus == "inactive")
    {
        StatusID = 'StatusID = 2';
    }
    if (activeStatus == "all")
    {
        StatusID = 'StatusID >=1 ';
    }
    if (rdbmsType =="mysql") {
        dbConnection.query('select * from impl_application where StatusID='+StatusID, function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
    if (rdbmsType =="postgreSQL")
    {
        let strQuery = 'select * from impl_application where StatusID ='+StatusID;
        dbConnection.query('select * from impl_application where '+StatusID, function (error, results, fields) {
            if (error) throw error;
            if (results.rows.length > 0)
            {
                res.end(JSON.stringify(results.rows));
                res.status(200).send();
            }
            else
            {
                res.status(200).send("No Data Returned from Query: " +strQuery);
            }
        });
    }
});
*/

router.get('/applications', function (req, res) {
    let strQuery = 'select * from impl_application ';
    dbConnection.query(strQuery, function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

/*
 *  Applications By Specific Vendor
 */
router.get('/applicationsbyvendor/:applicationid', function (req, res) {
    const codeVal = req.params.applicationid;
    let strQuery = 'select * from impl_application where vendorid = '+codeVal;
    dbConnection.query(strQuery, function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

router.get('/codesets', function (req, res) {
    let strQuery = 'select * from impl_codesets';
    dbConnection.query(strQuery, function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

/*
 *   Codeset Crossmaps By Specific Crossmap
 */
router.get('/codesetscrossmapsbycrossmap/:crossmapid', function (req, res) {
    const codeVal = req.params.crossmapid;
    let strQuery = 'select * from impl_codesets_crossmaps where implcodesetsid = '+codeVal;
    dbConnection.query(strQuery, function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

router.get('/codesetstocrossmaps', function (req, res) {
    let strQuery = 'select * from impl_codesets_crossmaps';
    dbConnection.query(strQuery, function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

router.get('/legalentities', function (req, res) {
    let strQuery = 'select * from impl_legalentities';
    dbConnection.query(strQuery, function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

router.get('/organization', function (req, res) {
    let strQuery = 'select * from impl_organization';
    dbConnection.query(strQuery, function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

/*
 *      Organizations By Specific Legal Entiyy
 */
router.get('/organizationbylegalentity/:legalentityid', function (req, res) {
    const codeVal = req.params.legalentityid;
    let strQuery = 'select * from impl_organization where legalentityguid ='+codeVal;
    dbConnection.query(strQuery, function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

router.get('/rulesets', function (req, res) {
    let strQuery = 'select * from impl_rulesets';
    dbConnection.query(strQuery, function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

router.get('/rulesetsdefinitions', function (req, res) {
    let strQuery = 'select * from impl_rulesetsdefinitions';
    dbConnection.query(strQuery, function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

/*
 *   RuleSet Deifinition By Specific Codeset
 */
router.get('/rulesetsdefinitionbyruleset/:rulesetid', function (req, res) {
    const codeVal = req.params.rulesetid;
    let strQuery = 'select * from impl_rulesetsdefinitions where rulesetid ='+codeVal;
    dbConnection.query(strQuery, function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

module.exports = router;