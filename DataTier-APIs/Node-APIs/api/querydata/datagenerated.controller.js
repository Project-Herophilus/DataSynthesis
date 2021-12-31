//const dbConnection = require("../../general/connectors/dbConnections/mysqlConnect")
const dbConnection = require("../../general/connectors/dbConnections/postgresqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");

/*
 *     Data Generated
 */
router.get('/accountnumbers', function (req, res) {
    dbConnection.query('select * from datagenerated_accountnumbers where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/addresses', function (req, res) {
    dbConnection.query('select * from datagenerated_addresses where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/bankaccount', function (req, res) {
    dbConnection.query('select * from datagenerated_bankaccount where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

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

router.get('/dateofbirth', function (req, res) {
    dbConnection.query('select * from datagenerated_dateofbirth where StatusID=1', function (error, results, fields) {
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

router.get('/ein', function (req, res) {
    dbConnection.query('select * from datagenerated_ein where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/phonenumber', function (req, res) {
    dbConnection.query('select * from datagenerated_phonenumber where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/socialsecuritynumber', function (req, res) {
    dbConnection.query('select * from datagenerated_socialsecuritynumber where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/useridentities', function (req, res) {
    dbConnection.query('select * from datagenerated_useridentities where StatusID=1', function (error, results, fields) {
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
