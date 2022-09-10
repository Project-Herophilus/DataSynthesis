# DataSynthesis Loading Seeded Data
The easiest thing we could have done is make this a complete SaaS based offering. We are cognizant of the potential for
partners to build out potential services offering down the road. We also want to ensure that organizations can
have control of the data.

# Data Loading
While we focused initially was around MariaDB / MySQL in 2022 we have decided to move to PostgresQL. We will continue
to publish DDLs for it. The dataloading scripts are simplicistic inserts with NO specific RDBMS commands built into them.
However, with OS and RDBMS security enhancements always keep in mind there might be changes needed. The intent of the
Data Seeeding is to support loading all the data we provide, if you wish to reduce the loaded data feel free to customize
them. As with everything we do we keep the complete history so everyone can see the work that has been done.

## Postgres
As mentioned above starting in 2022 all development efforts and core database work will be done against Postgres as
the main database. We dont test for any specific version of PostgresQL but have heard through various implementatyions either
in public clouds or on premise that these scripts work from v9.6 forward. We will still continue to export DDLs for other
databases. However, as with every effort these as a best effort unless otherwise specifically stated.

### Pre-Requisites
Make sure you have all the tools needed installed and configured for usage.

1. Clone the DataSynthesis repository.
2. Go to the \DataLoaders directory where you cloned the DataSynthesis repository, we maintain ALL
   relevant load scripts as single files so you should REALLY focus on the latest versioned one by the data technology you
   are using.
3. Load up a command prompt - You can also use the pqsql command prompt if you wish.
   To simplify the experience you should change directories to the base directory location where the load scripts is. By doing
   this all the scripts will be able to find the corresponding directies and scripts as is.
4. If you DO NOT not to enter the user name and password for EVERY script to run then make sure you have a .pgpass file created. This file can be wherever you want it to be but we are working with it at It is in the format of host:port:database:user:password
   the base directory of where the DataTier/DataLoaders are located.
```
localhost:5432:datasynthesis:postgres:Developer123
```

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
   type in the password with every script that is run. Below is an example of how the command should look:

```
/Library/PostgreSQL/14/bin/psql -h localhost -U postgres -d dev_datasynthesis -p 5432 -f ./Platform/3-platform_datastructurestodataattributes.sql

```

#### Windows
1. For this example our directory is c:\Development\Project-Herophilus\DataSynthesis\DataTier\DataLoaders
2. We open up a command prompt and run the following command:
```
cd c:\Development\Project-Herophilus\DataSynthesis\DataTier\DataLoaders
```
3. As of this document we run the psql statements in the Postgres-DataLoader-DataSynthesis-vX.sql, we will have to
   type in the password with every script that is run.


Happy coding!!!
