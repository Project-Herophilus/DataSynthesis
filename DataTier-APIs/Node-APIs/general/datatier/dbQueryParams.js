
    const dbQueryParameters = {
        greet(who) {
            return `Hello, ${who}!`;
        },
        farewell(who) {
            return `Good bye, ${who}!`;
        },
        statusID(activeStatus) {
            let StatusID;
            if (activeStatus == null || activeStatus == "active") {
                StatusID = 'StatusID = 1';
            }
            if (activeStatus == "inactive") {
                StatusID = 'StatusID = 2';
            }
            if (activeStatus == "all") {
                StatusID = 'StatusID >=1 ';
            }
            return StatusID;
        }
}