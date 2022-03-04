/*
 * (C) Copyright Data Fusion Specialists. 2022
 *
 * SPDX-License-Identifier: Apache-2.0
 */
const path = require('path')
require('dotenv').config({ path: path.resolve(__dirname, '../../../../' + '.env') })
const { Axios } = require("axios");
const path = require("path");
//const resources = require("./resources");

class FHIRServer {
  constructor(

      host,
      port = 8080,
      protocol = "http",
      basePath = "/hapi-fhir-jpaserver/fhir",
      version = "R4"
  ) {
    this.config = {
      //use .env variables here
      //fhir_server_host
      //fhir_server_port
      //fhir_server_baseurl
      //fhir_protocol
      host,
      port,
      protocol,
      basePath,
      version,
    };
    this.client = new Axios({
      baseURL: `${this.config.protocol}://${this.config.host}:${this.config.port}${this.config.basePath}`,
    });
  }

  /*

    get = (resourceType, id) => {
      return this.client.get(`/${resourceType}/${id}`).then((result) => {
        if (typeof result.data === "string") {
          return JSON.parse(result.data);
        }
        return result.data;
      });
    };

    create = (resourceType, resource) => {
      return this.client
        .post(`/${resourceType}`, JSON.stringify(resource), {
          headers: { "Content-Type": "application/json" },
        })
        .then((result) => result.data);
    };

    search = (resourceType, params) => {
      return this.client
        .get(`/${resourceType}`, { params })
        .then((result) => {
          if (typeof result.data === "string") {
            return JSON.parse(result.data);
          }
          return result.data;
        })
        .then((bundle) => bundle.entry);
    };
 */
}


module.exports = {
  FHIRServer,
  //resources,
};
