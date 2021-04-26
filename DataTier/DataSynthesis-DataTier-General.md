# DataModel General
This document is intented to specifically cover the data model.

## Technologies

As we discussed the initial data tier and model was built on SQL Server. This decision
candidly was made because I spent over a decade emersed in this technology. While it
helped us do wonderful work I made several errors because I made many decisions not
thinking about RDBMS portability. It was clear that we needed to focus on another data
technology and eventually backport the new data model to SQL Server when the time was 
right.

* RDBMS - Move from SQL Server 2017 to MySQL 8
* Development Technologies - Take the .Net Core assets developed and move them to another
technology or technologies.
  
## Data Model - Fit for Purpose

As we looked to refocus we wanted to ensure the first thing we did as we revamped the entire data  
model was try and have clarity and ease of understanding. This is very important as it is the  
foundation for all efforts.

We also are now leveraging [Luqibase](https://www.liquibase.org/) for all database operations. While this  
is a learning effort this will help us long term version and track all database changes, enhancements  
and also enable us to migrate between different RDBMs technologies as we look to the future without manual maintenance.

### Naming Convention: DataPurpose
We wanted to have a reusable pattern for use of reading and understand *{datapurpose_}tablepurpose*

| Data Purpose | Details    |
|:---|:---|
|auditing|Auditing data for platform|
|databuilt|Data built from existing and/or generated sources. Intended to be more structured data|
|dataexisting|Data from existing public sources|
|datagenerated|Data generated from code and managed through data generation configuration|
|platform|Any platform attributes or metadata|
|refdata|Platform reference data|
|termsdata|Terminology centric data for industry standards or persisting specific field level application level data |

### Naming Convention: TableName
We wanted to make sure that the table names were easy to understand their purpose. While
there is no easy pattern to leverage we tried to make the tablenames detailed enough to explain
their purpose

### Describing the Tables Purpose and Meaning
We added a means to explain anything to the datamodel within the data itself. This
was our catch all to ensure that even if interpretation was wrong we would define the
tables and all other datamodel aspects. Look at the datamodel_ tables and all the details
are contained within the data.
