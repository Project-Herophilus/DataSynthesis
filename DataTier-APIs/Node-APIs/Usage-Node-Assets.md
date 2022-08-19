# Node-Assets
Within the Node-API efforts there are a set of node assets that can be run from the command line on any 
machine where these are implemented.  

# Pre-Requisites
- Node installed and configured to work from command line or IDE
- Based on your OS the environment variables set. We have multiple ways we have seen these implemented through
implementations.
- The code repo cloned

# Assets
The following are the command line assets that can run and what they are designed for. These assets will automatically
output to whatever is defined within the environment variable named outputAdapter. 

Values for outputAdapter are: kafka kafka-datapersistence file rdbms nosql. The most commonly used and established
ones are kafka-persistence and file.

| Node Implementation Type                 | Description                                                         |
|------------------------------------------|---------------------------------------------------------------------| 
| generatedata_dataattributes.js           | Ability to generate data attriubutes for platform                   |
| generatedata_datastructures.js           | Ability to generate data structures for platform                    |
| generatedata_industrystds.js             | Ability to generate industry standards data from platform           |
| mgmt_automtd_dataattribute_generation.js | Ability to leverage an automated data generator for data attributes | 
| randomdata_queries.js                    | Ability to generate data structures for platform                    |

## Usage
In this section we will provide some specific examples, these are not exhaustive as there are several 
hundred plus ways as these assets are very extensible.

### Generate Data Attributes
This provides the SAME capabilities as the API for generating data attributes found at: 
/api/generatedata/generate/<attributename>?limit=xxx

There are two arguments, one is specific and required the second one if not included will be defaulted to the runQuantity
environment variable.

node generatedata_dataattributes.js <attributename> <quantity>

1. Generate accountnumbers with the included regular expression. This will use the environment variable quantity
defined within the runQuantity.

node generatedata_dataattributes.js accountnumbers

2. Generate accountnumbers with the included regular expression. This will generate 525 records.

node generatedata_dataattributes.js accountnumber 525

### Generate Data Structures
This provides the SAME capabilities as the API for generating data attributes found at:
/api/generatedata/generatedatastructures/namedstructure?count=3250&datastructurename=Person Demographics

There is only argument, the quantity generated will be based on the runQuantity environment variable.

node generatedata_datastructures.js <datastructure name>

1. Generate Person Demographics 

node generatedata_datastructures.js "Person Demographics"

### Generate Industry Standards
This provides the SAME capabilities as the API for generating data attributes found at:
/api/industrystds/generator-hl7?count=100

There are two arguments, one is specific and required the second one if not included will be defaulted to the runQuantity
environment variable.

generatedata_industrystds.js <industrystd> <quantity>

1. Generate 500 HL7 Messages

generatedata_industrystds.js hl7 500

### Automated Data Attribute Generation
There is NO API that provides this capability overall, the functionality is available per data attribute within the developed
APIs; however, this is intended to be run and as long as it is running creating data attirbutes as defined within the 
management subsystems. The definition also has the quantity, so it is intended to be an all encompassing record.

FYI: as of this content creation this was in place but not fully developed!!

node mgmt_automtd_dataattribute_generation.js

