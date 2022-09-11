Return to the <a href="https://github.com/Project-Herophilus/DataSynthesis" target="_blank">Main DataSynthesis Page</a>

# DataSynthesis-Data Tier
This document is intented to specifically cover the data model. This platform now uses PostgresQL, any version above 
10.x has been used and we have not seen any issues currently. Additionally, our core efforts will also work to include 
areas like SnowFlake (EDW) and eventually MongoDB as well. 

# Data Tier - Overview
The following section covers various aspects of the data tier for DataSynthesis. As you can imagine
building any amount of complexities into any system can make future enhancements too complex or
cause delays in feature functionality improvements in general. To try and make this platform extensible
we decided to categorize the data first by area and then focus on naming it from there. This simple
baseline has enabled us to continue expanding and enhancing the platform in a simple and quick manner.
Below is a high-level visual of how we logically grouped data within the platform.
<br/>
![DataSynthesis High Level Data Flow](https://github.com/Project-Herophilus/Project-Herophilus-Assets/blob/main/images/DataSynthesis/DataSynthesis-Data-HighLevel.jpg)

## Area of Data Coverage
We wanted to make sure that the table names were easy to understand and their names reflected their purpose. While
there is no easy pattern to leverage we tried to make the tablenames detailed enough to explain their purpose.
Below is our explanation about the current reusable pattern we are currently using
*{datapurpose_}tablepurpose*

| Data's Purpose | Details |
|:---|:---|
|databuilt_(tablename)|Data built from existing and/or generated sources. Intended to be more structured data|
|dataexisting_(tablename)|Data from existing public sources|
|datagenerated_(tablename)|Data generated from code and managed through data generation configuration|
|impl_(tablename)|Data used specific to the implementation for using DataSynthesis|
|platform_(tablename)|Any platform attributes or metadata|
|refdata_(tablename)|Platform reference data|
|termsdata_(tablename)|Terminology centric data for industry standards or persisting specific field level application level data |

## Describing the Tables Purpose and Meaning
We added a means to explain anything to the datamodel within the data itself. This was our catch all to ensure that 
even if interpretation was wrong we would define the tables and all other datamodel aspects.

| Data Purpose         | Details                                                   |
|:---------------------|:----------------------------------------------------------|
| datamodel_domain     | Domains used in the data tier                             |
| datamodel_datatables | Detailed explanation of every table used in the data tier |
| datamodel_apis       | APIs explained by capability                              |

# Key Data Tier Concepts
Now that you have read through and become familiar with the existing data tier and have some general background there 
are some key concepts that we should ensure are conveyed.

## Data Attributes
Data attributes are a critical core component of the platform. They are the lowest common attributes to the platform.
As we think about this aspect they can come from existing or generated data that exists within the platform. To seed the 
platform and instantly get billions of data attributes within minutes you simply need to implement the latest DDL and 
run the base loader scripts that are provided. <br/>

Why did we build the platform this way:<br/>
*By doing this the platform is able to leverage the simple math and use mutliplication to grow the amount of attributes 
we have available within the platform. Some very simple examples to showcase this are below:<br/>*
*- names: are a construct of minimally firstname and lastname, if you have 1000 first names and 1000 lastnames how many names
do you have? Answer: You have 1M Unique names* <br/>
*- phone numbers: are a construct of area code/geographical area (by country) and numbers, if you have 43000 area codes and 
20000 phone numbers how many phone numbers do you have? Answer: You have 860M unique phone numbers*

## Data Structures
This is all about building out what you need by putting together data attributes can easily construcr. The intent here 
is to take the data attributes and create them into reusable structures. Some examples are:
- Names: A combination of data attributes last name and first name.
- Address: A combination of street address and location data (City, State, Zip Code).
- Phone Number: A combination of an area code with a phone number
- Demographic Data: A Combination of First Name, Last Name, Street Address, Location (City, State and Zip code), Area Code,
  Phone Number, Drivers License....

## DataBuilt / DataExisting / DataGenerated
This is the highest level for the data we are using.

| Name           | Defined Purpose                                                                                                                                                              |
|:---------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| databuilt      | Data that is built from data structures                                                                                                                                      |
| dataexisting   | Data that is vital to generated data but is pubicly available like area codes, zipcodes, etc.                                                                                |
| datagenerating | Data that is created from any generator within the platform internally. These can come from simply regular expressions or publicly provided formats like US Drivers licenses |

The ONLY except to dataexisting where data can be upserted into this structure is dataexisting_lastnames and dataexisting_firstnames
as these were only seeded from public sources and we know thay implementations can have more names that this.

## Implementation Data
Specific data used to support your customizable implementation of the data platform for your needs. <br/>
*There is base loader of implementation data that is loaded to support a very nice base implementation*

## Platform Reference Data
Base core data used across the platform and provided to support its overall usage and health.<br/>
*There is base loader of implementation data that is loaded to support a very nice base implementation*

## Terminologies
Specific coded data and how we can enable it to be processed to enable more accurate and robust data processing.<br/>
*There is base loader of implementation data that is loaded to support a very nice base implementation*

# Hierarchy/Order of Setting Things Up
It might help to understand the internal corrlations of how the data needs to be maintained to grow its capabilities 
and relevance for usage. The items in the bulleted list are intended to be completed in order from top to bottom.

- Vendors - any company that has an application running in an Organization, they must be defined as a vendor. 
- Legal Entities - This is intended to be a logical grouper by what facilities/stores/orgs are associated to this legal 
entity. 
- Organizations - The specific locations dealing with ANY level of information. This can be thought of a clinic, 
store, practice, and so forth. 
- Applications - anything that is producing data that you want to define data processing rules
   for. DataSynthesis is provided to the database as a defualt application as it is producing data. The
   key attribute created here is the Application GUID. This is used through out the platform for many purposes 
- Data Attributes - Specific data artifacts at the lowest level the platform provides. These are things
   like First Name, Last Name, Phone Number, Area Code, Phone Number, Drivers License Number, etc. These are 
provided by the load scripts and ANY messing with these will provide unknown platform behavior.
- Data Structures - What you build from data attributes. Things like Full Name, Complete Address, Phone Number
   and so forth. These are provided by the load scripts and can be extended based on imlementation or data needs. 
- Codesets - The baseline for where ANY custom codes live for ANY defined application, while there is a mention of Industry
   Standard the standard can be custom as needed. 
- Terms - This leverages the codesets defined to pull in ANY specific codes that need to be leveraged into the platform.
   By doing this we can focus on the specific codes and their description specific to a defined application for a specific
   organization 
- Terms Codeset To Application Values - This is where the specific details like code and description or code and 
complex data attributes are captured so when data  will need to be generated we can make it real world based. This 
is ALWAYS built upon the Organization and Application sending the data.

# Next Steps

| Area                                                                                                                   | Description                                                                                                                         | 
|------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| [Data Tier DDLs](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier/DatabaseDefintions/README,md ) | Database Defintion Language for Data Tier Technologies that are seperated by directories per specific technology                    | 
| [APIs](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier-APIs/README,md )                         | Database Defintion Language for Data Tier Technologies that are seperated by directories per specific technology                    | 
| [SQL](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier/SQL)                                      | Helpful SQL queries to do certain activities within the platform | 


Stay safe, stay strong and carry on!!! Happy Coding!!!!