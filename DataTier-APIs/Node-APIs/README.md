# DataTier-Node-APIs

There is no specific plans to ONLY have one technology for APIs. Currently, we are working on 
the best way to address and keep feature parity because we want to ensure that we dont limit 
technology. 

For these assets you will want to ensure you have the needed versions of Node, npm and yarn installed and working for 
your environment.

# Settings
The biggest thing to understand is that all settings for this solution are done through environment variable. 
It is important to know that if you clone the repository the file  WILL NOT be included or created. 

Here is the real world example of the environment variables:

```   
# Platform Settings
export httpPort=8001
export runQuantity=7500
# Auditing
export auditing=false
export auditingTopicName=kic_appintgrtntransactions
# Output values: kafka kafka-datapersistence file rdbms nosql
export outputAdapter=kafka-datapersistence
# Output Setting
export edi_location=undefined
export fhir_location=undefined
export hl7_location=undefined
# Kafka Settings
export kafka_server=localhost:9092
export kafka_group=undefined
export KAFKA_CONSUMER_TOPIC= undefined
export KAFKA_PRODUCE_TOPIC=undefined
export kafka_client_id="1234"
# Database Tech
export rdbms=postgreSQL
# Postgres Database Setting
export dbURL=postgres://postgres:Developer123@localhost:5432/datasynthesis
# MySQL/MariaDB Database Setting
export dbHost=127.0.0.1
export dbPort=1234
export dbUser=root
export dbPassword=Developer123
export dbName=datasynthesis
# Vendor Centric Settings
# iDaaS
export iDaaS_FHIR_Server_URI=undefined
export iDaaS_Cloud=true
export iDaaS_DataSymthesis_Kafka=idaas_datasynthesis
```

# Pre-Requisites - Node v > 12
This section is intended to help with any pre-requisites and we have tried to make them as
specific to OS as we can.

In general, we have developed and tested this code with NodeJS versions: 12, 14, 16 and 17.
With versions above 16 there are some additional commands to run before starting anything.

## Mac
We have many users specifically leveraging Macs, please follow this link:
https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable

brew install nodejs <br/>
brew install npm <br/>
brew install yarn <br/>
brew upgrade <package> <br/>

## Windows
Find the download from https://nodejs.org/en/download/ and install it.

## Linux
Depending on your flavor of Linux you will find the needed downloads
https://nodejs.org/en/download/ or within your Linux implementation.

# Node
We always prefer to be very close to the latest Node and Project releases as their are constant performance and security
enhancements occuring within the technology. 

### Updating packages
From command line at the project directory level or within IDE (depending upon capabilities of IDE) simply run:
```
npm install
```
or
```
yarn install
```

# Command Line Experience
From a command line you can follow the following common commands to use the Node APIs. 

## Installing/Updating Needed Packages
Always make sure you have either install or updated the packages first:

Install:

```
npm install
```

Upgrade:

```
npm upgrade
```

## Starting the Solution
Always make sure you have either install or updated the packages first:

To start the solution from the command line at the project level simply type:
```
npm start 
```

Or, if you want to work with it locally and potentially enhance it then from the base project level type:
```
nodemon app.js
```

## Running in IDE
The following section is intended to cover generic IDE and platform usage. To date though as long as IDEs have been 
setup and are working with Node then we have seen no issues. 

# Implementation and Usage
The capabilities delivered through this code base are extensive, below is a series of links to help guide specific 
implementation needs and usage based scenarios. Within the capabilities provided by the developed Node-APIs.

| Node Implementation Type | Description                                                            |
|--------------------------|------------------------------------------------------------------------| 
|[Node Usage](Usage-Node-Assets.md)| Assets developed to provided DataSynthesis platform.                   |
|[Node APIs](Usage-Node-APIs.md)  | APIs developed to provided DataSynthesis data access and functionality |    

# Testing APIs 
To help enable resources to leverage the APIs we have pre-built and are continuing to enhance a set of PostMan APIs. 
The intent is to that anyone can see how the APIs can be leveraged simply and directly.

https://go.postman.co/workspace/DataSynthesis~6a46c0cf-955b-49b4-b495-68940fde4c31/collection/16526170-6e45e3ca-8eaf-47c9-a0cb-0e024a852505?action=share&creator=16526170

Happy Coding

