
const dotenv = require('dotenv');
dotenv.config({path: `${__dirname}/.env`})

  
// import the `Kafka` instance from the kafkajs library
const { Kafka } = require("kafkajs")
const config = process.env
// the client ID lets kafka know who's producing the messages
const clientId = config.CLIENT_ID
// we can define the list of brokers in the cluster
const brokers = [config.KAFKA_SERVER]
// this is the topic to which we want to write messages

// initialize a new kafka client and initialize a producer from it
const kafka = new Kafka({ clientId, brokers })
const producer = kafka.producer()

// we define an async function that writes a new message each second
const produce = async (topic, message) => {
    console.log("produce", message)
    await producer.connect()
    try {
        await producer.send({
            topic, 
            messages: [
                {key: String(0), 
                value: JSON.stringify(message)}
            ]
        })
    }
    catch(err) {
        console.error("could not write message"+ err)
    }
}

module.exports = produce 