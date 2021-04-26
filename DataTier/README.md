# DataSynthesis-Data Tier
This README.md is specific to anything for the DataSynthesis Data Tier.

## Background
DataSynthesis was started after my personal struggle with being able to leverage
data for any level of integration, application development, varying data related
(Data Warehouse, Big Data, Relational Data, AI/ML). This struggle had gone on for 
several decades as I worked on integration across the US, Canada, Trinidad including
thousands of hospitals, numerous payers and several life sciences companies. 

As I thought about the problem I had also started to become more focused on open source
software and industry initiatives. I went in with the expectations that many solutions must exist
to solve this problem and it was just a matter of me learning how to use one or stitch a few together.
While there are a lot of good point solutions I was struggling with how to bring them all 
together. So I regrouped and wanted to refocus on what I was trying to do.

## Common Expectations and Questions

1. What was I really looking to do?
   *A data tier that I could grow and extended as it was needed.*
2. What kind of data was I looking to focus around?
   *All kinds of data, effectively even though my career had been spent in healthcare I 
    wanted to ensure what I needed covered all of healthcare and potentially beyond.*
3. This capability had to exist?
    *There are a ton of add-ons, libraries and point solutions that address a number of issues*
4. Was I being too picky?
   *I asked a lot of industry experts, colleagues and trusted sources. I was able to confirm there
    were a lot of point solutions and efforts people use to do most of this.*
5. Could and Should something like what I was invisioning be built and would it be valuable?
   *It was a resounding yes!!!*
   
## Phases 

As I started looking at the various offerings and what we believed were needed we started 
putting phases together. We wanted to do an initial set of phases and then re-evaluate:

* Model Out some core business data needs 
* Look for data available - online and elsewhere that can be reused and meet needs
* Technology and Technical Needs
* Build out data tier and general capabilities with a few prototypes 

## Myopic Focus
We did the phases and out of the initial effort came some amazing work and findings and some
moments of internal honesty. We did one round of a prototype. Within this phase it lasted 
about six months. Here is what we did/achieve:

* Built basic models for representing data specific to clinical and administrative data
* Find Pubicly Available Data
* Look at the various technologies that can be leveraged

As I looked at what we initially built and what we used to deliver it I had to take a step back and 
question everything. Here are the changes we focused on:

* This effort was much bigger than initially anticipated
* The technology while solid was not the right initial choice - SQL Server and .Net Core ended 
up being an initial impedement to what we were trying to do, also not very well received in
the open source community.

## The Path Forward

For the path forward we wanted to include content to walk teams through the various aspects of the 
data tier.

* [DataTier General Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataSynthesis-DataTier-General.md)
* [DataTier Setup Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataSynthesis-DataTier-Setup.md)
* [DataTier Setup Management For Usage Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataSynthesis-DataTier-PlatformSetupMgmt.md)
* [DataTier DataModel Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataSynthesis-DataTier-DataModel.md)
* [DataTier-DataLoad](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/DataTier-DataLoad.md)

Stay safe, stay strong and carry on!!! Happy Coding!!!!
