const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
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
    let strQuery ='select * from datagenerated_accountnumbers'
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
        let strQuery ='select * from datagenerated_accountnumbers where accountnumbervalue like '+'%'+likeSearchVal+'%'
        //dbConnection.query('select * from datagenerated_accountnumbers where accountnumbervalue like $1', ['%'+req.params.likesearch+'%'], function (error, results, fields) {
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
    }
});

/*
 *  Address
 */
router.get('/addresses', function (req, res) {
    let strQuery ='select * from datagenerated_addresses'
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
        let strQuery ='select * from datagenerated_addresses where addressstreet like '+'%'+likeSearchVal+'%'
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
    }
});

/*
 *   Bank Account
 */
router.get('/bankaccount', function (req, res) {
    let strQuery ='select * from datagenerated_bankaccount'
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
router.get('/bankaccount/:likesearch', function (req, res) {
    if (rdbmsType =="mysql") {
        dbConnection.query('select * from datagenerated_bankaccount where bankaccountvalue like ?', [req.params.likesearch], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
    if (rdbmsType =="postgreSQL") {
        const likeSearchVal = req.params.likesearch;
        let strQuery ='select * from datagenerated_bankaccount where bankaccountvalue like '+'%'+likeSearchVal+'%'
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
    }
});

/*
 *   CreditCard
 */
router.get('/creditcard', function (req, res) {
    let strQuery ='select * from datagenerated_creditcard'
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
router.get('/creditcard/:creditcardname', function (req, res) {
    const likeSearchVal = req.params.creditcardname;
    let strQuery ='select * from datagenerated_creditcard where CreditCardName like '+'%'+likeSearchVal+'%'
    dbConnection.query(strQuery ,function (error, results, fields) {
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
 *   Date of Birth
 */
router.get('/dateofbirth', function (req, res) {
    let strQuery ='select * from datagenerated_dateofbirth'
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
        let strQuery ='select * from datagenerated_dateofbirth where Age >= '+'%'+ageSearchVal+'%'
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
    }
});

/*
 *   Drivers License
 */
router.get('/driverslicenses', function (req, res) {
    let strQuery ='select * from datagenerated_driverslicenses'
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
        let strQuery ='select * from datagenerated_driverslicenses where StateCode like '+'%'+likeSearchVal+'%'
        //dbConnection.query('select * from datagenerated_driverslicenses where StateCode like $1', ['%'+req.params.statecode+'%'], function (error, results, fields) {
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
    }
});

/*
 * EIN - Employer Identification Number
 */
router.get('/ein', function (req, res) {
    let strQuery ='select * from datagenerated_ein'
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
        let strQuery ='select * from datagenerated_ein where einvalue like '+'%'+likeSearchVal+'%'
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
    }
});

/*
 *   Phone Numbers
 */
router.get('/phonenumber', function (req, res) {
    let strQuery ='select * from datagenerated_phonenumber'
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
        let strQuery ='select * from datagenerated_phonenumber where phonenumbervalue like '+'%'+likeSearchVal+'%'
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
    }

});

/*
 *   Social Security
 */
router.get('/socialsecuritynumbers', function (req, res) {
    let strQuery ='select * from datagenerated_socialsecuritynumber'
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
router.get('/socialsecuritynumbers/:likesearch', function (req, res) {
    if (rdbmsType =="mysql")
    {
        dbConnection.query('select * from datagenerated_socialsecuritynumber where socialsecuritynumbervalue like ?', [req.params.likesearch], function (error, results, fields) {
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
    if (rdbmsType =="postgreSQL")
    {
        const likeSearchVal = req.params.likesearch;
        let strQuery ='select * from datagenerated_socialsecuritynumber where socialsecuritynumbervalue like '+'%'+likeSearchVal+'%'
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
    }
});
/*
 *   User Identities
 */
router.get('/useridentities', function (req, res) {
    let strQuery ='select * from datagenerated_useridentities'
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
        let strQuery ='select * from datagenerated_useridentities where useridentityvalue like '+'%'+likeSearchVal+'%'
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
        let strQuery ='select * from datagenerated_useridentities where useridentityvalue like '+'%'+likeSearchVal+'%' +' and UserDomain = ' +'%'+domainSearchVal+'%'
        //dbConnection.query('select * from datagenerated_useridentities where useridentityvalue like $1 and UserDomain=$2', ['%'+req.params.likesearch+'%','%'+req.params.domain+'%'], function (error, results, fields) {
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
    }
});

module.exports = router;
