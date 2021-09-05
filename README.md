# DataSynthesis
For years companies have focused on most aspects of development, from the tooling to developing the next generation of
solutions to support their business needsand provide value. As everyone in the software development and delivery industry
has seen development processes might be the same but the tools and capabilities that can now be delivered have grown
exponentially in the last few years alone. So with all these new capabilities whats the next step after the software is 
crafted? What advancements have been made in testing processes, that yield better software more rapidly, that is more 
usable from the outset, with fewer risks to your data? No many!!!! Data and testing always seems to be viewed as the 
same practice and processes from decades ago. How and why is this the case? Data is the electricity that powers business 
and the cornerstone of companies’ success in the digital era. With data being so critical what is your companies focus on the
need for meaningful testing data? Any thoughts or strategic initiatives towards becoming a test data-driven organization? 
A test data-driven organization is an organization that can leverage data for their testing needs and that data accurately 
represents their needs. To be a data-driven organization requires an overarching testing data culture that couples a 
number of elements, including high-quality production like data, broad access and data literacy along with appropriate 
data-driven decision-making governance and guidance processes. Companies that are successful in this space are quick at using 
data for all aspects of their business needs successfully and are quick to spot opportunities, quick to
assess ideas and adapt quickly to test, learn and drive future capabilities and needs from these experiences.

The Data Synthesis platform is designed to generate, leverage and build upoin one hundred percent freely available 
information and augment or construct it for various business needs. In no way is anything produced from data synthesis 
native production data. The idea for Data Synthesis is in NO WAY new or unique, it comes from the struggle that every 
organization with every resource on every project I have ever worked on. There are always struggles with getting and 
using real-world representative data. While there are several potential offerings that might help, they all have issues 
or varying limitations.

A data-driven organization does not have to come at a high price. While it sounds complicated it really involves 
providing businesses a means for data collection, cleansing, hosting and maintenance data while mitigating the 
risk of a data breach thru comprehensive testing processes and practices. Data-driven organization can innovate continuously 
because they understand and can embrace new business models quickly. As we think about how organizations mostly test today 
its by hooking up production feeds to test systems and typically getting sign-offs from security and various other IT
management officers. Why should orgainzations risk <a href="https://www.breachlevelindex.com/" target="_blank">
data breaches </a>  or the potential leakage of <a href="https://en.wikipedia.org/wiki/Protected_health_information" 
target="_blank">PHI (in healthcare)</a>
or <a href="https://en.wikipedia.org/wiki/Personal_data" target="_blank">PII (In any other industry)</a> ? In today's 
technology world these old practices does not make ANY practical sense.  We introduced a new and different way to be 
able to innovate within a data-driven organization, synthetic data.

Synthetic data is defined as "any production data applicable to a given situation that are not obtained by direct 
measurement" according to the McGraw-Hill Dictionary of Scientific and Technical Terms; where Craig S. Mullins, 
an expert in data management, defines production data as"information that is persistently stored and used by 
professionals to conduct business processes." With these definitions it is easy to understand the creation of 
synthetic data is an involved process that can be achieved by numerous measures and ways. Our way was to create a platform to
synthesize data (Data Synthesis) for multiple needs based on items like industry standards, vendor data models, 
custom defined models all in an on-demand manner.


* Enterprise-wide data
* Industry standards
* Vendor-specific, and custom-designed data and models
* On-demand access (tDaaS)
* External data from any source
* Microservices/API access
* Any/multiple layers of metadata
* Leverage the latest technology and be able to build out capabilities that accurately represent production data without exposing it</li>

Data Synthesis has always intended to be operated under the open/community source model. This means we are providing the code for community enhancements
and improvements to support the growth of underlying data access capabilities.  We are currently working on standing up the necessary artifacts.
The code assets include the Web UI, APIs and the core repository patterns used to access the data
structures offered within the platform.  DataSynthesis open source licensing model is <a href="https://opensource.org/licenses/MIT" target="_blank">MIT</a>.

Data is the key part of this technology. DataSynthesis is built on the concept of  data attributes - core data the platform has in it. Data attributes are the center piece of the
the platform and  the platform is geared around supporting, sustaining and growing these.  The key part to the platform and its capabilities is how we tie data attributes into something
larger and reuseable, data structures.  To support this within DataSynthesis we built in support for composite data structures. This means platform users can develop these
and they will be able to be distributed to others within the technology.  Our intent was to simply provide a mechanism where these structures could be leveraged and then easily
offered within the technology.


## DataSynthesis Modules

| Type|Usage/Implementation |
| -------------|----------|
|DataTier| all the supported Database DDLs and Load Database scripts|
|DataTier-APIs|APIs developed to support the DataSynthesis platform data needs.|
|DataTier-DataBuilder|Platform components that can build data from DataSynthesis for a variety of needs.|
|WebPlatform-UI|Eventual user interface for DataSynthesis.|

# DataSynthesis Specific Projects
Each Directory/Project has specific Readme.md files that are intended to cover specifics of the particular capabilities.

* [DataTier Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/README.md)
* [Java API Readme](https://github.com/RedHat-Healthcare/DataSynthesis/tree/master/Java-APIs)

*Enjoy and Happy Coding!!!*
