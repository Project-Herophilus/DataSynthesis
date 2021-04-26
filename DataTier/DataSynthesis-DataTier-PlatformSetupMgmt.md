# DataSynthesis Data Model Platform Setup for Usage Readme
Now that we have given you a general rundown of the data tier amd
how to get the database setup it is important for usage as you go
to implement it.

# General Background Post Data Tier Setup
The platform data tier setup establishes several key reference and base data
for the platform. We have ensured we include required reference data and
a ton of existing and generated data to start. With all that being said
as you look to add your organization we wanted to provide you some details
and context as to how to ensure you maximize the platform and also use
it effectively.


# Order of Setting Things Up
1. Vendors - any company that has an application running in an Organization. It can be the
Organization; however, they must be defined as a vendor
2. Applications - anything that is producing data that you want to define data processing rules
for. DataSynthesis is provided to the database as a defualt application as it is producing data. The
key attribute created here is the Application GUID. This is used through out the platform for many purposes
3. Legal Entities - This is what will be referenced. This is separate because businesses
   are complex
4. Organizations - The specific locations dealing with ANY level of information
5. Data Attributes - Specific data artifacts at the lowest level the platform provides. These are things
like First Name, Last Name, Phone Number, Area Code, Phone Number, Drivers License Number, etc.
6. Data Structures - What you build from data attributes. Things like Full Name, Complete Address, Phone Number
and so forth
7. Platform Params - This is where parameters can be defined to specific attributes for more complex operations
8. Codeset - The baseline for where ANY custom codes live for ANY defined application, while there is a mention of Industry
Standard the standard can be custom as needed.
9. Terms - This leverages the codesets defined to pull in ANY specific codes that need to be leveraged into the platform.
By doing this we can focus on the specific codes and their description specific to a defined application for a specific
organization
10. Terms Codeset To Application Values - This is where the specific behind the data are captured so when data
will need to be generated we can make it real world based

