const { Kafka } = require('kafkajs')

const kafka = new Kafka({
  clientId: 'my-app',
  brokers: ['b-3.fdps-dev-msk.1wplbu.c23.kafka.us-east-1.amazonaws.com:9096','b-2.fdps-dev-msk.1wplbu.c23.kafka.us-east-1.amazonaws.com:9096','b-1.fdps-dev-msk.1wplbu.c23.kafka.us-east-1.amazonaws.com:9096'],
  ssl: true,
  sasl: {
    mechanism: 'scram-sha-512', // scram-sha-256 or scram-sha-512
    username: 'admin',
    password: 'admin'
  },
})

const producer = kafka.producer()

const produce = async (topic_name,msg) => {
  // Producing
  await producer.connect()
  await producer.send({
    topic: topic_name,
    messages: [
      { value: JSON.stringify(msg)},
    ],
  })
}

module.exports = produce