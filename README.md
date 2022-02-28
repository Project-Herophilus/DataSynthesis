# DataSynthesis Modules
Here are the modules that make up DataSynthesis.

| Type|Usage/Implementation |
| -------------|----------|
|[DataTier](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier)| all the supported Database DDLs and Load Database scripts|
|[DataTier APIs](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier-APIs/Quarkus-APIs)|Quarkus and Node based APIs to access datatier. This includes building, generating and processing capabilities|
|[DataTier Web UI](https://github.com/Project-Herophilus/DataSynthesis/tree/main/WebPlatform-UI)|Eventual user interface for DataSynthesis.|

# Background
As we thought about how to help healthcare we believe a focus on <b>data being the asset</b> is the path forward we need
to be our baseline. A key part we want to ensure is a focus on a variety of data enablement capabilities. Our 
logic was simple, for years companies have focused on most aspects of development, from the tooling to developing 
the next generation of solutions to support their business needs and provide value. However, building great software 
to help today's modern needs require data, in many cases, massive amounts of data. It is a HUGE business and technical benefit
if that data can closely resemble production data. While there are numerous offerings out their across the open source
and paid offerings we wanted to build something that could not only be used for traditional application based 
data needs but be used within integration effots as well. Since data is the electricity that powers business and the cornerstone 
of companies’ success in the digital era, we wanted to take a more comperehensive focus on enabling organizations around 
synthetic data.

We continue to see many ways companies expressing the "Data Driven Organization" and really wanted to know what companies 
and people meant. Again, we thought about the need for data and how do we help build towards this. In order to have a 
starting point we wanted to have some form of a defintion. To be a data-driven organization requires an 
overarching information culture driven by data. An information culture is not only a deep knowledge of their data but 
a major understanding how it relates to any specific testing needed or required. broad access and data literacy along with
appropriate data-driven decision-making governance and guidance processes. Companies that are successful in this space
are quick at using data for all aspects of their business needs successfully and are quick to spot opportunities, quick to
assess ideas and adapt quickly to test, learn and drive future capabilities and needs from these experiences. A data-driven
organization does not have to come at a high price. While it sounds complicated it is really about providing businesses a
means for data collection, cleansing, hosting and maintenance data while mitigating the risk of a data breach thru 
comprehensive testing processes and practices. Data-driven organization can innovate continuously because they 
understand and can embrace new business models quickly. The focus around tooling in these organizations typically is 
to enable them.

Why should organizations risk <a href="https://www.breachlevelindex.com/" target="_blank">data breaches</a> or the 
potential leakage of <a href="https://en.wikipedia.org/wiki/Protected_health_information" target="_blank">PHI (in healthcare)</a>
or <a href="https://en.wikipedia.org/wiki/Personal_data" target="_blank">PII (In any other industry)</a>? In today's 
technology world we wanted to enable a new and different way to innovate within a data-driven organization, an extensible 
synthetic data platform.

Synthetic data is defined as: "any production data applicable to a given situation that are not obtained by direct 
measurement" according to the McGraw-Hill Dictionary of Scientific and Technical Terms; where Craig S. Mullins, 
an expert in data management, defines production data as"information that is persistently stored and used by 
professionals to conduct business processes." With these definitions it is easy to understand the creation of 
synthetic data is an involved process that can be achieved by numerous measures and ways. Our way was to create a platform to
synthesize data (Data Synthesis) for multiple needs based on items like industry standards, coded ontologies, 
vendor data models, custom defined models all in an on-demand manner. The DataSynthesis platform is designed to generate 
and/or build upon the extensible data attributes it has. As the platform continues to mature there will be more data 
attributes added as well. <i>The idea for DataSynthesis is in NO WAY new or unique</i>, it comes from the struggle that every organization with every 
resource on every project members of the Project Herophilus team have ever worked on across multiple industries. 

## DataSynthesis Philosophy

Data Synthesis has always intended to be operated under the open/community source model. This means we are providing
the code for community enhancements and improvements to support the growth of underlying data access capabilities. We are 
currently working on standing up the necessary artifacts. The code assets include a Web UI (at some point), APIs 
and the core repository patterns used to access the data structures offered within the platform. DataSynthesis open source 
licensing model is <a href="https://opensource.org/licenses/Apache-2.0" target="_blank">Apache-2.0</a>.

# DataSynthesis: Becoming More Familiar
DataSynthesis consists of four key areas. 

## 1: DataTier
At the core of DataSynthesis is the data tier that is designed to be extensible and support all the needs for the platform.
All things around the data tier are specifically contained within the link provided below.<br>
[DataTier](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier/README.md) 

## 2: Data Tier - APIs
To support the needs of user requests are the data tier APIs. This API set is about being able to both generate 
data and persist it to the data tier.

[DataTier APIs](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier-APIs/DataTier-APIs)

## 3: Web-UI(s)
These are intended to be minimal viable usable products that can be used to look at the datatier of DataSynthesis you implement.

[DataTier Web User Interfaces](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier-WebUIs)
This is in the works as we have just wrapped up the core Express Node API rework in January 2022.

*Enjoy and Happy Coding!!!*
