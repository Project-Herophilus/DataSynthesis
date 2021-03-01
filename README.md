# DataSynthesis

## What is Data Synthesis
<p>
For years companies have focused on most aspects of development, from the tooling to developing the next generation of solutions to support their business needsand provide value. As everyone in the software development and delivery industry has seen development processes might be the same but the tools and capabilities that can now be delivered have grown exponentially in the last few years alone. So with all these new capabilities whats the next step after the software is crafted? What advancements have been made in testing processes, that yield better software more rapidly, that is more usable from the outset, with fewer risks to your data? No many!!!! Data and testing always seems to be viewed as the same practice and processes from decades ago. How and why is this the case? Data is the electricity that powers business and the cornerstone of companies’ success in the digital era. With data being so critical what is your companies focus on the need for meaningful testing data? Any thoughts or strategic initiatives towards becoming a test data-driven organization? A test data-driven organization is an organization that can leverage data for their testing needs and that data accurately represents their needs. To be a data-driven organization requires an overarching testing data culture that couples a number of elements, including high-quality production like data, broad access and data literacy along with appropriate data-driven decision-making governance and guidance processes. Companies that are successful in this space are quick at using data for all aspects of their business needs successfully and are quick to spot opportunities, quick to assess ideas and adapt quickly to test, learn and drive future capabilities and needs from these experiences.
</p>
<p>
A data-driven organization does not have to come at a high price. While it sounds complicated it really involves providing businesses a means for data collection, cleansing, hosting and maintenance data while mitigating the risk of a data breach thru comprehensive testing processes and practices. Data-driven organization can innovate continuously because they understand and can embrace new business models quickly. As we think about how organizations mostly test today its by hooking up production feeds to test systems and typically getting sign-offs from security and various other IT management officers. Why should orgainzations risk data breaches or the potential leakage of PHI (in healthcare) or PII (In any other industry) ? In today's technology world these old practices does not make ANY practical sense. We introduced a new and different way to be able to innovate within a data-driven organization, synthetic data.
</p>
<p>
Synthetic data is defined as "any production data applicable to a given situation that are not obtained by direct measurement" according to the McGraw-Hill Dictionary of Scientific and Technical Terms; where Craig S. Mullins, an expert in data management, defines production data as "information that is persistently stored and used by professionals to conduct business processes." With these definitions it is easy to understand the creation of synthetic data is an involved process that can be achieved by numerous measures and ways. Our way was to create a platform to synthesize data (Data Synthesis) for multiple needs based on items like industry standards, vendor data models, custom defined models all in an on-demand manner.
</p>
<p>
The Data Synthesis platform is designed to generate, leverage and build upoin one hundred percent freely available information and augment or construct it for various business needs. In no way is anything produced from data synthesis native production data. The idea for Data Synthesis is in NO WAY new or unique, it comes from the struggle that every organization with every resource on every project I have ever worked on. There are always struggles with getting and using real-world representative data. While there are several potential offerings that might help, they all have issues or varying limitations. So how do you get comprehensive, high quality synthetic data, that is as close to your production data as possible? Data Synthesis purpose is to help create a test data platform that supports:

- Enterprise-wide data,
- Industry standards,
- Vendor-specific, and custom-designed data and models,
- On-demand access (tDaaS),
- External data from any source,
- Microservices/API access,
- Any/multiple layers of metadata
- Leverage the latest technology and be able to build out capabilities that accurately represent production data without exposing it
</p>

This technology is intended to democratize complex industry standards metadata and enable efficiency in the testing and validation process of technology. Please check out our platform release news for details on ongoing and upcoming efforts.

## Licensing and Pricing Model

Data Synthesis has always intended to be operated under the open/community source model. This means we are providing the code for community enhancements and improvements to support the growth of underlying data access capabilities. We are currently working on standing up the necessary artifacts in Azure DevOps to support this undertaking. The code assets include the Web UI, APIs and the core repository patterns used to access the data structures offered within the platform. DataSynthesis open source licensing model is MIT.

## Data Offering(s) Within the Platform

Data is the key part of this technology. DataSynthesis is built on the concept of data attributes - core data the platform has in it. Data attributes are the center piece of the the platform and the platform is geared around supporting, sustaining and growing these. The key part to the platform and its capabilities is how we tie data attributes into something larger and reuseable, data structures. To support this within DataSynthesis we built in support for composite data structures. This means platform users can develop these and they will be able to be distributed to others within the technology. Our intent was to simply provide a mechanism where these structures could be leveraged and then easily offered within the technology.

The platform currently has the following data attributes available within it:

- Account Numbers
- Addresses
- Area Codes
- Bank Accounts
- Bank Routing Numbers
- Companies
- Credit Cards
- Date of Birth
- Drivers License Number (50 State compliant formats)
- Employer Identification Numbers
- Names (Last and First) (First Names contain Gender)
- Phone Numbers
- Social Security Numbers
- UPC Codes
- Zip Codes

Composite data structures are always being created; however, a few composite data strucutres are:
Account List
Corporate Demographics
Personal Demographics
Products

## How is Data Synthesis a Platform?
This technology is designed around enabling capabilities. Capabilities are built as subsystems, this design enables various features to be delivered for capabilities to be addressed. These subsystems together form the entire software platform.

Platform Administration
Platform Generated Data
Platform Leveraged Data
Platform Composite Data
Platform Data: Healthcare
Platform Data: Vendor Relational Data
