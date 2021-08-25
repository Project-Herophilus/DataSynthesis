# Background and Understanding - Data Tier
Below are the links that we have included within the Data Tier.

On a medium powered virtual machine we have been able to get the data tier setup in just under 10 minutes!!!

* [DataTier Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/README.md)
* [DataTier Setup Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataSynthesis-DataTier-Setup.md)
* [DataTier Setup Management For Usage Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataSynthesis-DataTier-PlatformSetupMgmt.md)
* [DataTier DataModel Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataSynthesis-DataTier-DataModel.md)
* [DataTier-DataLoad](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataTier-DataLoad.md)

As you start to look at this repository the power of the platform is driven by the extensibility of the data tier. We feel it
is important that we explain some critical things about the data model.

* The tables within the data tier are designed with a naming convention that is two parts seperated by a hyphen (partone_parttwo).
The first part partone is the domain of the platform the table applies to such as refdata (reference data) and parttwo is the table name
and we have tried to be very specific to what the table enables/supports. Following this naming convention a table named refdata_usstates is specifically meant to 
be reference data of the United States names and abbreviations.<br>
[DataTier General Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataSynthesis-DataTier-General.md)
* The API code is built to enable access to the data contained within DataSynthesis for many purposes. A critical one is
generating new data. This specifically will help build out the data contained within the datagenerated_ tables and the databuilt_.
THE ONLY dataexisting_ tables that can be expanded with others data is the namesfirst and nameslast. These were populated from many sites
that publish names, these can (and should be added to) with organizations data. The key distinction is that datagenerated_ data
are the lowest level data attributes (this is reflected in the platform_dataattributes table) that can be leveraged in many ways. Data within the databuilt_ tables are data structures that specifically have a defined purpose.
<br>For example: <br>
databuilt_address - brings together datagenerated_address and dataexisting_zipcodeus.
* Any data that is generated should be pulled from the platform_config_datagen table. This contains the specifics and also the
application that is associated to the generation. This table also has a few key fields: SpecialInstructions are intended
to be a script like manner we hand off to the generator when there are specifics that need to be built within the generator.
RunQuantity is intended to be the amount of transactions we generate (keep in mind some of these might not get into the datatier
as they already exist in the database, this quantity is just for raw data counts to be built. MinuteInterval is how often to generate new data.
ApplicationID is the GUID that needs to be inserted into the database to tell the system which defined application (multiple defined application are supported) created the data.
The base platform comes with over 50+ rules all associated to DataSynthesis (refdata_application).

# Java APIs
Java implemented codebase for implementing DataSynthesis.  
This codebase enables connectivity and all capabilities within Data Tier. We have also included the data tier within this to ensure updates to data tier are carried through
This code provides several capabilities built into one codebase.

## Starting DataSynthesis - Local
This is a Quarkus application (https://quarkus.io/) that can easily be run by the following 2 ways:

### Maven Command
You can start the entire platform from a command line through Maven. This example will ALSO enable you to leverage a
standalone database instance. The database instance MUST be seeded with data from the existing DataSynthesis data loading  
scripts and processes.

The following command specifically shows you specifically how to connect to a database server on IP 127.0.0.1 on Port 3306
to a database named datasynthesis with a user named root who has a password of Developer123
```
mvn quarkus:dev -Dquarkus.liquibase.migrate-at-start=false -DDATABASE_NAME=datasynthesis -DDATABASE_HOST=127.0.0.1 -DDATABASE_USERNAME=root -DDATABASE_PASSWORD=Developer123 -DDATABASE_PORT=3306
```
### Troubleshooting Issues
If you get any errors around time zone issues you can set those through the MySQL Workbench and know the time difference
from GMT to your time zone, for the example below we are setting it for CST which is +7 hours
```
SET GLOBAL time_zone = '+07:00';
SELECT @@GLOBAL.time_zone, @@SESSION.time_zone;
SET SESSION time_zone = '+07:00';
SELECT @@GLOBAL.time_zone, @@SESSION.time_zone;
```
### Testing the DataSynthesis APIs
For simplicity we will just discuss how to test from a web browser; however, as said on the main README.md there is an
included Insomnia API JSON file for those that like using an IDE based tool.

After you have brought up the Java-APIs and database in whatever configuration fits your needs you are
now ready to test the APIs.

DataSynthesis APIs support OpenAPI 3.0 specifications and Swagger UI. Download the OpenAPI documentation from
http://localhost:8080/openapi. Launch SwaggerUI from http://localhost:8080/swagger. There you can directly try out all
available APIs to generate and retrieve synthetic data.

## Starting DataSynthesis - Containers (Docker)
We have setup a combination of container images orchestrated using [docker-compose](https://docs.docker.com/compose/install/)
* **MySQL** - running on port 3306
* **Quarkus** - Http://localhost:8080

### Getting Started
You can start the application stack and have everything containerized using:
```
docker-compose -f mysql-docker-compose.yml up
```
You can start the application stack and have it access an existing Database server (you will just need to setup the Database connectivity parameters in the environment section of the standalone-apis.yml file) :
```
docker-compose -f standalone-apis.yml up
```
The stack can be stopped by `Ctrl+C` or by
```
docker-compose down
```
### Running Locally - Hybrid Container Based Platform (APIs in Containers and RDBMS on a machine somewhere)
You can use the standalone-api.yml file. You can chage the properties as needed. As long as the attributes you change are valid
the platform will come up. It is IMPORTANT to know this implementation assumes you have created the datasynthesis database and also seeded it with
the data provided.

[DataSynthesis-DataTier-Setup](../DataTier/DataSynthesis-DataTier-Setup.md)<br/>
[DataTier-DataLoad](../DataTier/DataTier-DataLoad.md)

### Running Locally - All Container Based Platform (APIs and RDBMS)
If you already have a valid MySQL database and would like to run this locally you'll need to set the database credentials.  This can be done in 2 ways:
* A. Setting Environment Variables the following environment variables and running `mvn quarkus:dev`
```
DATABASE_HOST
DATABASE_USERNAME
DATABASE_PASSWORD
```
* B. Overriding the quarkus properties on the command line:
```
quarkus.datasource.username
quarkus.datasource.password
quarkus.datasource.jdbc.url
```
For example:
```
mvn -Dquarkus.datasource.username=lskywalker \
    -Dquarkus.datasource.password=jedi \
    -Dquarkus.datasource.jdbc.url=jdbc:mysql://10.210.21.77:3306/datasynthesis \
    quarkus:dev
``` 
### Creating a native executable
You can create a native executable using: 
```
./mvnw package -Pnative
```

Or, if you don't have GraalVM installed, you can run the native executable build in a container using: 
```
./mvnw package -Pnative -Dquarkus.native.container-build=true
```

You can then execute your native executable with: ./target/idaas-datasynthesis-1.0.0-SNAPSHOT-runner

If you want to learn more about building native executables, please consult https://quarkus.io/guides/building-native-image.

If you run out of memory during the native build add `-Dnative-image.xmx=6g` to your command.


# Supporting Technologies

## Liquibase
[Liquibase](https://www.liquibase.com/) is used to help track, version and deploy database schema changes.  
We are utilizing the [liquibase maven plugin](https://docs.liquibase.com/tools-integrations/maven/home.html) to simplify the use of liquibase.

**NOTE:  Do NOT edit any database tables directly or any changesets already defined.  The app will fail to start if any changes are made outside of liquibase or any changes are made to an already deployed changset.**

### Diff
You can diff 2 databases and have liquibase generate a file with the differences.  Follow these basic steps to perform a diff.
1.  Deploy current code into a database
      -  This can be done by using docker-compose
2.  Deploy current code into another database
3.  Make changes to second database (i.e. add columns, indexes, etc.)
4.  Run diff (see example below) command against both databases
5.  Copy everything after the first line `databaseChangeLog:` in the specified `diffChangeLogFile` and paste it into the `changeLog-master.yaml` file.
6.  Make necessary changes to hibernate classes
7.  Re-run docker-compose to install new changes
      - Login to database and very changes are there
8.  Run the tests to ensure everything is valid

A sample diff command:
```
mvn liquibase:diff \
-Dliquibase.referenceUrl="jdbc:mysql:<IP OR HOSTNAME>:<PORT>/<databasename>" \
-Dliquibase.referenceUsername=<USERNAME> \
-Dliquibase.referencePassword=<PASSWORD> \
-Dliquibase.referenceDriver=com.mysql.cj.jdbc.Driver \
-Dliquibase.diffChangeLogFile=src/main/resources/liquibase-diffChangeLog.yaml
```
The differences will be placed in the `src/main/resources/liquibase-diffChangeLog.yaml` file.
NOTE:  by default the original/old database will utilized the properties in the [pom.xml](pom.xml) file (properties: driver, url, username, password).  
To override this add those parameters on the command line above and don't forget to prefix them with `-Dliquibase.`

### Useful Diff links
- [Maven Liquibase Plugin diff](https://docs.liquibase.com/tools-integrations/maven/commands/maven-diff.html)
