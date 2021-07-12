var http = require("http");
var express = require('express');
var app = express();
var mysql      = require('mysql');
var bodyParser = require('body-parser');
//dotenv.config({path: `${__dirname}/.env`})
// https://www.c-sharpcorner.com/article/integrate-swagger-open-api-with-node-express/
// had to add yarn add swagger-jsdoc and yarn add swagger-ui-express for them to run
const swaggerJSDoc = require('swagger-jsdoc');
const swaggerUI = require('swagger-ui-express');

//start mysql connection
var connection = mysql.createConnection({
  host     : 'localhost', //mysql database host name
  user     : 'root', //mysql database user name
  password : 'Developer123', //mysql database password
  database : 'datasynthesis' //mysql database name
});

connection.connect(function(err) {
  if (err) throw err
  console.log('You are now connected with mysql database...')
})
//end mysql connection

//start body-parser configuration
app.use( bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
}));
//end body-parser configuration

//create app server
var server = app.listen(8400,  "0.0.0.0", function () {

  var host = server.address().address
  var port = server.address().port

  console.log("DataSynthesis DataTier API listening at http://%s:%s", host, port)
});

// Added for Swagger Options
const swaggerOptions = {
    swaggerDefinition: {
        info: {
            title:'DataSynthesis - Platform Data API',
            version:'2.0.0'
        }
    },
    apis:['index.js'],
}
const swaggerDocs = swaggerJSDoc(swaggerOptions);
app.use('/api-docs',swaggerUI.serve,swaggerUI.setup(swaggerDocs));


/*
*     APIs - Data Existing
*/

/**
 * @swagger
 * /dataexisting_ababanking:
 *   get:
 *     description: Get all ABABanks defined
 *   responses:
 *   '200':
 * description: A list of users
 * content:
 * application/json:
 * schema:
 * type: string
 */
app.get('/dataexisting_ababanking', function (req, res) {
    connection.query('select * from dataexisting_ababanking', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
        res.status(200).send();
    });
});

app.get('/dataexisting_areacode', function (req, res) {
    connection.query('select * from dataexisting_areacode', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));

    });
});
/**
 * @swagger
 * /dataexisting_areacode:
 *   put:
 *     description: Gets All the areacodes specific to a state
 *     parameters:
 *     - name: StateCode
 *       description: The State Specified
 *       in: formData
 *       required: true
 *       type: String
 *     responses:
 *       201:
 *         description: Created
 *
 */
//rest api to get a area codes by state
// Example: http://localhost:3000/dataexisting_areacode/CA
app.get('/dataexisting_areacode/:statecode', function (req, res) {
    connection.query('select * from dataexisting_areacode where StateCode=?', [req.params.statecode], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/dataexisting_companies', function (req, res) {
    connection.query('select * from dataexisting_companies', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/dataexisting_namefirst/:firstnamechar/:gender', function (req, res) {
    connection.query('select * from dataexisting_namefirst where left(firstname,1)=? and gender=?', [req.params.firstnamechar, req.params.gender], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/dataexisting_namefirst/:firstnamechar', function (req, res) {
    connection.query('select * from dataexisting_namefirst where left(firstname,1)=?', [req.params.firstnamechar], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/dataexisting_namefirst', function (req, res) {
    connection.query('select * from dataexisting_namefirst', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/dataexisting_namelast/:lastnamechar', function (req, res) {
    connection.query('select * from dataexisting_namelast where left(lastname,1)=?', [req.params.lastnamechar], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/dataexisting_namelast', function (req, res) {
    connection.query('select * from dataexisting_namelast', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/dataexisting_upccodes', function (req, res) {
    connection.query('select * from dataexisting_upccodes', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/dataexisting_zipcodeus/:statecode', function (req, res) {
    connection.query('select * from dataexisting_zipcodeus where State=?', [req.params.statecode], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/dataexisting_zipcodeus', function (req, res) {
    connection.query('select * from dataexisting_zipcodeus', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
 *     Data Generated
 */
app.get('/datagenerated_accountnumbers', function (req, res) {
    connection.query('select * from datagenerated_accountnumbers', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/datagenerated_addresses', function (req, res) {
    connection.query('select * from datagenerated_addresses', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/datagenerated_bankaccount', function (req, res) {
    connection.query('select * from datagenerated_bankaccount', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/datagenerated_creditcard', function (req, res) {
    connection.query('select * from datagenerated_creditcard', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/datagenerated_dateofbirth', function (req, res) {
    connection.query('select * from datagenerated_dateofbirth', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/datagenerated_driverslicenses/:statecode', function (req, res) {
    connection.query('select * from datagenerated_driverslicenses where StateCode=?', [req.params.statecode] ,function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/datagenerated_driverslicenses', function (req, res) {
    connection.query('select * from datagenerated_driverslicenses', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});


app.get('/datagenerated_ein', function (req, res) {
    connection.query('select * from datagenerated_ein', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/datagenerated_phonennumber', function (req, res) {
    connection.query('select * from datagenerated_phonenumber', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/datagenerated_socialsecuritynumber', function (req, res) {
    connection.query('select * from datagenerated_socialsecuritynumber', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/datagenerated_useridentities', function (req, res) {
    connection.query('select * from datagenerated_useridentities', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
*     Platform Data
*/


/*
*     Reference Data
*/

app.get('/applications', function (req, res) {
    connection.query('select * from refdata_application', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/codesets', function (req, res) {
    connection.query('select * from refdata_codeset', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/countries', function (req, res) {
    connection.query('select * from refdata_countries', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/datagentypes', function (req, res) {
    connection.query('select * from refdata_datagentypes', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/industrystd', function (req, res) {
    connection.query('select * from refdata_industrystd', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/legalentity', function (req, res) {
    connection.query('select * from refdata_legalentity', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/operationtype', function (req, res) {
    connection.query('select * from refdata_operationtype', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/organization', function (req, res) {
    connection.query('select * from refdata_organization', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/platformparams', function (req, res) {
    connection.query('select * from refdata_platformparams', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/platformparamstodataattributes', function (req, res) {
    connection.query('select * from refdata_platformparamstodataattributes', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
 * @swagger
 * /sensivityflags:
 *   get:
 *     description: Get all sensitivyflags set
 *     responses:
 *       200:
 *         description: Success
 *
 */
app.get('/sensitivityflags', function (req, res) {
    connection.query('select * from refdata_sensitivtyflags', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/statuses', function (req, res) {
    connection.query('select * from refdata_status', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/timezones', function (req, res) {
    connection.query('select * from refdata_timezones', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/usstates', function (req, res) {
    connection.query('select * from refdata_usstates', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

app.get('/vendors', function (req, res) {
    connection.query('select * from refdata_vendors', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
*     Terms Data
*/


/*
*    Base Code Prototyped
*/
//rest api to get all customers
/*app.get('/customer', function (req, res) {
    connection.query('select * from customer', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});*/
//rest api to get a single customer data
/*app.get('/customer/:id', function (req, res) {
    connection.query('select * from customer where Id=?', [req.params.id], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});*/

//rest api to create a new customer record into mysql database
/*app.post('/customer', function (req, res) {
    var params  = req.body;
    console.log(params);
    connection.query('INSERT INTO customer SET ?', params, function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});*/

//rest api to update record into mysql database
/*app.put('/customer', function (req, res) {
    connection.query('UPDATE `customer` SET `Name`=?,`Address`=?,`Country`=?,`Phone`=? where `Id`=?', [req.body.Name,req.body.Address, req.body.Country, req.body.Phone, req.body.Id], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});*/

//rest api to delete record from mysql database
/*app.delete('/customer', function (req, res) {
    console.log(req.body);
    connection.query('DELETE FROM `customer` WHERE `Id`=?', [req.body.Id], function (error, results, fields) {
        if (error) throw error;
        res.end('Record has been deleted!');
    })
});;*/