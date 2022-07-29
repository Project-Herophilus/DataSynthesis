const kafka = require('../modern/kafka')
const dotenv = require('dotenv')
//require('dotenv').config({ path: path.resolve(__dirname, '../../../../' + '.env') })
const iDaaSRoutes = require('connectivity/systems/connectors/idaas/idaas-routes-config');
const axios = require('axios')
const path = require("path");
const url = process.env.iDaaS_FHIR_Server_URI;
const consumer = kafka.consumer({
  groupId: process.env.kafka_group
})

const main = async () => {
  await consumer.connect()

  await consumer.subscribe({
    topic: process.env.KAFKA_TOPIC,
    fromBeginning: true
  })

  // Process FHIR Resources
  await consumer.run({
    eachMessage: async ({ topic, partition, message }) => {
        const entryResources = JSON.parse(message.value.toString())
        console.log(iDaaSRoutes)
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