//const db= require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const queryBuilder = require('../../general/datatier/reusableQueries');
const express = require("express");
const router = express.Router();
const dataattributesGenerator = require("../../builders/buildDataAttributes");
const fs = require("fs");

router.get("/addresses", async(req, res) => {
  let dataResults;
  res.setHeader("Content-Type", "text/plain");
  const table = req.query.table;
  const limit = req.query.limit || 1000;
  const results = await dataattributesGenerator.generateAddress_Record_US(limit)
  res.json(results)
});

router.get("/phonenumbers-us", async(req, res) => {
    const number_of_phone_numbers = parseInt(req.query.count) || 1000;
    const country = req.query.country || "US";
    const results = dataattributesGenerator.generateUSPhoneNumbers(number_of_phone_numbers, country)
    res.json(results)
  
});
/* -- */

router.get("/genericregex-generator", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const regExp = req.RegExpression || "'^[%#@&]{1}[A-Z]{3}[%#@&]{1}[0-9]{1}[A-Z]{2}$',25)";
    const results = dataattributesGenerator.generateGenericRegex(regExp, quantity)
    res.json(results)
});

router.get("/accountnumbers", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const regExp = req.RegExpression || "'^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',25)";
    const results = dataattributesGenerator.generateAccountNumbers(regExp, quantity)
    res.json(results)
});


router.get("/address-us", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const results = dataattributesGenerator.generateAddress_Record_US(quantity)
    res.json(results)
});

router.get("/bankaccounts", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const regExp = req.RegExpression || "'^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',25)";
    const results = dataattributesGenerator.generateBankAccounts(regExp, quantity)
    res.json(results)
});

router.get("/creditcards", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const ccName = req.CrediCardName || "all";
    const results = dataattributesGenerator.generateCreditCards(quantity, ccName)
    res.json(results)
});

/* - DLN - */

router.get("/dateofbirths", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const beginyear = req.DOBStartYear || "1965";
    const results = dataattributesGenerator.generateDateOfBirths(beginyear, quantity)
    res.json(results)
});

router.get("/ein", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const results = dataattributesGenerator.generateEIN(quantity)
    res.json(results)
});

/* - Phone anumber Intl - */

router.get("/serialnumber-basic", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const regExp = req.RegExpression || "'^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',25)";
    const results = dataattributesGenerator.generateSerialNumbers_Basic(regExp, quantity)
    res.json(results)
});

router.get("/serialnumber-complex", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const results = dataattributesGenerator.generateSerialNumbers_Complex(quantity)
    res.json(results)
});

router.get("/ssn", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const results = dataattributesGenerator.generateSerialNumbers_Complex(quantity)
    res.json(results)
});

router.get("/useridentities", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const regExp = req.RegExpression || "'^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',25)";
    const results = dataattributesGenerator.generateUserIdentities(regExp, quantity)
    res.json(results)
});

module.exports = router;
