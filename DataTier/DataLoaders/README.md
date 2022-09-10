Return to the <a href="https://github.com/Project-Herophilus/DataSynthesis" target="_blank">Main DataSynthesis Page</a>

# DataSynthesis Loading Seeded Data
The easiest thing we could have done is make this a complete SaaS based offering. We are cognizant of the potential for
partners to build out potential services offering down the road. We also want to ensure that organizations can
have control of the data.

# Data Loading
All of these scripts have been built around PostgreSQL. Active work is going on with other data tiers as well. As these
get implemented and tested we will put those into this sub module for this repository.

### Pre-Requisites
Make sure you have all the tools needed installed and configured for usage. Some of these items have PostgreSQL specific
references.

1. RDBMS you are using installed and configured and have tested connectivity to it.
2. A clone or unzipped download of the DataSynthesis repository.
2. Go to the \DataLoaders directory where you cloned or unzipped the DataSynthesis repository.
3. Load up a command prompt - You can also use the pqsql command prompt if you wish.
   To simplify the experience you should change directories to the base directory location where the load scripts is. By doing
   this all the scripts will be able to find the corresponding directies and scripts as is.
4. If you DO NOT want to enter the user name and password for EVERY script to run then make sure you have a .pgpass file
   created. This file can be wherever you want it to be but we are working with it at It is in the format of host:port:database:user:password
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
