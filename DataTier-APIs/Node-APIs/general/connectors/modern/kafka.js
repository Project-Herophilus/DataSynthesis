const { Kafka } = require('kafkajs')
const dotenv = require('dotenv');
dotenv.config({path: ".env"})

const { kadka_uid: username, kafka_passwd: password } = process.env
const sasl = username && password ? { username, password, mechanism: 'plain' } : null
const ssl = !!sasl

// This creates a client instance that is configured to connect to the Kafka broker provided by
// the environment variable KAFKA_BOOTSTRAP_SERVER
const kafka = new Kafka({
  clientId: 'component-router',
  brokers: [process.env.kafka_server],
  ssl,
  sasl
})

module.exports = kafka