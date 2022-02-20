const db= require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const queryBuilder = require('../../general/functions/datatier/query-builder');
const express = require("express");
const router = express.Router();
const fhirBuilder = require("../../builders/buildmsgFHIR");
const fs = require("fs");

