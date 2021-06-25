# DataSynthesis
DataSynthesis is intended to be a comprehensive platform for synthetic (fictitious) data.
Within this code repository is represented by a different high level directory and within
each of these directories is some artifact that can be used. Within
various repositories once they are downloaded these directories can be
individually opened and the code within them managed, modified and run.

Within this solution please find a few specific directories:

- platform-addons: contains the Insomnia JSON files so you can simply import them into
Insonmia. This can be used if you want to leverage an API tool to test the APis with.
- DataTier - all the supported Data Tiers and ANY specific content is contained within this directory.
  - MySQL: The current RDBMS implementation is MySQL 8, that is where ALL the effort has been placed.
  - Postgres: We have a functional DDL (might be slightly dated) amd data load scripts. We are also working through
  some database issues specific to the ORM layer. We will continue to
  - SnowFlake: This has a valid DDL and dataload scripts. They are just not optmized at all!!
- Java-APIs - This is a newer effort developed in *Quarkus* to provide the platform APIs.
This also contains all the needed services as we rebuild them to manage and do platform tasks.

# DataSynthesis Specific Projects
Each Directory/Project has specific Readme.md files that are intended to cover specifics of the particular capabilities.

* [DataTier Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/README.md)
* [Java API Readme](https://github.com/RedHat-Healthcare/DataSynthesis/tree/master/Java-APIs)

*Enjoy and Happy Coding!!!*
