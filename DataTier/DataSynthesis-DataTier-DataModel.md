# DataSynthesis DataModel
The following content is designed to specifically break up the datamodel into a few key areas.

The platform data tier setup establishes several key reference and base data for the platform. We 
have ensured we include required reference data and a ton of existing and generated data 
to start. With all that being said as you look to add your organization we wanted to provide you some details
and context as to how to ensure you maximize the platform and also use it effectively.

# Key Groupings for DataSynthesis
As with any data model/ data tier how data is logically constructed is key, it determines so many things like 
extensibility and viability of overall platform.

## Data Attributes
Data attributes are a critical core component of the platform. They are the lowest common attributes to the platform. 
As we think about this aspect they can come from existing or generated data that exists within the platform. This data 
is provided via base insert loader scripts and is provided this way only. 

Here are some key points to understand:
- dataexisting - all existing data is intended to be provided as is and was from a source, a series of sources, that 
was at some time or still is pubicly available data. Aside from names (last and first names) there is NO MEANS provided
by the platform to add tp this data, you most certainly can build your own but the platform does not provide it.
- datagenerated - This data is all about critical data elements that are needed typically to support various implementations 
types depending upon business needs like: social security numbers, drivers license numbers, bank account numbers, 
credit card numbers, phone numbers, street addresses and so forth. A key capability the platform has built in is supporting the accurate generation
of the data as well. Whether it is the correct format for state specific drivers license numbers, industry standard
credit card numbers and the like we have done our best to make sure the data generated is meaningful. As it also infers
data generated means that the platform comes with APIs capable of generating data based on how the platform is configured 
for this need. The setup for this is done by data attribute.

## Data Structures
This is all about Building out what complete data the platform can represent. The intent here is to take the data attributes
and create them into reusable structures. Some examples:
- Names: A combination of data attributes last name and first name.
- Address: A combination of street address and location data (City, State, Zip Code).
- Phone Number: A combination of an area code with a phone number
- Demographic Data: A Combination of First Name, Last Name, Street Address, Location (City, State and Zip code), Area Code,
Phone Number, Drivers License....

Hopefully, this shows you the power of what can be created from data attributes...

## Platform Reference Data
Specific rules we want the platform to be able to process and maintain.

## Terminologies
Specific coded data and how we can enable it to be processed to enable more accurate and robust data processing.

# Hierarchy/Order of Setting Things Up
After implementing the DDL and seeding the DDL with data provided you will have over 180B combinations
of usable data to start with. It might help to understand the internal corrlations of how the data needs to 
be maintained to grow its capabilities and relevance for usage.

1. Vendors - any company that has an application running in an Organization, they must be defined as a vendor.
2. Legal Entities - This is intended to be a logical grouper by what facilities/stores/orgs are associated to this legal entity.
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

