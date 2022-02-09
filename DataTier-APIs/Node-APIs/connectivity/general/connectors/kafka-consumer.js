const kafka = require('../modern/kafka')
const dotenv = require('dotenv')
const routes = require('connectivity/general/connectors/idaas-routes-config');
const axios = require('axios')
const url = process.env.IDAAS_FHIR_URL;
dotenv.config({path: ".env"})
const consumer = kafka.consumer({
  groupId: process.env.DEFAULT_GROUP
})

const main = async () => {
  await consumer.connect()

  await consumer.subscribe({
    topic: process.env.KAFKA_TOPIC,
    fromBeginning: true
  })

  await consumer.run({
    eachMessage: async ({ topic, partition, message }) => {
        const entryResources = JSON.parse(message.value.toString())
        console.log(routes)
        entryResources.entry.forEach(resource=>{
            const route = routes[resource.resource.resourceType]
            console.log("resourceType" + resource.resource.resourceType)
            if(route){
                axios.post(`${url}${route}`, resource.resource).then(resp=>{
                    console.log(resp)
                })

            }
            else{
                console.log("route path not found")
            }


        })
    }
  })
}

main().catch(async error => {
  console.error(error)
  try {
    await consumer.disconnect()
  } catch (e) {
    console.error('Failed to gracefully disconnect consumer', e)
  }
  process.exit(1)
})