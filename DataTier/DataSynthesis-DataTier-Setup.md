# DataSynthesis Data Tier Setup
This is very specific to data technologies we support. If we highlight a database version
going below our outside the recommendation is not something we can help with. However,
if you want to port it and put a pull request for other RDBMS or NoSQL data Technologies
we welcome the assistance.

### Reusable Assets
In order to enable resources to have independence we have included several directories
underneath the DataTier directory as follows:

- DDL: We publish all every export of the database we do as a complete DDL
- DataLoaders: We recommend you use the latest versioned scripts
for loading activities. We have also included a <version>-Linux for all other than Windows operating systems. The scripts
could take some work to setup based on security and environment!!!
- DataTier-Visuals: Key visuals on how the DataSynthesis platform is designed.
- EmbeddedDBs: Several embedded DBs
   
### Install and Configuration
While we have several RDBMS exports the core of our work has happened with MariaDB 10.x and MySQL 8.0.x on Windows, Linux and Mac and we do not require any
custom configurations or add-ons. So any resource for your environment we would consider accurate and adequate.
Also, we will leave securing the RDBMS layer to your liking and requirements!!!

### Setup DataSynthesis
1. Get and import the DDL. These are organized by RDBMS or Data Warehouse technology.
2. Use the Data Load files to update the database with data.
   
Now, you are ready to go in using DataSynthesis!!!! Start accessing the data via queries or via the [DataSynthesis APIs](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier-APIs). 
