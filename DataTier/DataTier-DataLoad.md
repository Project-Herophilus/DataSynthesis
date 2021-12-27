# DataSynthesis Loading Seeded Data
The easiest thing we could have done is make this a complete SaaS based offering. We are cognizant of the potential for partners to build out potential services 
offering down the road. We also want to ensure that organizations can have control of the data.

# Data Loading 
While we focus a lot on MariaDB / MySQL all the data load files are nothing more than insert into files.The scripts for simplicity are not hard coded and we do our best to test on multiple OS'es with the core databases that our teams use. However, with OS and RDBMS security enhancements always keep in mind there might be changes needed. The intent of the Data Seeeding is to support loading all the data we provide, if you wish to reduce the loaded data feel free to customize them. As with everything we do we keep the complete history so everyone can see the work that has been done.

## Postgres
Starting in 2022 all development efforts and core database work will be done against Postgres as the main database.
We will still continue to export DDLs for other databases. However, as with every effort these as a best effort unless otherwise 
specifically stated.

### Pre-Requisites
Make sure you have all the tools needed installed and configured for usage.

1. After cloning the DataSynthesis repository.
2. Load up a command prompt - You can also use the pqsql command prompt. You will just need
   to manually change directories to the base directory location where the load scripts is.

#### Mac
On the Mac we have had several users complain of inconsistent install experiences and not being able to have psql easily
accessible. For simplicity, we moved the psql.exe from the /Library/PostgresQL/<Version>/bin. For this example we will
use the command /Library/PostgresQL/14/bin/psql
1. For this example our directory is c:\Development\Project-Herophilus\DataSynthesis\DataTier\DataLoaders
2. We open up a command prompt and run the following command (based on your system and install location):
```
cd /Users/alscott/Development/Project-Herophilus/DataSynthesis/DataTier/DataLoaders
```
3. As of this document we run the psql statements in the Postgres-DataLoader-DataSynthesis-vX.sql, we will have to
   type in the password with every script that is run.


#### Windows
1. For this example our directory is c:\Development\Project-Herophilus\DataSynthesis\DataTier\DataLoaders
2. We open up a command prompt and run the following command:
```
cd c:\Development\Project-Herophilus\DataSynthesis\DataTier\DataLoaders
```
3. As of this document we run the psql statements in the Postgres-DataLoader-DataSynthesis-vX.sql, we will have to
type in the password with every script that is run.

## MySQL/MariaDB - Linux (CentOS/RHEL/Mac) and/or Windows

We have included Linux and Non-Linux scripts for every release to ensure we have better potential data loading experiences.

### Pre-Requisites
It should be understood that the needed tools or CLI's and utilities should be installed.

### Steps to Run The Scripts:
1. Open Terminal Window or Command Prompt
2. Make sure all the scripts into a specific defined directory that aligns with what is defined for the
shell being used, for simplicity everything of substance is in the subdirectory DataSeeding. Then make sure the
directories have correct permissions, I used chmod 777 to ensure correct permissions (it is understood that
that these are very open permissions and system admins might not allow this level.

#### Mac - MySQL
From the command prompt run the specific cli with the complete path to the scripts:
a. /Applications/MySQLWorkbench.app/Contents/MacOS/mysql -u root -p datasynthesis<br/>
b. Enter your password to the machine and then database server <br/>
c. source /DataLoaders/MariaDB-DataLoader-DataSynthesis-v16-Linux.sql <br/>

#### Windows - MariaDB 
a. mariadb -u root -p datasynthesis <br/>
b. Enter your password to the machine and then database server <br/>
c. source \DataLoaders\MariaDB-DataLoader-DataSynthesis-v16.sql <br/>


Happy coding!!!
