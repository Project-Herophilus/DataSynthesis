/*
 * (C) Copyright Data Fusion Specialists. 2022
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

const { Axios } = require("axios");

const DEFAULT_FHIR_SERVER_CONFIG = {
  port: 8080,
  protocol: "http",
  baseUrl: "/hapi-fhir-jpaserver/fhir",
  version: "R4",
};

/**
 * Creates a new client to interface with the REST API of a FHIR server. The current
 * supported versions are R4. The connection to the server can be configured with
 * environment variables.
 *
 * For an overview of the exposed REST API, see https://www.hl7.org/fhir/http.html.
 *
 * @author Samuel Gamage
 */
class FHIRServerClient {
  constructor(config = DEFAULT_FHIR_SERVER_CONFIG) {
    // Initialize the config
    this.config = {
      host: process.env.FHIR_SERVER_HOST || config.host,
      port: process.env.FHIR_SERVER_PORT || config.port,
      protocol: process.env.FHIR_SERVER_PROTOCOL || config.protocol,
      baseUrl: process.env.FHIR_SERVER_BASE_URL || config.baseUrl,
      version: process.env.FHIR_SERVER_VERSION || config.version,
    };

    if (!this.config.host) {
      throw new Error(
        "[FHIR Server Connector]: No host URL was provided. Please set it in the enviornment using `FHIR_SERVER_HOST` or pass it in the config object."
      );
    }

    this.config.baseUrl = this.config.baseUrl.replace(/\/?$/, "/");

    // Initialize the axios client used to communicate with the server
    this.client = new Axios({
      baseURL: `${this.config.protocol}://${this.config.host}:${this.config.port}/${this.config.baseUrl}`,
    });
  }

  /**
   * Parse a response from the FHIR server
   * @param {Object} response Axios HTTP response
   * @returns Parsed response
   */
  parseResponse = (response) => {
    if (typeof response.data === "string") {
      return JSON.parse(response.data);
    }
    return response.data;
  };

  /**
   * Gets a resource from the server. See https://www.hl7.org/fhir/search.html for more info.
   * @param {String} resourceType Resource type (e.g. Patient, Medication, etc.)
   * @param {String} id Resource ID
   * @returns Parsed JSON resource
   */
  get = (resourceType, id) => {
    return this.client
      .get(`/${resourceType}/${id}`)
      .then((response) => this.parseResponse(response));
  };

  /**
   * Creates a resource from data. See https://www.hl7.org/fhir for more info.
   * @param {Object} resource Constructed JSON resource. Must have a valid `resourceType` property.
   * @returns Created resource
   */
  create = (resource) => {
    return this.client
      .post(`/${resource.resourceType}`, JSON.stringify(resource), {
        headers: { "Content-Type": "application/json" },
      })
      .then((response) => this.parseResponse(response));
  };

  /**
   * Searches for resources with given params. See https://www.hl7.org/fhir/search.html for more info.
   * @param {String} resourceType Resource type (e.g. Patient, Medication, etc.)
   * @param {String} params Search parameters
   * @returns
   */
  search = (resourceType, params) => {
    return this.client
      .get(`/${resourceType}`, { params })
      .then((response) => this.parseResponse(response))
      .then((bundle) => bundle.entry);
  };
}

module.exports = {
  FHIRServerClient,
  DEFAULT_FHIR_SERVER_CONFIG,
};
