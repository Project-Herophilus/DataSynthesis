Return to the <a href="https://github.com/Project-Herophilus/DataSynthesis" target="_blank">Main DataSynthesis Page</a>

# Environment Variables
Environmental variables are intended to be universal values that are created and set at the system level before the
API platform is started. If there are any changes or enhancements needed the environment variable(s) must be properly set
and the API platform restarted.

# Setting Up The Environment: Environment Variable
The biggest thing to understand is that all settings for this solution are done through environment variable.
It is important to know that if you clone the repository the file  WILL NOT be included or created.

## Reference: Defined Environment Variables
Here is the real world example of the environment variables:

| Env. Variable Name   | Purpose                                                                                                               |
|----------------------|-----------------------------------------------------------------------------------------------------------------------|
| httpPort             | HTTP Port used by the APIs                                                                                            |
| runQuantity          | Quantity of data the APIs will generate                                                                               |
| auditing             | Setting to enable auditing                                                                                            |
| auditingTopicName    | Specific topic name where auditing events will be placed                                                              |
| outputAdapter        | Output type to be used. Values are: kafka kafka-datapersistence file rdbms nosql                                      |
| edi_location         | Location where EDI generated data structures will be placed, can set to undefined                                     |
| fhir_location        | Location where EDI generated data structures will be placed, can set to undefined                                     |
| hl7_location         | Location where EDI generated data structures will be placed, can set to undefined                                     |
| kafka_server         | Kafka server location we will be connecting to format is - servername:port                                            |
| kafka_group          | Defined kafka group, can set to undefined.                                                                            |
| KAFKA_CONSUMER_TOPIC | Future use                                                                                                            |
| KAFKA_PRODUCE_TOPIC  | Future use                                                                                                            |
| kafka_client_id      | Used to specifically identify the kafka consumer                                                                      |
| rdbms                | RDBMS for the underlying APIs (some RDBMS use different SQL). postgreSQL                                              |
| dbURL                | Used for PostgreSQL. Database specific URL. Include servername, port, user, password and database                     |
| dbHost               | Used for databases (non PostgreSQL) as database server host name                                                      |
| dbPort               | Used for databases (non PostgreSQL) as database server port number                                                    |
| dbUser               | Used for databases (non PostgreSQL) as database user name                                                             |
| dbPassword           | Used for databases (non PostgreSQL) as database password                                                              |
| dbName               | Used for databases (non PostgreSQL) as database name                                                                  |
| iDaaS_FHIR_Server    | Used to define a FHIR Server to send FHIR compliant transactions                                                      |
| iDaaS_Cloud          | Variable for determining if transactions will be sent to iDaaS Cloud components for Public Cloud PaaS/SaaS processing |
| iDaaS_DataSymthesis_Kafka  | Specific Kafka setting for DataSynthesis                                                                        |

## Reference: Environment Variables File
Here is the real world example of the environment variables:

```   
# Platform Settings
export httpPort=8001
export runQuantity=7500
# Auditing
export auditing=false
export auditingTopicName=kic_appintgrtntransactions
# Output values: kafka kafka-datapersistence file rdbms nosql
export outputAdapter=kafka-datapersistence
# Output Setting
export edi_location=undefined
export fhir_location=undefined
export hl7_location=undefined
# Kafka Settings
export kafka_server=localhost:9092
export kafka_group=undefined
export KAFKA_CONSUMER_TOPIC= undefined
export KAFKA_PRODUCE_TOPIC=undefined
export kafka_client_id="1234"
# Database Tech
export rdbms=postgreSQL
# Postgres Database Setting
export dbURL=postgres://postgres:Developer123@localhost:5432/datasynthesis
# MySQL/MariaDB Database Setting
export dbHost=127.0.0.1
export dbPort=1234
export dbUser=root
export dbPassword=Developer123
export dbName=datasynthesis
# Vendor Centric Settings
# iDaaS
export iDaaS_FHIR_Server_URI=undefined
export iDaaS_Cloud=true
export iDaaS_DataSymthesis_Kafka=idaas_datasynthesis
```

# Implementing Locally

## Mac

On the Mac the implementation depends upon the shell you have. However, you can create a file and then
simply run the following command: source <filename> before starting your API platform. You can run
this as a seperate command or implement it within a shell script.

## Windows
With Windows there are tons of resourcs online, here is a [video](https://www.youtube.com/watch?v=5BTnfpIq5mI) that
shows you the process.