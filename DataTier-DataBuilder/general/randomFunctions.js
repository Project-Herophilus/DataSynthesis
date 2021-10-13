const random = require('random')

// quick uniform shortcuts
random.float((min = 0), (max = 1)) // uniform float in [ min, max )
random.int((min = 0), (max = 1)) // uniform integer in [ min, max ]
random.boolean() // true or false

var randomMethods = {
        randomFloat: function (startVal, endVal) {
            return random.float((min = startVal), (max = endVal)) // uniform float in [ min, max )
        },
        randomInt: function (startVal, endVal) {
            return random.int((min = startVal), (max = endVal)) // uniform float in [ min, max )
        },
        randomBoolean: function () {
            return random.boolean();
        }
}

exports.data = randomMethods;