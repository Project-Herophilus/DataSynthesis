Return to the <a href="https://github.com/Project-Herophilus/DataSynthesis" target="_blank">Main DataSynthesis Page</a>

# DataTier-Node-APIs

There is no specific plans to ONLY have one technology for APIs. Currently, we are working on 
the best way to address and keep feature parity because we want to ensure that we dont limit 
technology. 

For these assets you will want to ensure you have the needed versions of Node, npm and yarn installed and working for 
your environment.

# Setting Up The Environment: Environment Variable
The biggest thing to understand is that all settings for this solution are done through environment variable. 
It is important to know that if you clone the repository the file  WILL NOT be included or created. We have
created a specific file that is intended to cover this specific implementation need as it will be universal
across all APIs. Please feel follow this link on the specific environment variables needed to succesfully
run the [APIs](EnvironmentalSetup.md).

# Kafka
An existing Kafka (or some flavor of it) up and running. Red Hat currently implements AMQ-Streams based on Apache 
Kafka; however, we have implemented iDaaS with numerous Kafka implementations. Please see the following files 
we have included to try and help: <br/>
*  [Kafka non Windows Implementations](https://github.com/Project-Herophilus/Project-Herophilus-Assets/blob/main/Kafka.md)<br/>
*  [Kafka Windows Implementation](https://github.com/Project-Herophilus/Project-Herophilus-Assets/blob/main/KafkaWindows.md) <br/>
No matter the platform chosen it is important to know that the Kafka out of the box implementation might require some changes depending
upon your implementation needs. Here are a few we have made to ensure: <br/>
In <kafka>/config/consumer.properties file we will be enhancing the property of auto.offset.reset to earliest. This is intended to enable any new
system entering the group to read ALL the messages from the start. <br/>
auto.offset.reset=earliest <br/>
* Something to view Kafka topics with as you are developing and a potential interface for production when and if needed.
  Depending on your Kafka implementation can make this a non-issue; however, we wanted to make you aware of this need
  as being able to see data in every component natively is key for validating and implementing any solution. There are
  several open or inexpensive options to chose from and within the community we have used all of them below with success.
    - Open Source and Web based: [Provectus](https://github.com/provectus/kafka-ui)
    - Open Source and Web based: [Kafdrop](https://github.com/obsidiandynamics/kafdrop)
    - Open Source and Web based: [Kowl](https://github.com/redpanda-data/kowl)
    - Desktop Based and Paid Product after trial: [Offset Explorer](https://www.kafkatool.com/)

# Pre-Requisites - Node v <= 16
This section is intended to help with any pre-requisites and we have tried to make them as
specific to OS as we can. In general, we have developed and tested this code with NodeJS versions: 12, 14, 16 and 17.
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

