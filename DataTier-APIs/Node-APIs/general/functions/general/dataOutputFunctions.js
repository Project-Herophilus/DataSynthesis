
//var s = 'I am {0} today!';
//var result = s.replace('{0}', 'hungry');
// result: 'I am hungry today!'
const dataSeperator = "|";
const segmentSeperator = "\n";

var methodOutput = {
    adtCompleteSegment: function(){},
    mshSegment: function(organizationName, createdApp) {
        //console.log('Current Date is: ' + new Date().toISOString().slice(0, 10));
        let date_ob = new Date();
        // current date
        // adjust 0 before single digit date
        let date = ("0" + date_ob.getDate()).slice(-2);
        // current month
        let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
        // current year
        let year = date_ob.getFullYear();
        return (organizationName+dataSeperator+createdApp);
    },
    evnSegment: function(organizationName, createdApp) {

        return (organizationName+dataSeperator+createdApp);
    }
};

exports.data = methodOutput;