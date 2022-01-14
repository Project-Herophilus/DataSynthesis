// https://dmitripavlutin.com/javascript-method/

/*
While in the previous example I've used this to access the object the method belongs to —
JavaScript, however, doesn't impose a method to use this.

    For this reason you can use an object as a namespace of methods:

    const namespace = {
        greet(who) {
            return `Hello, ${who}!`;
        },
        farewell(who) {
            return `Good bye, ${who}!`;
        }
    }
namespace.greet('World');    // => 'Hello, World!'
namespace.farewell('World'); // => 'Good bye, World!'
namespace is an object that holds 2 methods: namespace.greet() and namespace.farewell().

    The methods do not use this, and namespace serves as a holder of alike methods.
*/

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