# DataSynthesis-Data Tier
This sections is ONLY attended to address all things specific to the DataSynthesis Data Tier. 
Te areas that constitute this section consist of:

# DataModel General
This document is intented to specifically cover the data model.

# Data Technologies
Our journey in the data technologies space has been a wonderful one with numerous ups and downs.
The initial data tier and model was built on SQL Server. This decision
candidly was made because the core team that started this effort spent over a decade emersed in this
specific technology. While it helped us do wonderful work we did made several errors because we made many decisions not
thinking about data portability and also preparing ourselves for other modern data technologies as well. In order for us to be more succesful it became clear that we needed to focus on
other data technologies. Based on some feedback we then quickly moved to MySQL 8 / MariaDB. While the technology is great
we did notice that in the specific RDBMS space the main first class data tier was clearly PostgresQL. Many companies
have taken the open source code and created offerings, cloud vendors all supported it and they were moving with
several cloud native offerings as well. So, in 2022 all core efforts will be focused around PostgresQL. Additionally, our core efforts will also include areas like SnowFlake (EDW), GraphQL and DataBricks as well.
It is important to note that we do anticipate numerous database enhancements with PostgresQL data mdoel through out 2022
before offering a cadense of multiple datamodels supported.

We make every attempt to leverage industry leading development technologies to
leverage our data tier. Currently, our APIs support for Quarkus and Node (Express). We also have implemented
.Net Core but will be revisiting it as time permits along with feedback from those implementing the platform.

# Data Tier - Overview
The following section covers various aspects of the data tier for DataSynthesis. As you can imagine
building any amount of complexities into any system can make future enhancements too complex or
cause delays in feature funcitoionality improvements in general. To try and make this platform extensible
we decided to categorize the data first by area and then focus on naming it from there. This simple
baseline has enabled us to continue expanding and enhancing the platform in a simple and quickl manner.
Below is a high-level visual of how we logically grouped data within the platform.
<br/>
![DataSynthesis High Level Data Flow](https://github.com/Project-Herophilus/Project-Herophilus-Assets/blob/main/images/DataSynthesis/DataSynthesis-Data-HighLevel.jpg)

## Data Model
As we looked to refocus we wanted to ensure the first thing we did as we revamped the entire data model was try and have
clarity and ease of understanding. This is very important as it is the foundation for all efforts.
The platform data tier setup establishes several key reference and base data for the platform. We
have ensured we include required reference data and a ton of existing and generated data
to start. With all that being said as you look to add your organization we wanted to provide you some details
and context as to how to ensure you maximize the platform and also use it effectively.

## Data Attributes
Data attributes are a critical core component of the platform. They are the lowest common attributes to the platform.
As we think about this aspect they can come from existing or generated data that exists within the platform. This data
is provided via base insert loader scripts and is provided this way only.

## Data Structures
This is all about Building out what complete data the platform can represent. The intent here is to take the data attributes
and create them into reusable structures. Some examples:
- Names: A combination of data attributes last name and first name.
- Address: A combination of street address and location data (City, State, Zip Code).
- Phone Number: A combination of an area code with a phone number
- Demographic Data: A Combination of First Name, Last Name, Street Address, Location (City, State and Zip code), Area Code,
  Phone Number, Drivers License....

## Platform Reference Data
Specific rules we want the platform to be able to process and maintain.

## Terminologies
Specific coded data and how we can enable it to be processed to enable more accurate and robust data processing.



## Naming Convention: Built Around Purpose
We wanted to make sure that the table names were easy to understand their purpose. While
there is no easy pattern to leverage we tried to make the tablenames detailed enough to explain
their purpose. Below is our explanation about the current reusable pattern we are currently using
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

### Describing the Tables Purpose and Meaning
We added a means to explain anything to the datamodel within the data itself. This
was our catch all to ensure that even if interpretation was wrong we would define the
tables and all other datamodel aspects.

| /Data Purpose        | Details                                                   |
|:---------------------|:----------------------------------------------------------|
| datamodel_domain     | Domains used in the data tier                             |
| datamodel_datatables | Detailed explanation of every table used in the data tier |
| datamodel_apis       | APIs explained by capability                              |



# Hierarchy/Order of Setting Things Up
After implementing the DDL and seeding the DDL with data provided you will have over 180B combinations
of usable data to start with. It might help to understand the internal corrlations of how the data needs to
be maintained to grow its capabilities and relevance for usage.

1. Vendors - any company that has an application running in an Organization, they must be defined as a vendor.
2. Legal Entities - This is intended to be a logical grouper by what facilities/stores/orgs are associated to this legal 
entity.
3. Organizations - The specific locations dealing with ANY level of information. This can be thought of a clinic, 
store, practice, and so forth.
4. Applications - anything that is producing data that you want to define data processing rules
   for. DataSynthesis is provided to the database as a defualt application as it is producing data. The
   key attribute created here is the Application GUID. This is used through out the platform for many purposes
5. Data Attributes - Specific data artifacts at the lowest level the platform provides. These are things
   like First Name, Last Name, Phone Number, Area Code, Phone Number, Drivers License Number, etc. These are 
provided by the load scripts and ANY messing with these will provide unknown platform behavior.
6. Data Structures - What you build from data attributes. Things like Full Name, Complete Address, Phone Number
   and so forth. These are provided by the load scripts and can be extended based on imlementation or data needs.
7. Codesets - The baseline for where ANY custom codes live for ANY defined application, while there is a mention of Industry
   Standard the standard can be custom as needed.
8. Terms - This leverages the codesets defined to pull in ANY specific codes that need to be leveraged into the platform.
   By doing this we can focus on the specific codes and their description specific to a defined application for a specific
   organization
9. Terms Codeset To Application Values - This is where the specific details like code and description or code and 
complex data attributes are captured so when data  will need to be generated we can make it real world based. This 
is ALWAYS built upon the Organization and Application sending the data.

# Next Steps

| Area                                                                                                     | Description                                                                                                                         | 
|----------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| Backups                                                                                                  | Database Backups By Technology                                                                                                      | 
| [DataTier](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier/README.md)             | All Things needed to load a data tier with the needed data, focus is PostgresQL centric assets but loader files are basic sql inserts | 
| [Data Tier DDLs](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier/DDLs/README,md ) | Database Defintion Language for Data Tier Technologies that are seperated by directories per specific technology                    | 
| [SQL](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier/SQL)                        | Helpful SQL queries to do certain activities within the platform | 



Stay safe, stay strong and carry on!!! Happy Coding!!!!