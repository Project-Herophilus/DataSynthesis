/*
 * (C) Copyright Data Fusion Specialists. 2022
 *
 * SPDX-License-Identifier: Apache-2.0
 */

const dayjs = require("dayjs");
const express = require("express");
const config = { path: path.resolve(__dirname, '../../../../' + '.env') }
const { v4: uuid } = require("uuid");
const UTCPlugin = require("dayjs/plugin/utc");
const TimezonePlugin = require("dayjs/plugin/timezone");
const { FHIRServer } = require("fhirsvrConnect");
const path = require("path");

dayjs.extend(UTCPlugin);
dayjs.extend(TimezonePlugin);

const createApi = () => {
  const app = express();
  const api = express.Router();

  app.use("/api", api);

  api.get("/getPatient", async (req, res) => {
    try {
      const server = new FHIRServer(config.hapiFhir.host);
      const patients = await server.search("Patient");
      const patient =
        patients[Math.floor(Math.random() * patients.length)].resource;
      res.status(200).json(patient);
    } catch (err) {
      console.error(err);
      res.sendStatus(500);
    }
  });

  api.get("/findLocations", async (req, res) => {
    const latitude = req.query.latitude;
    const longitude = req.query.longitude;
    const distance = req.query.distance;
    const distanceUnits = req.query.units || "mi";

    try {
      const server = new FHIRServer(config.hapiFhir.host);
      const results = await server.search("Location", {
        near: `${latitude}|${longitude}|${distance}|${distanceUnits}`,
      });
      const locations = results.map((result) => result.resource);
      res.status(200).json(locations);
    } catch (err) {
      console.error(err);
      res.sendStatus(500);
    }
  });

  api.get("/locations/:locationId/findPractitioners", async (req, res) => {
    const locationId = req.params.locationId;
    // TODO: use location id to create relation on practitioner
    try {
      const server = new FHIRServer(config.hapiFhir.host);
      const results = await server.search("Practitioner");
      const practitioners = results.map((result) => result.resource);
      res.status(200).json(practitioners);
    } catch (err) {
      console.error(err);
      res.sendStatus(500);
    }
  });

  api.get("/findSlots", (req, res) => {
    const timezone = req.query.timezone || "America/New_York";
    const appointmentTime = req.query.appointmentTime || "afternoon";

    const now = dayjs().tz(timezone);

    const afternoonSlots = [
      {
        resourceType: "Slot",
        id: uuid(),
        status: "free",
        start: now.add(1, "day").hour(12).minute(0).toISOString(),
        end: now.add(1, "day").hour(12).minute(30).toISOString(),
      },
      {
        resourceType: "Slot",
        id: uuid(),
        status: "free",
        start: now.add(1, "day").hour(12).minute(30).toISOString(),
        end: now.add(1, "day").hour(13).minute(0).toISOString(),
      },
      {
        resourceType: "Slot",
        id: uuid(),
        status: "free",
        start: now.add(2, "day").hour(14).minute(0).toISOString(),
        end: now.add(2, "day").hour(14).minute(30).toISOString(),
      },
      {
        resourceType: "Slot",
        id: uuid(),
        status: "free",
        start: now.add(2, "day").hour(14).minute(30).toISOString(),
        end: now.add(2, "day").hour(15).minute(0).toISOString(),
      },
    ];

    const morningSlots = [
      {
        resourceType: "Slot",
        id: uuid(),
        status: "free",
        start: now.add(1, "day").hour(9).minute(0).toISOString(),
        end: now.add(1, "day").hour(9).minute(30).toISOString(),
      },
      {
        resourceType: "Slot",
        id: uuid(),
        status: "free",
        start: now.add(1, "day").hour(9).minute(30).toISOString(),
        end: now.add(1, "day").hour(10).minute(0).toISOString(),
      },
      {
        resourceType: "Slot",
        id: uuid(),
        status: "free",
        start: now.add(2, "day").hour(9).minute(0).toISOString(),
        end: now.add(2, "day").hour(9).minute(30).toISOString(),
      },
      {
        resourceType: "Slot",
        id: uuid(),
        status: "free",
        start: now.add(2, "day").hour(9).minute(30).toISOString(),
        end: now.add(2, "day").hour(10).minute(0).toISOString(),
      },
    ];

    let slots;
    if (appointmentTime === "morning") {
      slots = morningSlots;
    } else {
      slots = afternoonSlots;
    }

    res.status(200).json(slots);
  });

  return app;
};

module.exports = createApi;
