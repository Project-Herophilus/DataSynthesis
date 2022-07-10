# DataSynthesis Data Tier Setup
This is very specific to data technologies we support. If we highlight a database version
going below our outside the recommendation is not something we can help with. However,
if you want to port it and put a pull request for other RDBMS or NoSQL data Technologies
we welcome the assistance.

## Reusable Assets to Help
In order to enable resources to have independence we have included several directories
underneath the DataTier directory as follows:

- DDL: We publish updates when we do database updates, enhancements or fixes. We used to have several RDBMS, Embedded and
and Data Warehouse included; however, we now only have PostgreSQL as of Feb 2022. If you have a need to convert the database to a different RDBMS you can work with us or use
one of many common database management tools like RazorSQL.
- DataLoaders: We recommend you use the latest versioned scripts
for loading activities. We have also included a <version>-Linux for all other than Windows operating systems. The scripts
could take some work to setup based on security and environment!!!
   
## Install and Configuration
With our implementations there have been numerous implementations of PostgresQL RDBMS has been tested on multiple
platforms: Windows, Linux (multiple types - Ubuntu, Fedora, RHEL, CentOS and AlmaLinux) and Mac. The platform 
does not require any custom configurations but does implement the pgcrypto extension. So any resource for your environment we would consider accurate and adequate. Also, we will leave securing the RDBMS 
layer to your business standards and requirements!!!

### Setup DataSynthesis Databases
1. Get and import the DDL. 
2. Use the Data Load files to update the database with data. We currently ONLY have scripts and test MySQL and PostgresQL
and after January 15, 2022 testing of PostgresQL.

## DataSynthesis Data Tier
Now, you are ready to go in using DataSynthesis!!!! Start accessing the data via queries or via the
[DataSynthesis DataTier General](https://github.com/Project-Herophilus/DataSynthesis/blob/main/DataTier/DataSynthesis-DataTier-DataModel.md)

### Testing DataSynthesis
Now, you are ready to go in using DataSynthesis!!!! Start accessing the data via queries or via the
[DataSynthesis APIs](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier-APIs). 
