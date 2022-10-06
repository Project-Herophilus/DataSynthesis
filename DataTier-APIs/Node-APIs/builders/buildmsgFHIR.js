
const moment = require("moment")
module.exports = {

    generateFHIR_Resource(resourceType,data) {

        const fhirResourcesTemplate = {
            "patient": {
                "identifier": [
                    {
                      "use": "usual",
                      "type": {
                        "coding": [
                          {
                            "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                            "code": "MR"
                          }
                        ]
                      },
                      "system": `urn:oid:${data.registeredapp}`,
                      "value": data.accountnumbersid,
                      "period": {
                        "start": moment().format("MM DD YYYY")
                      },
                      "assigner": {
                        "display": "Data Synthesis"
                      }
                    }
                  ],
                name: [
                    {
                        "use": "official",
                        "family": data.lastname,
                        "given": [
                          data.firstname
                        ]
                      },
                ],
                telecom: [
                    {
                        system: "phone",
                        value: data.phonenumbervalue,
                        use: "mobile",
                    },
                    {
                        system: "email",
                        value: "replacethisdynamically@aol.com",
                        use: "home",
                    },
                ],
                gender:
                    data.gender === "M"
                        ? "male"
                        : data.gender === "F"
                            ? "female"
                            : "other",
                birthDate: moment(data.dateofbirth).format("YYYY-MM-DD"), // YYYY-MM-DD
                "_birthDate": {
                    "extension": [
                      {
                        "url": "http://hl7.org/fhir/StructureDefinition/patient-birthTime",
                        "valueDateTime": data.dateofbirthdate
                      }
                    ]
                  },
                "deceasedBoolean": false,
                address: [
                    {
                        use: "home",
                        line: [data.addressstreet, data.addressstreet2],
                        city: data.city,
                        state: data.statecode,
                        postalCode: data.zipcode,
                        country: data.country,
                        text: `${data.addressstreet}, ${data.city}, ${data.statecode} ${data.zipcode}`,
                    },
                ],
                //create contact later
            }
        }
        return fhirResourcesTemplate[resourceType]
    }
}