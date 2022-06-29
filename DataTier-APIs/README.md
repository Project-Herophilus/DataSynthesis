# DataSynthesis Data Tier APIs
DataSynthesis Data Tier APIs are intended to be a place where several different languages of APIs are developed
to access the DataSynthesis data model.

# Focus on Improving
We are focusing on continuing to improve. With the numerous implementation and partner implementations we
have focused on success overall and as we progress forward the intent is to focus on success while being consistent.
Please find details on how to help us [here](https://github.com/Project-Herophilus/Project-Herophilus-Assets/blob/main/OngoingEnhancements.md).

# Platform General Pre-Requisites
For all iDaaS design patterns it should be assumed that you will either install as part of this effort, or have the following:
For these pre-requisites there is both a development/implementation and also production enablement perspective.
- Java JDK
  Java is what everything is developed in. The current supported JDK release(s) are 1.8 and 11. We strongly recommend 11 as
  all the build actions and activities we do are based on this JDK release.
  <a href="https://developers.redhat.com/products/openjdk/download" target=_blank>OpenJDK Download Site</a>.
- An existing Kafka (or some flavor of it) up and running. Red Hat currently implements AMQ-Streams based on Apache Kafka;
  however, we have implemented iDaaS with numerous Kafka implementations. Please see the following files we have
  included to try and help: <br/>
  [Kafka](https://github.com/Project-Herophilus/Project-Herophilus-Assets/blob/main/Kafka.md) <br/>
  [KafkaWindows](https://github.com/Project-Herophilus/Project-Herophilus-Assets/blob/main/KafkaWindows.md) <br/>
  No matter the platform chosen it is important to know that the Kafka out of the box implementation might require some changes depending
  upon your implementation needs. Here are a few we have made to ensure: <br/>
  In <kafka>/config/consumer.properties file we will be enhancing the property of auto.offset.reset to earliest. This is intended to enable any new
  system entering the group to read ALL the messages from the start. <br/>
  auto.offset.reset=earliest <br/>
- Some understanding of building, deploying Java artifacts and the commands associated. If using Maven commands then
  Maven would need to be intalled and runing for the environment you are using. More details about Maven can be found
  [here](https://maven.apache.org/install.html). This can all be done from an editor or command line, whatever the implementer is most comfortable with.
- An internet connection with active internet connectivity, this is to ensure that if any Maven commands are
  run and any libraries need to be pulled down they can.<br/>
- Something to view Kafka topics with as you are developing and a potential interface for production when and if needed.
  Depending on your Kafka implementation can make this a non-issue; however, we wanted to make you aware of this need
  as being able to see data in every component natively is key for validating and implementing any solution. There are
  several open or inexpensive options to chose from and within the community we have used all of them below with success.
    - Open Source and Web based: [Provectus](https://github.com/provectus/kafka-ui)
    - Open Source and Web based: [Kafdrop](https://github.com/obsidiandynamics/kafdrop)
    - Open Source and Web based: [Kowl](https://github.com/redpanda-data/kowl)
    - Desktop Based and Paid Product after trial: [Offset Explorer](https://www.kafkatool.com/)

| Type                                                                                                                     |Usage/Implementation |
|--------------------------------------------------------------------------------------------------------------------------|----------|
| [Quarkus DataTier APIs](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier-APIs/Quarkus-APIs)        |Quarkus based APIs to access datatier.|
| [Node (Express) DataTier APIs](https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier-APIs/Express-APIs) |Javascript Express based APIs to access datatier.|

# API Testing
To help enable resources to leverage the APIs we have pre-built and are continuing to enhance a set of PostMan APIs.
The intent is to that anyone can see how the APIs can be leveraged simply and directly.

https://www.postman.com/balanscott/workspace/datasynthesis/collection/16526170-6e45e3ca-8eaf-47c9-a0cb-0e024a852505


*Enjoy and Happy Coding!!!*
