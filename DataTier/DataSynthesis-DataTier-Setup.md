# DataSynthesis Data Tier Setup
This is very specific to data technologies we support. If we highlight a database version
going below our outside the recommendation is not something we can help with. However,
if you want to port it and put a pull request for other RDBMS or NoSQL data Technologies
we welcome the assistance.

## MariaDB 10.x / MySQL 8

### Reusable Assets
In order to enable resources to have independence we have included several directories
underneath the DataTier/MySQL directory as follows:

- MySQL-DataSeeding: We have published all the files needed to load the database (or you
can use the dump file). We have used both ways. This directory contains all the SQL files and a
configured source load script. You will find two specific sub directories here DataSynthesis-Load-Full which
has billions of attributes generically created and able to help you jump start and DataSynthesis-Load-Small
the is a much smaller footprint designed typically for container based implementations looking to leverage and test
the platform. Either way using the APIs and platform it is extensible. We recommend you use the latest versioned scripts
for loading activities. We have also included a <version>-Linux for all other than Windows operating systems. The scripts
could take some work to setup based on security and environment!!!
- MySQL-DDL: We publish all every export of the database we do as a complete DDL
- MySQL-DBDumps: Single dump files that can be restored to help with setting up the
database with all the data.

### Install and Configuration
We have worked with 8.0.x on Windows, Linux and Mac and we do not require any
custom configurations or add-ons. So any resource for your environment we would consider accurate and adequate.
Also, we will leave securing the RDBMS layer to your liking and requirements!!!

### Setup DataSynthesis
1. Get the latest DDL, it is easy to read as they are organized by year and dated as well>
Use whatever technology you are comfortable with to import the DDL.
2. Restore the Dump file or Use the Data Load files to update the database with data.
   3. The key starting point if you are doing data loading then the place to start
   is Reference Data and the order of importing these into the database is specifically numbered.
3. Loading the rest of the data can be done in any order after you load the Reference
Data.