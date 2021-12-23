# DataTier-DataBuilder

While there are long term plans to build out several different types and forms of Data Builders the current implementation is done in JavaScript and provides the ability to provide HL7 data specifically.



For these assets you will want to ensure you have the needed versions of Node, npm and yarn. 

# Pre-Requisites

## Key Node Packages
https://www.npmjs.com/package/infinispan
https://www.npmjs.com/package/kafkajs

# Settings
All the settings used are within a .env file structured as follows

```   
# Database Tech
database=mysql
# Database Setting
dbhost=hostname or ip
dbuser=username
dbpassword=password
db=datasynthesis
# Output
outputadapter=File
# Output Setting
```

## Mac
https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable

brew install nodejs
brew install npm
brew install yarn
brew upgrade <package>

## Running in IDE
The following section is intended to cover generic IDE and platform usage

### Updating packages
From command line in project directory or within IDE (depending upon capabilities of IDE)

yarn install

### Starting
npm start
nodemon start

