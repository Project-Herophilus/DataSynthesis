# DataModel General
This document is intented to specifically cover the data model.

## Technologies

As we discussed the initial data tier and model was built on SQL Server. This decision
candidly was made because I spent over a decade emersed in this technology. While it
helped us do wonderful work I made several errors because I made many decisions not
thinking about RDBMS portability. It was clear that we needed to focus on another data
technology and eventually backport the new data model to SQL Server when the time was 
right.

* RDBMS - Moved base from SQL Server 2017 to MySQL 8 /MariaDB. We will support other RDBMS with DDL scripts;
  however, it is the responsibility of partners implementers to build out the load scripts. We have these done
  that support MariaDB 10.x and MySQL 8 (or greater).
* Development Technologies - We make every attempt to leverage industry leading development technologies to 
  leverage our data tier. Currently, we have support for Quarkus and Node (Express). We also have implemented 
  .Net Core but will be revisiting it as time permits.
  
## Data Model - Fit for Purpose

As we looked to refocus we wanted to ensure the first thing we did as we revamped the entire data  
model was try and have clarity and ease of understanding. This is very important as it is the  
foundation for all efforts.

We also are now leveraging [Luqibase](https://www.liquibase.org/) for all database operations. While this is a learning effort this will help us long term version and track all database changes, enhancements 
and also enable us to migrate between different RDBMs technologies as we look to the future without manual maintenance.

### Naming Convention: DataPurpose
We wanted to have a reusable pattern for use of reading and understand *{datapurpose_}tablepurpose*

| Data Purpose | Details |
|:---|:---|
|auditing_(tablename)|Auditing data for platform|
|databuilt_(tablename)|Data built from existing and/or generated sources. Intended to be more structured data|
|dataexisting_(tablename)|Data from existing public sources|
|datagenerated_(tablename)|Data generated from code and managed through data generation configuration|
|platform_(tablename)|Any platform attributes or metadata|
|refdata_(tablename)|Platform reference data|
|termsdata_(tablename)|Terminology centric data for industry standards or persisting specific field level application level data |

### Naming Convention: TableName
We wanted to make sure that the table names were easy to understand their purpose. While
there is no easy pattern to leverage we tried to make the tablenames detailed enough to explain
their purpose

### Describing the Tables Purpose and Meaning
We added a means to explain anything to the datamodel within the data itself. This
was our catch all to ensure that even if interpretation was wrong we would define the
tables and all other datamodel aspects. Look at the datamodel_ tables and all the details
are contained within the data.
