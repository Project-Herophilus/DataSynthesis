# DataSynthesis - Spring Boot APIs

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

# Step 2: Using the SpringBoot API's
Within this area there are several topics related specifically to various aspects of implementing and using
Quarkus APIs.

## How To Get, Build and Run
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

### Locally Running: Gradle, etc.
You can start the entire platform from a command line through Maven. In order to do this you will just need to know.

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


Complex Data Generated Items
----------------------------


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


