//const dbConnection = require("../../general/connectors/dbConnections/mysqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
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
    dbConnection.query('select * from datagenerated_accountnumbers', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/accountnumbers/:likesearch', function (req, res) {
    if (rdbmsType =="mysql")
    {
        dbConnection.query('select * from datagenerated_accountnumbers where accountnumbervalue like ?', [req.params.likesearch], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
    if (rdbmsType =="postgreSQL")
    {
        const likeSearchVal = req.params.likesearch;
        dbConnection.query('select * from datagenerated_accountnumbers where accountnumbervalue like $1', ['%'+req.params.likesearch+'%'], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
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
router.get('/addresses/:likesearch', function (req, res) {
    if (rdbmsType =="mysql")
    {
        dbConnection.query('select * from datagenerated_addresses where addressstreet like ?', [req.params.likesearch], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
    if (rdbmsType =="postgreSQL")
    {
        const likeSearchVal = req.params.likesearch;
        dbConnection.query('select * from datagenerated_addresses where addressstreet like $1', ['%'+req.params.likesearch+'%'], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
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
router.get('/bankaccount/:likesearch', function (req, res) {
    if (rdbmsType =="mysql") {
        dbConnection.query('select * from datagenerated_bankaccount where bankaccountvalue like ?', [req.params.likesearch], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
    if (rdbmsType =="postgreSQL") {
        const likeSearchVal = req.params.likesearch;
        dbConnection.query('select * from datagenerated_bankaccount where bankaccountvalue like $1', ['%'+req.params.likesearch+'%'], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
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
    dbConnection.query('select * from datagenerated_creditcard where CreditCardName=$1', [req.params.creditcardname] ,function (error, results, fields) {
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
router.get('/dateofbirth/:ageSearch', function (req, res)
{
    if (rdbmsType =="mysql") {
        dbConnection.query('select * from datagenerated_dateofbirth where Age >=?', [req.params.ageSearch], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
    if (rdbmsType =="postgreSQL") {
        const ageSearchVal = req.params.ageSearch;
        dbConnection.query('select * from datagenerated_dateofbirth where Age >=$1', [req.params.ageSearch], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
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
router.get('/driverslicenses/:statecode', function (req, res)
{
    if (rdbmsType =="mysql")
    {
        dbConnection.query('select * from datagenerated_driverslicenses where StateCode=?', [req.params.statecode], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
    if (rdbmsType =="postgreSQL")
    {
        const likeSearchVal = req.params.statecode;
        dbConnection.query('select * from datagenerated_driverslicenses where StateCode like $1', ['%'+req.params.statecode+'%'], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
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
    if (rdbmsType =="mysql")
    {
        dbConnection.query('select * from datagenerated_ein where einvalue like ?', [req.params.likesearch], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
    if (rdbmsType =="postgreSQL")
    {
        const likeSearchVal = req.params.likesearch;
        dbConnection.query('select * from datagenerated_ein where einvalue like $1', ['%'+req.params.likesearch+'%'], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
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
    if (rdbmsType =="mysql")
    {
        dbConnection.query('select * from datagenerated_phonenumber where phonenumbervalue like ?', [req.params.likesearch], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
    if (rdbmsType =="postgreSQL")
    {
        const likeSearchVal = req.params.likesearch;
        dbConnection.query('select * from datagenerated_phonenumber where phonenumbervalue like $1', ['%'+req.params.likesearch+'%'], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }

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
    if (rdbmsType =="mysql")
    {
        dbConnection.query('select * from datagenerated_socialsecuritynumber where socialsecuritynumbervalue like ?', [req.params.likesearch], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
    if (rdbmsType =="postgreSQL")
    {
        const likeSearchVal = req.params.likesearch;
        dbConnection.query('select * from datagenerated_socialsecuritynumber where socialsecuritynumbervalue like $1', ['%'+req.params.likesearch+'%'], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
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
    if (rdbmsType =="mysql")
    {
        dbConnection.query('select * from datagenerated_useridentities where useridentityvalue like ?', [req.params.likesearch], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
    if (rdbmsType =="postgreSQL")
    {
        const likeSearchVal = req.params.likesearch;
        dbConnection.query('select * from datagenerated_useridentities where useridentityvalue like $1', ['%'+req.params.likesearch+'%'], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
});
router.get('/useridentities/:likesearch/:domain', function (req, res) {
    if (rdbmsType =="mysql")
    {
        dbConnection.query('select * from datagenerated_useridentities where useridentityvalue like ? and UserDomain=?', [req.params.likesearch, req.params.domain] ,function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
    if (rdbmsType =="postgreSQL")
    {
        const likeSearchVal = req.params.likesearch;
        const domainSearchVal = req.params.domain;
        dbConnection.query('select * from datagenerated_useridentities where useridentityvalue like $1 and UserDomain=$2', ['%'+req.params.likesearch+'%','%'+req.params.domain+'%'], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
});

module.exports = router;
