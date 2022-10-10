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
  const quantity = req.query.quantity || 1000;
  const results = await dataattributesGenerator.generateAddress_Record_US(quantity)
  res.json(results)
});


router.get("/genericregex", async(req, res) => {
    const quantity = parseInt(req.query.quantity) || 1000;
    const regExp = req.RegExpression || '^[%#@&]{1}[A-Z]{3}[%#@&]{1}[0-9]{1}[A-Z]{2}$';
    const results = dataattributesGenerator.generateGenericRegex(regExp, quantity)
    res.json(results)
});

router.get("/accountnumbers", async(req, res) => {
    const quantity = parseInt(req.query.quantity) || 1000;
    const regExp = req.RegExpression || '^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$';
    const results = dataattributesGenerator.generateAccountNumbers(regExp, quantity)
    res.json(results)
});

router.get("/bankaccounts", async(req, res) => {
    const quantity = parseInt(req.query.quantity) || 1000;
    const regExp = req.RegExpression || '^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$';
    const results = dataattributesGenerator.generateBankAccounts(regExp, quantity)
    res.json(results)
});

router.get("/creditcards", async(req, res) => {
    const quantity = parseInt(req.query.quantity) || 1000;
    const ccName = req.CrediCardName || "all";
    const results = dataattributesGenerator.generateCreditCards(quantity, ccName)
    res.json(results)
});

router.get("/dateofbirths", async(req, res) => {
    const quantity = parseInt(req.query.quantity) || 1000;
    const beginyear = req.DOBStartYear || "1965";
    const results = dataattributesGenerator.generateDateOfBirths(beginyear, quantity)
    res.json(results)
});

router.get("/driverslicenses", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const usstate = req.usstate || "AL";
    const results = dataattributesGenerator.generateDLN(quantity,usstate)
    res.json(results)
});

router.get("/ein", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const results = dataattributesGenerator.generateEIN(quantity)
    res.json(results)
});

router.get("/phonenumbers-us", async(req, res) => {
    const quantity = parseInt(req.query.quantity) || 1000;
    const country = req.query.country || 'us';
    const results = dataattributesGenerator.generatePhoneNumbersUS(country,quantity)
    res.json(results)

});

router.get("/phonenumbers-intl", async(req, res) => {
    const quantity = parseInt(req.query.quantity) || 1000;
    const country = req.query.country || "fr";
    const results = dataattributesGenerator.generatePhoneNumbersIntl(country, quantity)
    res.json(results)

});

router.get("/serialnumber-basic", async(req, res) => {
    const quantity = parseInt(req.query.quantity) || 1000;
    const regExp = req.RegExpression || '^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$';
    const results = dataattributesGenerator.generateSerialNumbers_Basic(regExp, quantity)
    res.json(results)
});

router.get("/serialnumber-complex", async(req, res) => {
    const quantity = parseInt(req.query.quantity) || 1000;
    const results = dataattributesGenerator.generateSerialNumbers_Complex(quantity)
    res.json(results)
});

router.get("/ssn", async(req, res) => {
    const quantity = parseInt(req.query.quantity) || 1000;
    const results = dataattributesGenerator.generateSSN(quantity)
    res.json(results)
});

router.get("/useridentities", async(req, res) => {
    const quantity = parseInt(req.query.count) || 1000;
    const regExp = req.RegExpression || '^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$';
    const results = dataattributesGenerator.generateUserIdentities(regExp, quantity)
    res.json(results)
});

module.exports = router;
