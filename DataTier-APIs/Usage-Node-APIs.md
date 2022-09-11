# Node-APIs
This document is specific to Node-APIs.

# Pre-Requisites
The best reference is the content located within the 
[README.md within the DataTier-APIs/Node-APIs](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier-APIs/Node-APIs/README.md).

# Implementation/Usage
From an implementation perspective the key first step before using any APIs is understanding 
them and learning. We DO NOT have any Swagger content built for the Node APIs yet; however,
we have public a Postman collection that can be used.

## Testing APIs
To help enable resources to leverage the APIs we have pre-built and are continuing to enhance a set of PostMan APIs.
The intent is to that anyone can see how the APIs can be leveraged simply and directly.

The APIs have a folder hiearchy. Underneath, the Node-APIs folder you will see several subfolders.

| Area                              | Sub-Module                                                                                                                           | 
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Data Generation - Data Attributes | APIs intended to enable the generation of data attributes                                                                            | 
| Data Generation - Data Structures | API to generate defined complex data structures                                                                                      |
| Platform Queries - Random Data |APIs that return randomized data |
|Platform Queries - By Platform Sub System| This has a series of sub-folders that align to the key data categories. Within each of the sub-directores are all the needed queries |
|IndustyryStd-DataGenerator| Data Generation capabilities for industry standard data                                                                              |                                                                                            |

Steps:
1. [Access The Postman Collection](https://go.postman.co/workspace/DataSynthesis~6a46c0cf-955b-49b4-b495-68940fde4c31/collection/16526170-6e45e3ca-8eaf-47c9-a0cb-0e024a852505?action=share&creator=16526170)
2. Setup your environment variables by selecting the Local Server Environment variables and the report with an eye right next to it.
You will need to set these to the same settings you have for your implementation.
3. Select Node-APIs folder and select the Category of API you want to test. 

Happy Coding