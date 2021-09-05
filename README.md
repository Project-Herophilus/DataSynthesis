# DataSynthesis
DataSynthesis is intended to be a comprehensive platform for synthetic (fictitious) data.
Within this code repository is represented by a different high level directory and within
each of these directories is some artifact that can be used. Within
various repositories once they are downloaded these directories can be
individually opened and the code within them managed, modified and run.


| Type|Usage/Implementation |
| -------------|----------|
|builders| Are intended to be specific code bases that are built to support specific industry and/or data structures being created. They build data through pojos|
|converters|Supported conversion between different industry standards. Sometimes these will involve using Builders but they can also be encapsulated code bases as well.|
|dataobjects|This is a core basis for most activities. It is leveraged for almost anything that occurs. Dataobjects are the building block for all activities the platform provides. The intent is that you can leverage them for specific or general usage needs, to support this there are several sub-directories for specific business usage.|
|datastructures|This is where you can take dataobjects and make them respresent a construct you are working with. To support many business needs there are several sub-directories for specific business usage.|
|events|Events are what the platform provides for resuability. Think of events as activities you are trying to provide, while the code might be seperated and reference dataobjects or datastructures the key here is these events typically leverage a parser to ensure they can do all the detailed data work needed.|
|parsers|Specific parser based activities that the platform provides and can always be extended. To support extensible there is a directory structure provided. As with everything, it can be extended.|


# DataSynthesis Specific Projects
Each Directory/Project has specific Readme.md files that are intended to cover specifics of the particular capabilities.

* [DataTier Readme](https://github.com/RedHat-Healthcare/DataSynthesis/blob/master/DataTier/README.md)
* [Java API Readme](https://github.com/RedHat-Healthcare/DataSynthesis/tree/master/Java-APIs)

*Enjoy and Happy Coding!!!*
