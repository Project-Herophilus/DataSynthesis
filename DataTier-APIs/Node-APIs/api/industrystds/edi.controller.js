const db= require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const queryBuilder = require('../../general/functions/datatier/reusableQueries');
const express = require("express");
const router = express.Router();
const hl7Builder = require("../../builders/buildmsgEDI");
const fs = require("fs");