# DataTier-Node-APIs

There is no specific plans to ONLY have one technology for APIs. Currently, we are working on 
the best way to address and keep feature parity because we want to ensure that we dont limit 
technology. 

For these assets you will want to ensure you have the needed versions of Node, npm and yarn installed and working for your environment.

# Settings
The biggest thing to understand is that all settings for this are contained within a .env file. It is important to know 
that if you clone the repository the file  WILL NOT be included or created. You must manually create a .env file and 
the settings used are defined below.

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

# Pre-Requisites

## Mac
We have many users specifically leveraging Macs
https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable

brew install nodejs <br/>
brew install npm <br/>
brew install yarn <br/>
brew upgrade <package> <br/>

# Windows
Find the download from https://nodejs.org/en/download/ and install it.

# Linux
Depending on your flavor of Linux you will find the needed downloads
https://nodejs.org/en/download/ or within your Linux implementation.

## Node
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

# IDE or Command Line Experience
If you are wanting to leverage the libraries and look at the code from a development experience perspective, then either
having all the proper node 

## Running in IDE
The following section is intended to cover generic IDE and platform usage

### Starting the Solution 
Always make sure you have updated the packages first

To start the solution from the command line at the project level simply type:
```
npm start 
```

Or, if you want to work with it locally and potentially enhance it then from the base project level type:
```
nodemon app.js
```

To access specific features there are set of ways these can be accessed.




# Testing APIs 
To help enable resources to leverage the APIs we have pre-built and are continuing to enhance a set of PostMan APIs. 
The intent is to that anyone can see how the APIs can be leveraged simply and directly.

https://www.postman.com/balanscott/workspace/datasynthesis/collection/16526170-6e45e3ca-8eaf-47c9-a0cb-0e024a852505


Happy Coding

