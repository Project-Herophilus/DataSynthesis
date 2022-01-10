const dbConnection = require("../../general/connectors/dbConnections/mysqlConnect")
//const dbConnection = require("../../general/connectors/dbConnections/postgresqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");
let rdbmsType = process.env.rdbms;

/*
 *     Data Generated
 */

/*
 *   Account Numbers
 */
router.get('/accountnumbers', function (req, res) {
    dbConnection.query('select * from datagenerated_accountnumbers where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/accountnumbers:/likesearch', function (req, res) {
    dbConnection.query('select * from datagenerated_accountnumbers where StatusID=1 and accountnumbervalue like ?', [req.params.likesearch], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
 *  Address
 */
router.get('/addresses', function (req, res) {
    dbConnection.query('select * from datagenerated_addresses where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/addresses:/likesearch', function (req, res) {
    dbConnection.query('select * from datagenerated_addresses where StatusID=1 and addressstreet like ?', [req.params.likesearch], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
 *   Bank Account
 */
router.get('/bankaccount', function (req, res) {
    dbConnection.query('select * from datagenerated_bankaccount where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/bankaccount:/likesearch', function (req, res) {
    dbConnection.query('select * from datagenerated_bankaccount where StatusID=1 and bankaccountvalue like ?', [req.params.likesearch], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
 *   CreditCard
 */
router.get('/creditcard', function (req, res) {
    dbConnection.query('select * from datagenerated_creditcard where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/creditcard/:creditcardname', function (req, res) {
    dbConnection.query('select * from datagenerated_creditcard where StatusID=1 and CreditCardName=?', [req.params.creditcardname] ,function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
 *   Date of Birth
 */
router.get('/dateofbirth', function (req, res) {
    dbConnection.query('select * from datagenerated_dateofbirth where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/dateofbirth/:ageequality', function (req, res) {
    dbConnection.query('select * from datagenerated_dateofbirth where StatusID=1 and Age >=?',[req.params.ageequality] , function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/dateofbirth/:age', function (req, res) {
    dbConnection.query('select * from datagenerated_dateofbirth where StatusID=1 and Age >=?',[req.params.age] , function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
 *   Drivers License
 */
router.get('/driverslicenses', function (req, res) {
    dbConnection.query('select * from datagenerated_driverslicenses where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/driverslicenses/:statecode', function (req, res) {
    dbConnection.query('select * from datagenerated_driverslicenses where StatusID=1 and StateCode=?', [req.params.statecode] ,function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
 * EIN - Employer Identification Number
 */
router.get('/ein', function (req, res) {
    dbConnection.query('select * from datagenerated_ein where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/ein/:likesearch', function (req, res) {
    dbConnection.query('select * from datagenerated_ein where StatusID=1 and einvalue like ?', [req.params.likesearch], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
 *   Phone Numbers
 */
router.get('/phonenumber', function (req, res) {
    dbConnection.query('select * from datagenerated_phonenumber where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/phonenumber/:likesearch', function (req, res) {
    dbConnection.query('select * from datagenerated_phonenumber where StatusID=1 and phonenumbervalue like ?', [req.params.likesearch], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
 *   Social Security
 */
router.get('/socialsecuritynumber', function (req, res) {
    dbConnection.query('select * from datagenerated_socialsecuritynumber where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/socialsecuritynumber/:likesearch', function (req, res) {
    dbConnection.query('select * from datagenerated_socialsecuritynumber where StatusID=1 and socialsecuritynumbervalue like ?', [req.params.likesearch], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
/*
 *   User Identities
 */
router.get('/useridentities', function (req, res) {
    dbConnection.query('select * from datagenerated_useridentities where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/useridentities/:likesearch', function (req, res) {
    dbConnection.query('select * from datagenerated_useridentities where StatusID=1 and useridentityvalue like ?', [req.params.likesearch], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/useridentities/:domain', function (req, res) {
    dbConnection.query('select * from datagenerated_useridentities where StatusID=1 and UserDomain=?',  [req.params.domain] ,function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

module.exports = router;
