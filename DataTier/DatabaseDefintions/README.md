Return to the <a href="https://github.com/Project-Herophilus/DataSynthesis" target="_blank">Main DataSynthesis Page</a>

# DataSynthesis Database Defintions
The easiest thing we could have done is make this a complete SaaS based offering. We are cognizant of the potential for
partners to build out potential services offering down the road. We also want to ensure that organizations can
have control of the data.

## Pre-Requisites
Make sure you have all the tools needed installed and configured for usage. Some of these items have PostgreSQL specific
references.

1. RDBMS you are using installed and configured and have tested connectivity to it.
2. A clone or unzipped download of the DataSynthesis repository.
3. If this is an enterprise or SaaS provided database you will need to make sure you have an account capable of creating 
databases and adding extensions. If you will not be allowed those permissions then admins will need to create the 
database in step 4 and run the ddl script within the database to create all the datasynthesis objects.
4. Go to either a command line or your favorite RDBMS tool. Make sure you have a database created for this.

# Running The Database Definition (DDL)
- Load up your favorite RDBMS management tool or command line and run the latest script. Go to the specific database Go to the 
where you want to load DataSynthesis and then goto the \DatabaseaDefintions directory where you cloned or unzipped the 
DataSynthesis repository to load up the specific script and execute the script.
*the scripts contain the data to ensure there is no confusion.*


Happy coding!!!
