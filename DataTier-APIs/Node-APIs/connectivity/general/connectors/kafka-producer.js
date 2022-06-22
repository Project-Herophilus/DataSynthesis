const dotenv = require('dotenv');
const path = require("path");
dotenv.config({ path: path.resolve(__dirname, '../../../../' +
    '.env') })
// import the `Kafka` instance from the kafkajs library
const { Kafka } = require("kafkajs")
const config = process.env
// the client ID lets kafka know who's producing the messages
const clientId = config.kafka_clientid
// we can define the list of brokers in the cluster
const brokers = [config.kafka_server]
// initialize a new kafka client and initialize a producer from it
const kafka = new Kafka({ clientId, brokers })
const producer = kafka.producer()

// we define an async function that writes a new message each second
const produce = async (topic, message) => {
    //console.log("produce", message)
    await producer.connect()
    try {
        await producer.senad({
            topic, 
            messages: [
                {key: String(0), 
                value: JSON.stringify(message)}
            ]
        })
    }
    catch(err) {
        console.error("Could not write out message to Kafka "+ err)
    }
}

module.exports = produce 