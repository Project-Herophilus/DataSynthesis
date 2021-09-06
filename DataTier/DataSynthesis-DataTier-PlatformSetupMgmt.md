# DataSynthesis Data Model Platform Setup for Usage Readme
Now that we have given you a general rundown of the data tier amd
how to get the database setup it is important for usage as you go
to implement it.

The platform data tier setup establishes several key reference and base data
for the platform. We have ensured we include required reference data and
a ton of existing and generated data to start. With all that being said
as you look to add your organization we wanted to provide you some details
and context as to how to ensure you maximize the platform and also use
it effectively.

# Hiarchy/Order of Setting Things Up
Having installed the DDL and loaded the data into your platform now it might help to understand the 
hiarchy of how the data is used.

1. Vendors - any company that has an application running in an Organization, they must be defined as a vendor.
2. Legal Entities - This is intended to be a logicl grouper by what facilities/stores/orgs are associated to this legal entity. 
3. Organizations - The specific locations dealing with ANY level of information. This can be thought of a clinic, store, practice, and so forth.
4. Applications - anything that is producing data that you want to define data processing rules
for. DataSynthesis is provided to the database as a defualt application as it is producing data. The
key attribute created here is the Application GUID. This is used through out the platform for many purposes
5. Data Attributes - Specific data artifacts at the lowest level the platform provides. These are things
like First Name, Last Name, Phone Number, Area Code, Phone Number, Drivers License Number, etc. These are provided by the load scripts and ANY messing with these will provide unknown platform behavior. 
6. Data Structures - What you build from data attributes. Things like Full Name, Complete Address, Phone Number
and so forth. These are provided by the load scripts and can be extended based on imlementation or data needs. 
7. Codesets - The baseline for where ANY custom codes live for ANY defined application, while there is a mention of Industry
Standard the standard can be custom as needed.
8. Terms - This leverages the codesets defined to pull in ANY specific codes that need to be leveraged into the platform.
By doing this we can focus on the specific codes and their description specific to a defined application for a specific
organization
9. Terms Codeset To Application Values - This is where the specific details like code and description or code and complex data attributes are captured so when data
will need to be generated we can make it real world based. This is ALWAYS built upon the Organization and Application sending the data.

