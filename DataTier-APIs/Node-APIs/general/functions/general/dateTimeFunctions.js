
var methods = {
    timestamp: function() {
        console.log('Current Time in Unix Timestamp: ' + Math.floor(Date.now() / 1000));
    },
    currentDate: function() {
        //console.log('Current Date is: ' + new Date().toISOString().slice(0, 10));
        let date_ob = new Date();
        // current date
        // adjust 0 before single digit date
        let date = ("0" + date_ob.getDate()).slice(-2);
        // current month
        let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
        // current year
        let year = date_ob.getFullYear();
        return (year + "-" + month + "-" + date);
    },
    currentTime: function() {
        let date_ob = new Date();
        // current hours
        let hours = date_ob.getHours();
        if (hours < 10)  hours = '0'+hours;
        // current minutes
        let minutes = date_ob.getMinutes();
        // current seconds
        let seconds = date_ob.getSeconds();
        return (hours + ":" + minutes +":" + seconds);
    }
};

exports.data = methods;