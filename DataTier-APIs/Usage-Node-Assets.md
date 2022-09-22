# Node-Assets
Within the Node-API efforts there are a set of node assets that can be run from the command line on any 
machine where these are implemented.  

# Pre-Requisites
The best reference is the content located within the
[README.md within the DataTier-APIs/Node-APIs](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier-APIs/Node-APIs/README.md).

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

### Reference Charts
The following are references for specific attributes the node assets can except.

#### Data Attributes
Below are the following data attributes.

|Attribute Name |Attribute Details|
|----------------|-------------|
|address-us|US Addresses         |
|bankaccount|Bank Account Numbers|
|creditcards|Credit Card Numbers|
|dobs|Date of Births|
|dln|Driver License Numbers|
|eins|Employer Identification Numbers|
|phonenumber-us|US Phone Numbers|
|phonenumber-intl|International Phone Numbers (expected January 2023|
|serialnumbers|Generate specific regular expression based set of serial numbers|
|ssns|Social Security Numbers|
|useridentities|User Identities based on specific regular expression|

#### Industry Standards
Below are the following data attributes.

| Industry Std |
|--------------|
| hl7          |

# Assets with Examples
Below are the specific assets and some examples

## Attributes
This provides the SAME capabilities as the API for generating data attributes found at: 
/api/generatedata/generate/<attributename>?limit=xxx

- The attributename list us above in the Reerence Charts->Data Attributes Chart.

There are two arguments, one is specific and required the second one if not included will be defaulted to the runQuantity
environment variable.

node generatedata_dataattributes.js <attributename> <quantity>

Examples:
1.Generate accountnumbers with the included regular expression. This will use the environment variable quantity
defined within the runQuantity.
```
node generatedata_dataattributes.js accountnumbers
```
2. Generate accountnumbers with the included regular expression. This will generate 525 records.
```
node generatedata_dataattributes.js accountnumber 525
```

## Generate Data Structures
This provides the SAME capabilities as the API for generating data attributes found at:
/api/generatedata/generatedatastructures/namedstructure?count=3250&datastructurename=Person Demographics

There is only argument, the quantity generated will be based on the runQuantity environment variable.
In order to get the defined data structures based on your implementation you will need to query the
platform_config_datastructures table and the needed names are the datastructurename field.

node generatedata_datastructures.js <datastructure name>

Examples:
1. Generate Person Demographics 
```
node generatedata_datastructures.js "Person Demographics"
```

## Generate Industry Standards
This provides the SAME capabilities as the API for generating data attributes found at:
/api/industrystds/generator-hl7?count=100

- The attributename list us above in the Reerence Charts->Data Attributes Chart.

There are two arguments, one is specific and required the second one if not included will be defaulted to the runQuantity
environment variable.
generatedata_industrystds.js <industrystd> <quantity>

Examples:
1. Generate 500 HL7 Messages
```
generatedata_industrystds.js <industry_std> <message count> <state_code> <MESSAGE TYPE> <EVENT TYPE>
```

## Automated Data Attribute Generation
There is NO API that provides this capability overall, this specifically functionality is 
intended 

Examples:
```
node mgmt_automtd_dataattribute_generation.js
```

