const api = require("./api/routes")
const dotenv = require('dotenv');
const db = require("./cloudant");
const logger = require("./utils/logger");
dotenv.config({path: `${__dirname}/.env`})


app.use('/api', function(req, res, next){
        
}, api);



var port = process.env.PORT || 3000;
const server = app.listen(port, function () {
    console.log("server running on port: " + port)
});
module.exports = server;