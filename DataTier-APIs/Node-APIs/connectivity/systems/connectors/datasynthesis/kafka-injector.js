const api = require("../../../../api/routes")
const dotenv = require('dotenv');
const express = require('express')
dotenv.config({path: `${__dirname}/.env`})
//const kafkaConnect = require("/general/connectors/modern/kafka")
//const consumer = kafka.consumer({ groupId: process.env.DEFAULT_GROUP})
const clientId = "my-app"
const { Kafka } = require("kafkajs")
let kafkaBroker = process.env.kafka_server;
const kafka = new Kafka({ clientId, kafkaBroker })
const producer = kafka.producer()
const topic = "message-log"

console.log("App running ");
// initialize a new kafka client and initialize a producer from it
// we define an async function that writes a new message each second
const produce = async () => {
    console.log("Connecting to Kafka ");
    await producer.connect()
    console.log("Connected to Kafka ");
    let i = 0
    // after the produce has connected, we start an interval timer
    setInterval(async () => {
        try {
            // send a message to the configured topic with
            // the key and value formed from the current value of `i`
            await producer.send({
                topic,
                messages: [
                    {
                        key: String(i),
                        value: "this is message " + i,
                    },
                ],
            })

            // if the message is written successfully, log it and increment `i`
            console.log("writes: ", i)
            i++
        } catch (err) {
            console.error("could not write message " + err)
        }
    }, 1000)
}
module.exports = produce;