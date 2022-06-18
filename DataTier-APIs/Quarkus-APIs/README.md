# Quarkus APIs
This is a Quarkus application (https://quarkus.io/). It can easily be run by the following 2 ways:
When building the ways we could represent APIs we wanted to take a fresh perspective and decided to implement multiple
programming languages based APIs, we wanted to start with two very cloud native technologies: Quarkus and
Node. This content will specifically ONLY address the Quarkus APIs.

## API Background and Design Philosophy
The focus for the platform has been about enabling resources and systems to have a massive amount of data easily
accessible and available in a highly extensible manner. When building such a system we went through several design
phases and testing phases. Here are some key philisophical things we wanted to ensure as we have gone down this path:
1. Support a consistent data experience
- We enforced some data naming conventions. Also, this would be position us as we continue to expand and extend this platform.
  If there is EVERY a question on anything in the datamodel details are maintained in several files that start with
  datamodel_.
- We have a general approach for all aspects that the data tier supporting the platform maintains. Our goal here is to
  provide extensibility and enable human readable understanding before delving into data visuals. Every
  table implemented has a _ within them, by doing this it is intended to be <feature area>_<specific purpose> for any table referenced.
-
2. Provide seperation of concerns from the data tier outword
3. 
# Step One - Data Tier
Below are the links that we have included within the Data Tier.

On a medium powered virtual machine we have been able to get the data tier setup in just under 10 minutes!!!

* [DataTier Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/README.md)
* [DataTier Setup Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataSynthesis-DataTier-Setup.md)
* [DataTier Setup Management For Usage Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataSynthesis-DataTier-PlatformSetupMgmt.md)
* [DataTier DataModel Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataSynthesis-DataTier-DataModel.md)
* [DataTier-DataLoad](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataTier-DataLoad.md)

As you start to look at this repository the power of the platform is driven by the extensibility of the data tier. We feel it
is important that we explain some critical things about the data model.

- The tables within the data tier are designed with a naming convention that is two parts seperated by a hyphen (partone_parttwo).
The first part partone is the domain of the platform the table applies to such as refdata (reference data) and parttwo is the table name
and we have tried to be very specific to what the table enables/supports. Following this naming convention a table named refdata_usstates is specifically meant to 
be reference data of the United States names and abbreviations.<br>
[DataTier General Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataSynthesis-DataTier-General.md)
- The API's are built to enable the capabilities needed for the specific data contained within the DataSynthesis platform.
There are two very specific capabilities the APIs are currently developed for: generating and retrieving existing data. 
There are plans to built out upsert/insert data into the platform after we go ahead and finalize the base work, we are projecting 
late July 2022 to start this effort.
- This specifically will help build out the data contained within the datagenerated_ tables and the databuilt_.
THE ONLY dataexisting_ tables that can be expanded with others data is the namesfirst and nameslast. These were populated from many sites
that publish names, these can (and should be added to) with organizations data. The key distinction is that datagenerated_ data
are the lowest level data attributes (this is reflected in the platform_dataattributes table) that can be leveraged in many ways. Data within the databuilt_ tables are data structures that specifically have a defined purpose.
<br>For example: <br>
databuilt_address - brings together datagenerated_address and dataexisting_zipcodeus.
- All data that the system will routinely generate are in the platform_config_dataattributes table. This contains the specifics and also the
application that is associated to the generation. This table also has a few key fields: SpecialInstructions are intended
to be a script like manner we hand off to the generator when there are specifics that need to be built within the generator.
RunQuantity is intended to be the amount of transactions we generate (keep in mind some of these might not get into the datatier
as they already exist in the database, this quantity is just for raw data counts to be built. MinuteInterval is how often to generate new data.
ApplicationID is the GUID that needs to be inserted into the database to tell the system which defined application (multiple defined application are supported) created the data.
The base platform comes with over 50+ rules all associated to DataSynthesis (refdata_application).

# Step 2: Using the Quarkus API's
Within this area there are several topics related specifically to various aspects of implementing and using
Quarkus APIs.

## How To Get, Build and Run iDaaS-Connect Assets
Within each submodule/design pattern/reference architecture in this repository there is a specific README.md. It is
intended to follow a specific format that covers a solution definition, how we look to continually improve, pre-requisities,
implementation details including specialized configuration, known issues and their potential resolutions.
However, there are a lot of individual capabilities, we have tried to keep content relevant and specific to
cover specific topics.
- For cloning, building and running of assets that content can be found
  [here](https://github.com/Project-Herophilus/Project-Herophilus-Assets/blob/main/CloningBuildingRunningSolution.md).
- Within each implementation there is a management console, the management console provides the same
  interface and capabilities no matter what implementation you are working within, some specifics and
  and details can be found [here](https://github.com/Project-Herophilus/Project-Herophilus-Assets/blob/main/AdministeringPlatform.md).

### Locally Running: Maven Command
You can start the entire platform from a command line through Maven. In order to do this you will just need to know 
the key database details: database host address, port, username and password. 

1. This example will ALSO enable you to leverage a standalone database instance. The database instance MUST be seeded with data from the existing DataSynthesis data loading  
scripts and processes.

The following command specifically shows you how to start the Quarkus APIs. The following command 
will start up the Quarkus APIs, Connect to a specific PostgresQL Database, sip all the developed tests and 
not validate the datamodel. You will notice there is a -D before every command, this is not a typo but
a way that specifically defines attributes. This is absolutely critical so that the application.properties
file can accept the specific attributes and their values.

| Attribute                                         | Attribute Value|
|---------------------------------------------------|----------------|
| Avoid Recreating the datamodel and overwriting it |-Dquarkus.liquibase.migrate-at-start=false |
| Database Name                                     |-DDATABASE_NAME=dev_datasynthesis |
| Database Host (Name or IP)                        |-DDATABASE_HOST=192.168.1.101 |
| Database User Name                                |-DDATABASE_USERNAME=postgres |
| Database Password                                 |-DDATABASE_PASSWORD=MyData |
| Database Port                                     |-DDATABASE_PORT=5432  |
| Skip Tests                                        |-DskipTests |
| No DataModel Validation                           |-Dquarkus.hibernate-orm.validate-in-dev-mode=false|
```
mvn quarkus:dev -Dquarkus.liquibase.migrate-at-start=false -DDATABASE_NAME=dev_datasynthesis 
-DDATABASE_HOST=192.168.1.101 -DDATABASE_USERNAME=postgres 
-DDATABASE_PASSWORD=MyData -DDATABASE_PORT=5432 -DskipTests -Dquarkus.hibernate-orm.validate-in-dev-mode=false
```

2. This example enables auditing. While very similiar to the command above there is a specific new attribute. 
In order to support all API calls can be audited, we have tied this into the community project iDaaS-KIC 
(https://github.com/Project-Herophilus/iDaaS-KIC/tree/main/iDaaS-KIC-Integration). By default auditing is turned off. 
The following command enables auditing with a working KIC URL.

| Attribute                                         | Attribute Value|
|---------------------------------------------------|----------------|
| Avoid Recreating the datamodel and overwriting it |-Dquarkus.liquibase.migrate-at-start=false |
| Enable Auditing                                   |-Ddatasynthesis.audit=true|
| Auditing (iDaaS KIC URL)                          |-DAUDITING_URL=127.0.0.1:9970|
| Database Name                                     |-DDATABASE_NAME=dev_datasynthesis |
| Database Host (Name or IP)                        |-DDATABASE_HOST=192.168.1.101 |
| Database User Name                                |-DDATABASE_USERNAME=postgres |
| Database Password                                 |-DDATABASE_PASSWORD=MyData |
| Database Port                                     |-DDATABASE_PORT=5432  |
| Skip Tests                                        |-DskipTests |
| No DataModel Validation                           |-Dquarkus.hibernate-orm.validate-in-dev-mode=false|

```
mvn quarkus:dev -Dquarkus.liquibase.migrate-at-start=false -Ddatasynthesis.audit=true -DAUDITING_URL=127.0.0.1:9970
-DDATABASE_NAME=dev_datasynthesis 
-DDATABASE_HOST=192.168.1.101 -DDATABASE_USERNAME=postgres 
-DDATABASE_PASSWORD=MyData -DDATABASE_PORT=5432 -DskipTests -Dquarkus.hibernate-orm.validate-in-dev-mode=false
```

### Containers (Docker)
We have setup a combination of container images orchestrated using [docker-compose](https://docs.docker.com/compose/install/)
* **PostgresQL** - running on port 5432
* **Quarkus** - Http://localhost:8080

#### Getting Started
You can start the application stack and have everything containerized using:
```
docker-compose -f rdbms-docker-compose.yml up
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
datasynthesis.audit
io.connectedhealth.idaas.datasynthesis.audit.IDaasKicService/mp-rest/url
```
For example:
```
mvn -Dquarkus.datasource.username=lskywalker \
    -Dquarkus.datasource.password=jedi \
    -Ddatasynthesis.audit=true \
    -Dquarkus.datasource.jdbc.url=jdbc:mysql://10.210.21.77:3306/datasynthesis \
    -Dio.connectedhealth.idaas.datasynthesis.audit.IDaasKicService/mp-rest/url=http:127.0.0.1:9970 \
    quarkus:dev
``` 
#### Creating a native executable
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

# Using the APIs
This section is intended to cover how to leverage the APIs.

## Testing the DataSynthesis APIs
For simplicity we will just discuss how to test from a web browser. DataSynthesis APIs support OpenAPI 3.0 
specifications and Swagger UI. Download the OpenAPI documentation from http://<your IP/Hostname>:<Port in application.properties>/openapi. 
Launch SwaggerUI from http://<your IP/Hostname>:<Port in application.properties>/swagger. There you can directly try out all
available APIs to generate and retrieve synthetic data.

After you have brought up the Java-APIs and database in whatever configuration fits your needs you are
now ready to test the APIs.

## API Usage: DataGenerated 
Overall, you can retrieve (GET) or add (POST) arbitrary number of records from the platform that supports DataGeneration.

To use the Data Generation APIs the format is below:
http://<your IP/Hostname>:<Port in application.properties>/api/<Data Generated Item>?count=<valid number>

- if you do not specify the ?count=<valid number> then a default value of 500 will be used.

Here are the Key Data Generated Items
-------------------------------------
* accountnumbers
* addresses
* bankaccounts
* creditcards
* datesofbirth
* driverslicensenumbers
* ein 
* phonenumbers-us
* socialsecuritynumbers
* useridentities

API Usage Examples
------------------
Here are a set of examples to help guide implementation and users.

1. Uses the API for Account Numbers and randomly pull 225 records. 
http://<your IP/Hostname>:<Port in application.properties>/api/accountnumbers?count=225
2. Use the API for Addresses and randomly pull the default amount of records.
http://<your IP/Hostname>:<Port in application.properties>/api/addresses

Complex Data Generated Items
----------------------------
Within the area of data generated items so items can have numerous and multiple output types. Things like 
accountnumbers, drivers license, and credit cards can have multiple legitimate formats and the platform supports them 
with a mechanism called dataGenTypes. 

The following DataGenerated tables depend on regular expression patterns identified by `dataGenTypeId` to populate their entities:
* accountnumbers
* bankaccounts
* creditcards
* driverslicensenumbers
* useridentities

Each data table has a predefined `dataAttributeId`. Use GET `/api/dataattributes` to find `dataAttributeId` for each table. Then use POST `/api/datagentypes` to add new `dataGenTypes`. Its `definition` attribute is a regex string, for example, MasterCard's regex is `^5[1-5][0-9]{14}$`. Set `statusID` attribute to 1. The following post body is an example for adding a new `dataGenType` for credit cards (whose dataAttributeId = 6):
```
  {
    "dataAttributeID": 6,
    "definition": "^5[1-5][0-9]{14}$",
    "description": "Master",
    "statusID": 1
  }
```

We have preloaded 4 `dataGenTypes` for major credit cards, and 51 for drivers license numbers for all US states + DC. You can add more types for all tables listed above.

Attribute `dataGenTypeId` is required to add new entities to these tables. It is optional for retrieving arbitrary number of records from them.

## API Usage: DataExisting
You can retrieve (GET) arbitrary number of records from following DataExisting tables. You can also add (POST) new records one at a time except area-codes and zip-codes.
* ababankings
* areacodes (no POST)
* companies
* firstnames
* lastnames
* upccodes
* zipcodes (no POST)

API Usage Examples
------------------
Here are a set of examples to help guide implementation and users.


