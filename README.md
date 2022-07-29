# Background
As we thought about how to help healthcare we continue to focus and believe that <b>data being the asset</b> and that 
must be core as part of our mindset. A key part we want to ensure is a focus on a wide variety of data enablement 
capabilities. Our logic is simple, for years companies have focused on most aspects of development, from the tooling to developing 
the next generation of solutions to support their business needs and provide value. However, building great software 
to help today's modern needs require data, in many cases, massive amounts of data. It is a HUGE business and technical 
benefit if that data can closely resemble production data. Since data is the electricity that powers business and the 
cornerstone of companies’ success in the digital era, we wanted to take a more comperehensive focus on enabling 
organizations around synthetic data.

Synthetic data is defined as: "any production data applicable to a given situation that are not obtained by direct
measurement" according to the McGraw-Hill Dictionary of Scientific and Technical Terms; where Craig S. Mullins,
an expert in data management, defines production data as "information that is persistently stored and used by
professionals to conduct business processes." With these definitions it is easy to understand the creation of
synthetic data is an involved process that can be achieved by numerous measures and ways. Our way was to create a platform to
synthesize data (Data Synthesis) for multiple needs based on items like industry standards, coded ontologies,
vendor data models, custom defined models all in an on-demand manner. With a focus on data and specifically synthetic 
data we wanted our platform to clearly express our focus, the name we settled on was DataSynthesis. 

# What Makes DataSynthesis Unique

<i>The idea for DataSynthesis is in NO WAY new or unique</i>, it purpose and usage is fueled to help reduce and/or remove
the struggle that every organization experiences around their data needs. What we believes make us unique is our
perspective and approach.

1. DataSynthesis is part of the Project Herophilus upstream community. This community consists of numerous other capabilities all
provided by a group across multiple organizations with a very large focus on healthcare. While there are numerous offerings out their across the open source
and paid offerings we wanted to build something that could not only be used for traditional application based
data needs but be used within integration efforts as well.
2. As part of the Project Herophilus community the intent is for it to be leveraged to both support and enable other
capabilities to be leveraged. A complete list of components from Connectivity, Data Real-Time Assets, Data Simulators, 
Data De-Identification and Anonymization components and more can be found <a href="https://github.com/Project-Herophilus" target="_blank">here</a>.
3. Building simply to highly complex data and datasets. The DataSynthesis platform from its inception has been designed to generate and/or build upon the extensible data
attributes it has, currently the platform has 21 different data attributes it can use to create data structures.
4. Our focus is on enabling massive amounts of data to be used immediately or very quickly. This we feel helps to 
focus on reducing data breached and information exposure. Why should organizations risk <a href="https://www.breachlevelindex.com/" target="_blank">data breaches</a> or the
potential leakage of <a href="https://en.wikipedia.org/wiki/Protected_health_information" target="_blank">PHI (in healthcare)</a>
or <a href="https://en.wikipedia.org/wiki/Personal_data" target="_blank">PII (In any other industry)</a>? In today's
technology world we wanted to enable a new and different way to innovate within a data-driven organization, an extensible 
5. Work with implementations industry based data. Our focus is also on enriching the platform with codes and codesets into data thats generated to ensure it matches
existing data systems.
6. Generating industry standargs. For Healthcare specifically this is HL7, FHIR, EDI and so forth. We are actively working
on implementing FHIR and improving HL7.
7. Helping to create and grow "Data Driven Organization". To be a data-driven organization requires an 
overarching information culture driven by data. An information culture is not only a deep knowledge of their data but 
a major understanding how it relates to any specific testing needed or required. broad access and data literacy along with
appropriate data-driven decision-making governance and guidance processes. While it sounds complicated it is really about providing businesses a
means for data collection, cleansing, hosting and maintenance data while mitigating the risk of a data breach thru 
comprehensive testing processes and practices. Data-driven organization can innovate continuously because they 
understand and can embrace new business models quickly. The focus around tooling in these organizations typically is 
to enable them.


## DataSynthesis Philosophy

Data Synthesis has always intended to be operated under the open/community source model. DataSynthesis open source
licensing model is <a href="https://opensource.org/licenses/Apache-2.0" target="_blank">Apache-2.0</a>.
Our model is not some "freemium" or offering based model with versions and scaled capabilities. Our approach is 
to provide the assets and have community enhancements and improvements to support the growth of underlying needs for the 
platform. data access capabilities. The core assets provided include a highly flexible and extensible data 
tier, APIs that both enable the platform to be accessed as well as extended and at some point there will be a 
WebUI. 

# DataSynthesis: Getting More Familiar
DataSynthesis consists of three core areas. 

## 1: DataTier
At the core of DataSynthesis is the data tier that is designed to be extensible and support all the needs for the platform.
All things around the data tier are specifically contained within the link provided below.

[DataTier](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier/README.md) 

## 2: Data Tier - APIs
To support the needs of user requests are the data tier APIs. This API set is about being able to both generate 
data and persist it to the data tier. The Data Tier APIs consist of Node and Quarkus APIs.

[DataTier APIs](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier-APIs/README.md)

## 3: Web-UI(s)
These are intended to be minimal viable usable products that can be used to look at the datatier of DataSynthesis you implement.

[DataTier Web User Interfaces](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier-WebUIs)


*Enjoy and Happy Coding!!!*
