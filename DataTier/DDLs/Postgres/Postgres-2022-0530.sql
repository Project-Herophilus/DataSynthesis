--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8
-- Dumped by pg_dump version 14.2

-- Started on 2022-05-31 00:45:53 CDT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 20544)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


SET default_table_access_method = heap;

--
-- TOC entry 204 (class 1259 OID 18077)
-- Name: dataexisting_ababanking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dataexisting_ababanking (
                                         ababankingid integer NOT NULL,
                                         routingnumber character varying(9) DEFAULT 'NULL'::character varying,
                                         telegraphicname character varying(20) DEFAULT 'NULL'::character varying,
                                         customername character varying(36) DEFAULT 'NULL'::character varying,
                                         city character varying(20) DEFAULT 'NULL'::character varying,
                                         statecode character varying(2) DEFAULT 'NULL'::character varying,
                                         zipcode character varying(5) DEFAULT 'NULL'::character varying,
                                         createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                         statusid integer DEFAULT 1,
                                         createduser character varying(20) DEFAULT 'NULL'::character varying,
                                         registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 203 (class 1259 OID 18075)
-- Name: dataexisting_ababanking_ababankingid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataexisting_ababanking_ababankingid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 203
-- Name: dataexisting_ababanking_ababankingid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataexisting_ababanking_ababankingid_seq OWNED BY dataexisting_ababanking.ababankingid;


--
-- TOC entry 206 (class 1259 OID 18095)
-- Name: dataexisting_areacode; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dataexisting_areacode (
                                       areacodeid integer NOT NULL,
                                       areacodevalue character varying(3) NOT NULL,
                                       timezone character varying(3) DEFAULT 'NULL'::character varying,
                                       statecode character varying(2) DEFAULT 'NULL'::character varying,
                                       createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                       statusid integer DEFAULT 1,
                                       createduser character varying(20) DEFAULT 'NULL'::character varying,
                                       registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 205 (class 1259 OID 18093)
-- Name: dataexisting_areacode_areacodeid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataexisting_areacode_areacodeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 205
-- Name: dataexisting_areacode_areacodeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataexisting_areacode_areacodeid_seq OWNED BY dataexisting_areacode.areacodeid;


--
-- TOC entry 207 (class 1259 OID 18107)
-- Name: dataexisting_areacodeintl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dataexisting_areacodeintl (
                                           iddcode character varying(5) NOT NULL,
                                           countryid integer,
                                           createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 209 (class 1259 OID 18117)
-- Name: dataexisting_companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dataexisting_companies (
                                        companiesid integer NOT NULL,
                                        companyname character varying(79) DEFAULT 'NULL'::character varying,
                                        createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                        statusid integer DEFAULT 1,
                                        createduser character varying(20) DEFAULT 'NULL'::character varying,
                                        registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 208 (class 1259 OID 18115)
-- Name: dataexisting_companies_companiesid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataexisting_companies_companiesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 208
-- Name: dataexisting_companies_companiesid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataexisting_companies_companiesid_seq OWNED BY dataexisting_companies.companiesid;


--
-- TOC entry 211 (class 1259 OID 18130)
-- Name: dataexisting_namefirst; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dataexisting_namefirst (
                                        firstnameid integer NOT NULL,
                                        firstname character varying(39) DEFAULT 'NULL'::character varying,
                                        gender character varying(1) DEFAULT 'NULL'::character varying,
                                        statusid integer DEFAULT 1,
                                        createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                        createduser character varying(20) DEFAULT 'NULL'::character varying,
                                        registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 210 (class 1259 OID 18128)
-- Name: dataexisting_namefirst_firstnameid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataexisting_namefirst_firstnameid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 210
-- Name: dataexisting_namefirst_firstnameid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataexisting_namefirst_firstnameid_seq OWNED BY dataexisting_namefirst.firstnameid;


--
-- TOC entry 213 (class 1259 OID 18144)
-- Name: dataexisting_namelast; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dataexisting_namelast (
                                       lastnameid integer NOT NULL,
                                       lastname character varying(69) DEFAULT 'NULL'::character varying,
                                       statusid integer DEFAULT 1 NOT NULL,
                                       createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                       createduser character varying(20) DEFAULT 'NULL'::character varying,
                                       registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 212 (class 1259 OID 18142)
-- Name: dataexisting_namelast_lastnameid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataexisting_namelast_lastnameid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 212
-- Name: dataexisting_namelast_lastnameid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataexisting_namelast_lastnameid_seq OWNED BY dataexisting_namelast.lastnameid;


--
-- TOC entry 215 (class 1259 OID 18157)
-- Name: dataexisting_upccodes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dataexisting_upccodes (
                                       upccodeid integer NOT NULL,
                                       upccodename character varying(15) DEFAULT 'NULL'::character varying,
                                       upcproductname character varying(150) DEFAULT 'NULL'::character varying,
                                       createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                       statusid integer DEFAULT 1,
                                       registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 214 (class 1259 OID 18155)
-- Name: dataexisting_upccodes_upccodeid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataexisting_upccodes_upccodeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 214
-- Name: dataexisting_upccodes_upccodeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataexisting_upccodes_upccodeid_seq OWNED BY dataexisting_upccodes.upccodeid;


--
-- TOC entry 217 (class 1259 OID 18170)
-- Name: dataexisting_zipcodeintl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dataexisting_zipcodeintl (
                                          zipcodeintnlid integer NOT NULL,
                                          zipcode character(10) NOT NULL,
                                          zipcodetype character varying(15) DEFAULT 'NULL'::character varying,
                                          city character varying(75) DEFAULT 'NULL'::character varying,
                                          country integer,
                                          lattitude character varying(10) DEFAULT 'NULL'::character varying,
                                          longitude character varying(10) DEFAULT 'NULL'::character varying,
                                          "Location" character varying(99) DEFAULT 'NULL'::character varying,
                                          createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                          statusid integer DEFAULT 1,
                                          createduser character varying(20) DEFAULT 'NULL'::character varying,
                                          registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 216 (class 1259 OID 18168)
-- Name: dataexisting_zipcodeintl_zipcodeintnlid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataexisting_zipcodeintl_zipcodeintnlid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 216
-- Name: dataexisting_zipcodeintl_zipcodeintnlid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataexisting_zipcodeintl_zipcodeintnlid_seq OWNED BY dataexisting_zipcodeintl.zipcodeintnlid;


--
-- TOC entry 219 (class 1259 OID 18187)
-- Name: dataexisting_zipcodeus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dataexisting_zipcodeus (
                                        zipcodeid integer NOT NULL,
                                        zipcode character(5) NOT NULL,
                                        zipcodetype character varying(15) DEFAULT 'NULL'::character varying,
                                        city character varying(75) DEFAULT 'NULL'::character varying,
                                        statecode character varying(2) DEFAULT 'NULL'::character varying,
                                        lattitude character varying(10) DEFAULT 'NULL'::character varying,
                                        longitude character varying(10) DEFAULT 'NULL'::character varying,
                                        lctn character varying(99) DEFAULT 'NULL'::character varying,
                                        createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                        statusid integer DEFAULT 1,
                                        createduser character varying(20) DEFAULT 'NULL'::character varying,
                                        registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 218 (class 1259 OID 18185)
-- Name: dataexisting_zipcodeus_zipcodeid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataexisting_zipcodeus_zipcodeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 218
-- Name: dataexisting_zipcodeus_zipcodeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataexisting_zipcodeus_zipcodeid_seq OWNED BY dataexisting_zipcodeus.zipcodeid;


--
-- TOC entry 221 (class 1259 OID 18205)
-- Name: datagenerated_accountnumbers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datagenerated_accountnumbers (
                                              accountnumbersid integer NOT NULL,
                                              accountnumbervalue character varying(20) DEFAULT 'NULL'::character varying,
                                              createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                              createduser character varying(20) DEFAULT 'NULL'::character varying,
                                              statusid integer DEFAULT 1,
                                              registeredapp character(38) DEFAULT 'NULL'::bpchar,
                                              datagentypeid integer
);


--
-- TOC entry 220 (class 1259 OID 18203)
-- Name: datagenerated_accountnumbers_accountnumbersid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datagenerated_accountnumbers_accountnumbersid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 220
-- Name: datagenerated_accountnumbers_accountnumbersid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datagenerated_accountnumbers_accountnumbersid_seq OWNED BY datagenerated_accountnumbers.accountnumbersid;


--
-- TOC entry 223 (class 1259 OID 18218)
-- Name: datagenerated_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datagenerated_addresses (
                                         addressid integer NOT NULL,
                                         addressstreet character varying(99) DEFAULT 'NULL'::character varying,
                                         addressstreet2 character varying(59) DEFAULT 'NULL'::character varying,
                                         createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                         statusid integer DEFAULT 1,
                                         createduser character varying(20) DEFAULT 'NULL'::character varying,
                                         registeredapp character(38) DEFAULT 'NULL'::bpchar,
                                         datagentypeid integer
);


--
-- TOC entry 222 (class 1259 OID 18216)
-- Name: datagenerated_addresses_addressid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datagenerated_addresses_addressid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 222
-- Name: datagenerated_addresses_addressid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datagenerated_addresses_addressid_seq OWNED BY datagenerated_addresses.addressid;


--
-- TOC entry 225 (class 1259 OID 18232)
-- Name: datagenerated_bankaccount; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datagenerated_bankaccount (
                                           bankaccountsid integer NOT NULL,
                                           bankaccountvalue character varying(17) DEFAULT 'NULL'::character varying,
                                           createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           createduser character varying(20) DEFAULT 'NULL'::character varying,
                                           registeredapp character(38) DEFAULT 'NULL'::bpchar,
                                           datagentypeid integer
);


--
-- TOC entry 224 (class 1259 OID 18230)
-- Name: datagenerated_bankaccount_bankaccountsid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datagenerated_bankaccount_bankaccountsid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 224
-- Name: datagenerated_bankaccount_bankaccountsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datagenerated_bankaccount_bankaccountsid_seq OWNED BY datagenerated_bankaccount.bankaccountsid;


--
-- TOC entry 227 (class 1259 OID 18245)
-- Name: datagenerated_creditcard; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datagenerated_creditcard (
                                          creditcardid integer NOT NULL,
                                          creditcardnumber character varying(20) DEFAULT 'NULL'::character varying,
                                          creditcardname character varying(20) DEFAULT 'NULL'::character varying,
                                          createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                          statusid integer DEFAULT 1,
                                          createduser character varying(20) DEFAULT 'NULL'::character varying,
                                          registeredapp character(38) DEFAULT 'NULL'::bpchar,
                                          datagentypeid integer
);


--
-- TOC entry 226 (class 1259 OID 18243)
-- Name: datagenerated_creditcard_creditcardid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datagenerated_creditcard_creditcardid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 226
-- Name: datagenerated_creditcard_creditcardid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datagenerated_creditcard_creditcardid_seq OWNED BY datagenerated_creditcard.creditcardid;


--
-- TOC entry 323 (class 1259 OID 20895)
-- Name: datagenerated_custom; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datagenerated_custom (
                                      datagencustomdid integer NOT NULL,
                                      customidentifier character varying(40) DEFAULT 'NULL'::character varying,
                                      customidentifierdesc character varying(29) DEFAULT 'NULL'::character varying,
                                      createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                      statusid integer DEFAULT 1,
                                      createduser character varying(20) DEFAULT 'NULL'::character varying,
                                      registeredapp character(38) DEFAULT 'NULL'::bpchar,
                                      datagentypeid integer
);


--
-- TOC entry 322 (class 1259 OID 20893)
-- Name: datagenerated_custom_datagencustomdid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datagenerated_custom_datagencustomdid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 322
-- Name: datagenerated_custom_datagencustomdid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datagenerated_custom_datagencustomdid_seq OWNED BY datagenerated_custom.datagencustomdid;


--
-- TOC entry 229 (class 1259 OID 18259)
-- Name: datagenerated_dateofbirth; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datagenerated_dateofbirth (
                                           dateofbirthsid integer NOT NULL,
                                           dateofbirth character varying(12) DEFAULT 'NULL'::character varying,
                                           dateofbirthdate date,
                                           age integer,
                                           createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           createduser character varying(20) DEFAULT 'NULL'::character varying,
                                           registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 228 (class 1259 OID 18257)
-- Name: datagenerated_dateofbirth_dateofbirthsid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datagenerated_dateofbirth_dateofbirthsid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 228
-- Name: datagenerated_dateofbirth_dateofbirthsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datagenerated_dateofbirth_dateofbirthsid_seq OWNED BY datagenerated_dateofbirth.dateofbirthsid;


--
-- TOC entry 231 (class 1259 OID 18272)
-- Name: datagenerated_driverslicenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datagenerated_driverslicenses (
                                               driverslicensesid integer NOT NULL,
                                               dln character varying(25) DEFAULT 'NULL'::character varying,
                                               statecode character varying(2) DEFAULT 'NULL'::character varying,
                                               createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                               statusid integer DEFAULT 1,
                                               datagentypeid integer,
                                               createduser character varying(20) DEFAULT 'NULL'::character varying,
                                               registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 230 (class 1259 OID 18270)
-- Name: datagenerated_driverslicenses_driverslicensesid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datagenerated_driverslicenses_driverslicensesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 230
-- Name: datagenerated_driverslicenses_driverslicensesid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datagenerated_driverslicenses_driverslicensesid_seq OWNED BY datagenerated_driverslicenses.driverslicensesid;


--
-- TOC entry 233 (class 1259 OID 18286)
-- Name: datagenerated_ein; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datagenerated_ein (
                                   einid integer NOT NULL,
                                   einvalue character varying(10) DEFAULT 'NULL'::character varying,
                                   createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                   statusid integer DEFAULT 1,
                                   createduser character varying(20) DEFAULT 'NULL'::character varying,
                                   registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 232 (class 1259 OID 18284)
-- Name: datagenerated_ein_einid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datagenerated_ein_einid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 232
-- Name: datagenerated_ein_einid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datagenerated_ein_einid_seq OWNED BY datagenerated_ein.einid;


--
-- TOC entry 235 (class 1259 OID 18299)
-- Name: datagenerated_phonenumber; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datagenerated_phonenumber (
                                           phonenumberid integer NOT NULL,
                                           phonenumbervalue character varying(8) DEFAULT 'NULL'::character varying,
                                           createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           createduser character varying(20) DEFAULT 'NULL'::character varying,
                                           registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 234 (class 1259 OID 18297)
-- Name: datagenerated_phonenumber_phonenumberid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datagenerated_phonenumber_phonenumberid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 234
-- Name: datagenerated_phonenumber_phonenumberid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datagenerated_phonenumber_phonenumberid_seq OWNED BY datagenerated_phonenumber.phonenumberid;


--
-- TOC entry 237 (class 1259 OID 18312)
-- Name: datagenerated_phonenumbersintl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datagenerated_phonenumbersintl (
                                                phonenumberintlid integer NOT NULL,
                                                phonenumbervalue character varying(12) DEFAULT 'NULL'::character varying,
                                                createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                                statusid integer DEFAULT 1,
                                                countryid integer,
                                                createduser character varying(20) DEFAULT 'NULL'::character varying,
                                                registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 236 (class 1259 OID 18310)
-- Name: datagenerated_phonenumbersintl_phonenumberintlid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datagenerated_phonenumbersintl_phonenumberintlid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 236
-- Name: datagenerated_phonenumbersintl_phonenumberintlid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datagenerated_phonenumbersintl_phonenumberintlid_seq OWNED BY datagenerated_phonenumbersintl.phonenumberintlid;


--
-- TOC entry 310 (class 1259 OID 20222)
-- Name: datagenerated_serialnumbers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datagenerated_serialnumbers (
                                             serialnumberid integer NOT NULL,
                                             serialnumbervalue character varying(25) DEFAULT 'NULL'::character varying,
                                             createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                             statusid integer DEFAULT 1,
                                             createduser character varying(20) DEFAULT 'NULL'::character varying,
                                             registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 309 (class 1259 OID 20220)
-- Name: datagenerated_serialnumbers_serialnumberid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datagenerated_serialnumbers_serialnumberid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 309
-- Name: datagenerated_serialnumbers_serialnumberid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datagenerated_serialnumbers_serialnumberid_seq OWNED BY datagenerated_serialnumbers.serialnumberid;


--
-- TOC entry 239 (class 1259 OID 18325)
-- Name: datagenerated_socialsecuritynumber; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datagenerated_socialsecuritynumber (
                                                    socialsecuritynumberid integer NOT NULL,
                                                    socialsecuritynumbervalue character varying(11) DEFAULT 'NULL'::character varying,
                                                    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                                    statusid integer DEFAULT 1,
                                                    createduser character varying(20) DEFAULT 'NULL'::character varying,
                                                    registeredapp character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 238 (class 1259 OID 18323)
-- Name: datagenerated_socialsecuritynumber_socialsecuritynumberid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datagenerated_socialsecuritynumber_socialsecuritynumberid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 238
-- Name: datagenerated_socialsecuritynumber_socialsecuritynumberid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datagenerated_socialsecuritynumber_socialsecuritynumberid_seq OWNED BY datagenerated_socialsecuritynumber.socialsecuritynumberid;


--
-- TOC entry 241 (class 1259 OID 18338)
-- Name: datagenerated_useridentities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datagenerated_useridentities (
                                              useridentitiesid integer NOT NULL,
                                              useridentityvalue character varying(20) DEFAULT 'NULL'::character varying,
                                              userdomain character varying(20) DEFAULT 'NULL'::character varying,
                                              additionalattributes character varying(40) DEFAULT 'NULL'::character varying,
                                              createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                              statusid integer DEFAULT 1,
                                              registeredapp character(38) DEFAULT 'NULL'::bpchar,
                                              datagentypeid integer
);


--
-- TOC entry 240 (class 1259 OID 18336)
-- Name: datagenerated_useridentities_useridentitiesid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datagenerated_useridentities_useridentitiesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 240
-- Name: datagenerated_useridentities_useridentitiesid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datagenerated_useridentities_useridentitiesid_seq OWNED BY datagenerated_useridentities.useridentitiesid;


--
-- TOC entry 320 (class 1259 OID 20531)
-- Name: datamodel_apis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datamodel_apis (
                                tablename character varying(64),
                                statusid integer DEFAULT 1,
                                createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                node_api_endpoint character varying(99),
                                quarkus_api_endpoint character varying(99),
                                api_desc character varying(99),
                                api_name character varying(49),
                                datamodelapiid integer NOT NULL
);


--
-- TOC entry 321 (class 1259 OID 20536)
-- Name: datamodel_apis_datamodelapiid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datamodel_apis_datamodelapiid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 321
-- Name: datamodel_apis_datamodelapiid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datamodel_apis_datamodelapiid_seq OWNED BY datamodel_apis.datamodelapiid;


--
-- TOC entry 242 (class 1259 OID 18350)
-- Name: datamodel_datatables; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datamodel_datatables (
                                      tablename character varying(64) NOT NULL,
                                      tableinformation character varying(249) DEFAULT 'NULL'::character varying,
                                      statusid integer DEFAULT 1,
                                      createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 243 (class 1259 OID 18358)
-- Name: datamodel_domain; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datamodel_domain (
                                  domainname character varying(64) NOT NULL,
                                  domaininformation character varying(249) DEFAULT 'NULL'::character varying,
                                  statusid integer DEFAULT 1,
                                  createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 245 (class 1259 OID 18368)
-- Name: datastructure_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datastructure_address (
                                       completeaddressid integer NOT NULL,
                                       address1 character varying(99) DEFAULT 'NULL'::character varying,
                                       city character varying(70) DEFAULT 'NULL'::character varying,
                                       stateid character varying(2) DEFAULT 'NULL'::character varying,
                                       zipcode character varying(10) DEFAULT 'NULL'::character varying,
                                       createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                       statusid integer DEFAULT 1,
                                       registeredapp character varying(38) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 244 (class 1259 OID 18366)
-- Name: datastructure_address_completeaddressid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datastructure_address_completeaddressid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 244
-- Name: datastructure_address_completeaddressid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datastructure_address_completeaddressid_seq OWNED BY datastructure_address.completeaddressid;


--
-- TOC entry 247 (class 1259 OID 18383)
-- Name: datastructure_bankaccount; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datastructure_bankaccount (
                                           databuiltbankaccountsid integer NOT NULL,
                                           bankaccountnumber character varying(12) DEFAULT 'NULL'::character varying,
                                           bankaccountname character varying(75) DEFAULT 'NULL'::character varying,
                                           bankroutingid character varying(9) DEFAULT 'NULL'::character varying,
                                           createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           registeredapp character varying(38) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 246 (class 1259 OID 18381)
-- Name: datastructure_bankaccount_databuiltbankaccountsid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datastructure_bankaccount_databuiltbankaccountsid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 246
-- Name: datastructure_bankaccount_databuiltbankaccountsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datastructure_bankaccount_databuiltbankaccountsid_seq OWNED BY datastructure_bankaccount.databuiltbankaccountsid;


--
-- TOC entry 249 (class 1259 OID 18397)
-- Name: datastructure_corporations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datastructure_corporations (
                                            databuiltcorporationid integer NOT NULL,
                                            corporationname character varying(99) DEFAULT 'NULL'::character varying,
                                            address1 character varying(99) DEFAULT 'NULL'::character varying,
                                            city character varying(70) DEFAULT 'NULL'::character varying,
                                            stateid character varying(2) DEFAULT 'NULL'::character varying,
                                            zipcode character varying(10) DEFAULT 'NULL'::character varying,
                                            createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                            statusid integer DEFAULT 1,
                                            registeredapp character varying(38) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 248 (class 1259 OID 18395)
-- Name: datastructure_corporations_databuiltcorporationid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datastructure_corporations_databuiltcorporationid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 248
-- Name: datastructure_corporations_databuiltcorporationid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datastructure_corporations_databuiltcorporationid_seq OWNED BY datastructure_corporations.databuiltcorporationid;


--
-- TOC entry 251 (class 1259 OID 18413)
-- Name: datastructure_names; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datastructure_names (
                                     databuiltnamesid integer NOT NULL,
                                     completename character varying(100) DEFAULT 'NULL'::character varying,
                                     gender character varying(1) DEFAULT 'NULL'::character varying,
                                     createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                     statusid integer DEFAULT 1,
                                     registeredapp character varying(38) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 250 (class 1259 OID 18411)
-- Name: datastructure_names_databuiltnamesid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datastructure_names_databuiltnamesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 250
-- Name: datastructure_names_databuiltnamesid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datastructure_names_databuiltnamesid_seq OWNED BY datastructure_names.databuiltnamesid;


--
-- TOC entry 253 (class 1259 OID 18426)
-- Name: datastructure_persondemographics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datastructure_persondemographics (
                                                  persondemographicsid integer NOT NULL,
                                                  dln character varying(25) DEFAULT 'NULL'::character varying,
                                                  dlnstate character varying(2) DEFAULT 'NULL'::character varying,
                                                  ssn character varying(11) DEFAULT 'NULL'::character varying,
                                                  dobvalue character varying(12) DEFAULT 'NULL'::character varying,
                                                  dobdate date,
                                                  age integer,
                                                  createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                                  statusid integer DEFAULT 1,
                                                  registeredapp character varying(38) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 252 (class 1259 OID 18424)
-- Name: datastructure_persondemographics_persondemographicsid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datastructure_persondemographics_persondemographicsid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 252
-- Name: datastructure_persondemographics_persondemographicsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datastructure_persondemographics_persondemographicsid_seq OWNED BY datastructure_persondemographics.persondemographicsid;


--
-- TOC entry 255 (class 1259 OID 18441)
-- Name: datastructure_phonenumbers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datastructure_phonenumbers (
                                            databuiltphonenumbersid integer NOT NULL,
                                            areacode character varying(3) DEFAULT 'NULL'::character varying,
                                            phonenumber character varying(8) DEFAULT 'NULL'::character varying,
                                            completephonenumber character varying(14) DEFAULT 'NULL'::character varying,
                                            createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                            statusid integer DEFAULT 1,
                                            registeredapp character varying(38) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 254 (class 1259 OID 18439)
-- Name: datastructure_phonenumbers_databuiltphonenumbersid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datastructure_phonenumbers_databuiltphonenumbersid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 254
-- Name: datastructure_phonenumbers_databuiltphonenumbersid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datastructure_phonenumbers_databuiltphonenumbersid_seq OWNED BY datastructure_phonenumbers.databuiltphonenumbersid;


--
-- TOC entry 257 (class 1259 OID 18455)
-- Name: datastructure_phonenumbersintl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datastructure_phonenumbersintl (
                                                databuiltphonenumbersintlid integer NOT NULL,
                                                areacode character varying(3) DEFAULT 'NULL'::character varying,
                                                phonenumber character varying(8) DEFAULT 'NULL'::character varying,
                                                completephonenumber character varying(14) DEFAULT 'NULL'::character varying,
                                                createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                                statusid integer DEFAULT 1,
                                                registeredapp character varying(38) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 256 (class 1259 OID 18453)
-- Name: datastructure_phonenumbersintl_databuiltphonenumbersintlid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datastructure_phonenumbersintl_databuiltphonenumbersintlid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 256
-- Name: datastructure_phonenumbersintl_databuiltphonenumbersintlid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datastructure_phonenumbersintl_databuiltphonenumbersintlid_seq OWNED BY datastructure_phonenumbersintl.databuiltphonenumbersintlid;


--
-- TOC entry 259 (class 1259 OID 18469)
-- Name: datastructure_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datastructure_products (
                                        databuiltproductsid integer NOT NULL,
                                        productid character varying(20) DEFAULT 'NULL'::character varying,
                                        productname character varying(99) DEFAULT 'NULL'::character varying,
                                        createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                        statusid integer DEFAULT 1,
                                        registeredapp character varying(38) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 258 (class 1259 OID 18467)
-- Name: datastructure_products_databuiltproductsid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE datastructure_products_databuiltproductsid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 258
-- Name: datastructure_products_databuiltproductsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE datastructure_products_databuiltproductsid_seq OWNED BY datastructure_products.databuiltproductsid;


--
-- TOC entry 260 (class 1259 OID 18480)
-- Name: impl_application; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE impl_application (
                                  appguid character(38) DEFAULT gen_random_uuid() NOT NULL,
                                  applicationcustomcode character varying(15) DEFAULT 'NULL'::character varying,
                                  applicationdesc character varying(50) DEFAULT 'NULL'::character varying,
                                  createduser character varying(20) DEFAULT 'NULL'::character varying,
                                  createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                  statusid integer DEFAULT 1,
                                  vendorid integer,
                                  industry_oid character varying(49),
                                  organization_uid character varying(49)
);


--
-- TOC entry 262 (class 1259 OID 18492)
-- Name: impl_codesets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE impl_codesets (
                               implcodesetid integer NOT NULL,
                               codesetsid bigint NOT NULL,
                               createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                               statusid integer DEFAULT 1,
                               organizationid character varying(38) DEFAULT 'NULL'::character varying,
                               applicationid character varying(38) DEFAULT 'NULL'::character varying,
                               industrystd character varying(6) DEFAULT 'NULL'::character varying,
                               externaltableid character varying(20) DEFAULT 'NULL'::character varying,
                               externalnotes character varying(149) DEFAULT 'NULL'::character varying,
                               externallink character varying(99) DEFAULT 'NULL'::character varying,
                               codesetdesc character varying(69)
);


--
-- TOC entry 264 (class 1259 OID 18509)
-- Name: impl_codesets_crossmaps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE impl_codesets_crossmaps (
                                         codesetcrossmapid integer NOT NULL,
                                         implcodesetsid bigint NOT NULL,
                                         codesettoapplicationid bigint,
                                         terminologystdto integer,
                                         createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                         statusid integer DEFAULT 1,
                                         createduser character varying(20) DEFAULT 'NULL'::character varying,
                                         transformcodevalue character varying(40) DEFAULT 'NULL'::character varying,
                                         transformcodedesc character varying(129) DEFAULT 'NULL'::character varying,
                                         originalcodevalue character varying(40),
                                         originalcodedesc character varying(40)
);


--
-- TOC entry 261 (class 1259 OID 18490)
-- Name: impl_codesets_implcodesetid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE impl_codesets_implcodesetid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 261
-- Name: impl_codesets_implcodesetid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE impl_codesets_implcodesetid_seq OWNED BY impl_codesets.implcodesetid;


--
-- TOC entry 263 (class 1259 OID 18507)
-- Name: impl_codesetscrossmaps_codesetcrossmapid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE impl_codesetscrossmaps_codesetcrossmapid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 263
-- Name: impl_codesetscrossmaps_codesetcrossmapid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE impl_codesetscrossmaps_codesetcrossmapid_seq OWNED BY impl_codesets_crossmaps.codesetcrossmapid;


--
-- TOC entry 318 (class 1259 OID 20303)
-- Name: refdata_devices_devicesid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_devices_devicesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 319 (class 1259 OID 20305)
-- Name: impl_devices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE impl_devices (
                              devicesid integer DEFAULT nextval('refdata_devices_devicesid_seq'::regclass) NOT NULL,
                              devicename character varying(40),
                              industryid integer,
                              devicetypeid integer,
                              createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                              statusid integer DEFAULT 1,
                              application character varying(38),
                              organization character varying(38)
);


--
-- TOC entry 265 (class 1259 OID 18559)
-- Name: impl_legalentities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE impl_legalentities (
                                    legalentityguid character(38) NOT NULL,
                                    locationname character varying(50) DEFAULT 'NULL'::character varying,
                                    address character varying(75) DEFAULT 'NULL'::character varying,
                                    city character varying(60) DEFAULT 'NULL'::character varying,
                                    stateid character varying(2) DEFAULT 'NULL'::character varying,
                                    zipcode character varying(12) DEFAULT 'NULL'::character varying,
                                    createduser character varying(20) DEFAULT 'NULL'::character varying,
                                    statusid integer DEFAULT 1,
                                    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
                                    locationurl character varying(99) DEFAULT 'NULL'::character varying,
                                    locationphone character varying(12) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 266 (class 1259 OID 18576)
-- Name: impl_organization; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE impl_organization (
                                   organizationguid character(38) NOT NULL,
                                   organizationinternalcode character varying(10) DEFAULT 'NULL'::character varying,
                                   organizationinternalid character varying(10) DEFAULT 'NULL'::character varying,
                                   organizationname character varying(50) DEFAULT 'NULL'::character varying,
                                   address character varying(75) DEFAULT 'NULL'::character varying,
                                   city character varying(60) DEFAULT 'NULL'::character varying,
                                   stateid character varying(2) DEFAULT 'NULL'::character varying,
                                   zipcode character varying(12) DEFAULT 'NULL'::character varying,
                                   createduser character varying(20) DEFAULT 'NULL'::character varying,
                                   statusid integer DEFAULT 1,
                                   createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
                                   legalentityguid character varying(38) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 268 (class 1259 OID 18594)
-- Name: impl_rulesets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE impl_rulesets (
                               ruleid integer NOT NULL,
                               rulename character varying(65) DEFAULT 'NULL'::character varying,
                               createduser character varying(20) DEFAULT 'NULL'::character varying,
                               createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                               statusid integer DEFAULT 1,
                               expirationdate timestamp without time zone
);


--
-- TOC entry 267 (class 1259 OID 18592)
-- Name: impl_rulesets_ruleid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE impl_rulesets_ruleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 267
-- Name: impl_rulesets_ruleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE impl_rulesets_ruleid_seq OWNED BY impl_rulesets.ruleid;


--
-- TOC entry 269 (class 1259 OID 18604)
-- Name: impl_rulesetsdefinitions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE impl_rulesetsdefinitions (
                                          rulesetdefinitionsid character(38) NOT NULL,
                                          rulesetdefinitionname character varying(50) DEFAULT 'NULL'::character varying,
                                          rulesetid bigint,
                                          steporderid integer,
                                          operationtypeid character varying(7) DEFAULT 'NULL'::character varying,
                                          rulesetdefvalue character(40) DEFAULT 'NULL'::bpchar,
                                          statusid integer DEFAULT 1,
                                          createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                          effectivedate timestamp without time zone,
                                          applicationid character varying(38) DEFAULT 'NULL'::character varying,
                                          termdate timestamp without time zone,
                                          dataattributeid integer
);


--
-- TOC entry 271 (class 1259 OID 18617)
-- Name: platform_appsettings_general; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE platform_appsettings_general (
                                              appsettingsid integer NOT NULL,
                                              appsettingname character varying(50) DEFAULT 'NULL'::character varying,
                                              appsettingvalue character varying(199) DEFAULT 'NULL'::character varying,
                                              createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                              statusid integer DEFAULT 1,
                                              registeredapp character varying(38) DEFAULT 'NULL'::character varying,
                                              defaultdatagenerationapp character varying(38) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 270 (class 1259 OID 18615)
-- Name: platform_appsettings_general_appsettingsid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE platform_appsettings_general_appsettingsid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 270
-- Name: platform_appsettings_general_appsettingsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE platform_appsettings_general_appsettingsid_seq OWNED BY platform_appsettings_general.appsettingsid;


--
-- TOC entry 273 (class 1259 OID 18631)
-- Name: platform_config_dataattributes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE platform_config_dataattributes (
                                                datagenconfigid integer NOT NULL,
                                                datatypegenconfigname character varying(25) DEFAULT 'NULL'::character varying,
                                                dataattributeid integer,
                                                runquantity integer,
                                                datagentypeid integer,
                                                createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                                statusid integer DEFAULT 1,
                                                createduser character varying(20) DEFAULT 'NULL'::character varying,
                                                applicationid character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 272 (class 1259 OID 18629)
-- Name: platform_config_datagen_datagenconfigid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE platform_config_datagen_datagenconfigid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 272
-- Name: platform_config_datagen_datagenconfigid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE platform_config_datagen_datagenconfigid_seq OWNED BY platform_config_dataattributes.datagenconfigid;


--
-- TOC entry 277 (class 1259 OID 18659)
-- Name: platform_config_datastructures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE platform_config_datastructures (
                                                platformdatastructuresid integer NOT NULL,
                                                datastructurename character varying(50) DEFAULT 'NULL'::character varying,
                                                sensitivityflagid integer,
                                                createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                                statusid integer DEFAULT 1,
                                                createduser character varying(20) DEFAULT 'NULL'::character varying,
                                                platformdatastructuresguid character(38) DEFAULT 'NULL'::bpchar,
                                                registeredapp character varying(38) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 279 (class 1259 OID 18673)
-- Name: platform_config_datastructures_dtl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE platform_config_datastructures_dtl (
                                                    platformdatastructurestodataattributesid integer NOT NULL,
                                                    platformdatastructuresid integer,
                                                    compositedatastructurename character varying(50) DEFAULT 'NULL'::character varying,
                                                    sensitivityflagid integer DEFAULT 1,
                                                    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                                    statusid integer DEFAULT 1,
                                                    createduser character varying(20) DEFAULT 'NULL'::character varying,
                                                    platformdatastructurestodataattributesguid character(38) DEFAULT 'NULL'::bpchar,
                                                    registeredapp character(38) DEFAULT 'NULL'::bpchar,
                                                    platformdataattributesid integer
);


--
-- TOC entry 275 (class 1259 OID 18644)
-- Name: platform_dataattributes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE platform_dataattributes (
                                         platformdataattributesid integer NOT NULL,
                                         dataattributename character varying(50) DEFAULT 'NULL'::character varying,
                                         sensitivityflagid integer,
                                         createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                         statusid integer DEFAULT 1,
                                         createduser character varying(20) DEFAULT 'NULL'::character varying,
                                         platformdataattributeguid character(38) DEFAULT 'NULL'::bpchar,
                                         registeredapp character(38) DEFAULT 'NULL'::bpchar,
                                         platformtablename character varying(38) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 274 (class 1259 OID 18642)
-- Name: platform_dataattributes_platformdataattributesid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE platform_dataattributes_platformdataattributesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 274
-- Name: platform_dataattributes_platformdataattributesid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE platform_dataattributes_platformdataattributesid_seq OWNED BY platform_dataattributes.platformdataattributesid;


--
-- TOC entry 276 (class 1259 OID 18657)
-- Name: platform_datastructures_platformdatastructuresid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE platform_datastructures_platformdatastructuresid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 276
-- Name: platform_datastructures_platformdatastructuresid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE platform_datastructures_platformdatastructuresid_seq OWNED BY platform_config_datastructures.platformdatastructuresid;


--
-- TOC entry 278 (class 1259 OID 18671)
-- Name: platform_datastructurestodata_platformdatastructurestodataa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE platform_datastructurestodata_platformdatastructurestodataa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 278
-- Name: platform_datastructurestodata_platformdatastructurestodataa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE platform_datastructurestodata_platformdatastructurestodataa_seq OWNED BY platform_config_datastructures_dtl.platformdatastructurestodataattributesid;


--
-- TOC entry 281 (class 1259 OID 18688)
-- Name: refdata_codeset; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_codeset (
                                 codesetsid integer NOT NULL,
                                 codesetname character varying(50) DEFAULT 'NULL'::character varying,
                                 industrystd character varying(6) DEFAULT 'NULL'::character varying,
                                 statusid integer DEFAULT 1,
                                 createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                 createduser character varying(20) DEFAULT 'NULL'::character varying,
                                 codesetguid character(38) DEFAULT 'NULL'::bpchar,
                                 fieldmapping character varying(40) DEFAULT 'NULL'::character varying,
                                 sensitivityflagid integer,
                                 externaltableid character varying(20) DEFAULT 'NULL'::character varying,
                                 externalnotes character varying(149) DEFAULT 'NULL'::character varying,
                                 externallink character varying(99) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 280 (class 1259 OID 18686)
-- Name: refdata_codeset_codesetsid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_codeset_codesetsid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 280
-- Name: refdata_codeset_codesetsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refdata_codeset_codesetsid_seq OWNED BY refdata_codeset.codesetsid;


--
-- TOC entry 283 (class 1259 OID 18706)
-- Name: refdata_countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_countries (
                                   countryid integer NOT NULL,
                                   idd character varying(5) DEFAULT 'NULL'::character varying,
                                   countryname character varying(59) DEFAULT 'NULL'::character varying,
                                   createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                   statusid integer DEFAULT 1
);


--
-- TOC entry 282 (class 1259 OID 18704)
-- Name: refdata_countries_countryid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_countries_countryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 282
-- Name: refdata_countries_countryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refdata_countries_countryid_seq OWNED BY refdata_countries.countryid;


--
-- TOC entry 285 (class 1259 OID 18718)
-- Name: refdata_datagentypes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_datagentypes (
                                      datagentypeid integer NOT NULL,
                                      datagentypedescription character varying(65) DEFAULT 'NULL'::character varying,
                                      definition character varying(255) DEFAULT 'NULL'::character varying,
                                      dataattributeid integer,
                                      createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                      statusid integer DEFAULT 1,
                                      createduser character varying(20) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 284 (class 1259 OID 18716)
-- Name: refdata_datagentypes_datagentypeid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_datagentypes_datagentypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 284
-- Name: refdata_datagentypes_datagentypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refdata_datagentypes_datagentypeid_seq OWNED BY refdata_datagentypes.datagentypeid;


--
-- TOC entry 312 (class 1259 OID 20245)
-- Name: refdata_devicetypes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_devicetypes (
                                     devicetypeid integer NOT NULL,
                                     devicetype character varying(30),
                                     createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                     statusid integer DEFAULT 1
);


--
-- TOC entry 311 (class 1259 OID 20243)
-- Name: refdata_devicetypes_devicetypeid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_devicetypes_devicetypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 311
-- Name: refdata_devicetypes_devicetypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refdata_devicetypes_devicetypeid_seq OWNED BY refdata_devicetypes.devicetypeid;


--
-- TOC entry 313 (class 1259 OID 20265)
-- Name: refdata_industries_industryid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_industries_industryid_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 314 (class 1259 OID 20267)
-- Name: refdata_industries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_industries (
                                    industryid integer DEFAULT nextval('refdata_industries_industryid_seq'::regclass) NOT NULL,
                                    industryname character varying(45),
                                    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                    statusid integer DEFAULT 1
);


--
-- TOC entry 317 (class 1259 OID 20284)
-- Name: refdata_industriestobusiness; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_industriestobusiness (
                                              industrytobusinessid integer NOT NULL,
                                              industryid integer,
                                              businessarea character varying(50),
                                              createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                              statusid integer DEFAULT 1
);


--
-- TOC entry 315 (class 1259 OID 20280)
-- Name: refdata_industriestobusiness_industrytobusinessid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_industriestobusiness_industrytobusinessid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 316 (class 1259 OID 20282)
-- Name: refdata_industriestobusiness_industrytobusinessid_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_industriestobusiness_industrytobusinessid_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 316
-- Name: refdata_industriestobusiness_industrytobusinessid_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refdata_industriestobusiness_industrytobusinessid_seq1 OWNED BY refdata_industriestobusiness.industrytobusinessid;


--
-- TOC entry 286 (class 1259 OID 18729)
-- Name: refdata_industrystd; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_industrystd (
                                     industrystd character varying(6) NOT NULL,
                                     industrystddesc character varying(30) DEFAULT 'NULL'::character varying,
                                     createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                     statusid integer DEFAULT 1
);


--
-- TOC entry 288 (class 1259 OID 18739)
-- Name: refdata_industrystd_datatypes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_industrystd_datatypes (
                                               datatypestoindustryid integer NOT NULL,
                                               industrystd character varying(6) NOT NULL,
                                               datatypename character varying(10) DEFAULT 'NULL'::character varying,
                                               datatypenamedesc character varying(75) DEFAULT 'NULL'::character varying,
                                               datatypesubfields character varying(249) DEFAULT 'NULL'::character varying,
                                               createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                               statusid integer DEFAULT 1
);


--
-- TOC entry 287 (class 1259 OID 18737)
-- Name: refdata_industrystd_datatypes_datatypestoindustryid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_industrystd_datatypes_datatypestoindustryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 287
-- Name: refdata_industrystd_datatypes_datatypestoindustryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refdata_industrystd_datatypes_datatypestoindustryid_seq OWNED BY refdata_industrystd_datatypes.datatypestoindustryid;


--
-- TOC entry 290 (class 1259 OID 18752)
-- Name: refdata_industrystd_fields; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_industrystd_fields (
                                            fieldstoindustryid integer NOT NULL,
                                            messagefieldnumber character varying(14) DEFAULT 'NULL'::character varying,
                                            messagefieldname character varying(154) DEFAULT 'NULL'::character varying,
                                            fieldlength character varying(10) DEFAULT 'NULL'::character varying,
                                            datatype character varying(7) DEFAULT 'NULL'::character varying,
                                            messagesegment character varying(3) DEFAULT 'NULL'::character varying,
                                            segmentfieldorder character varying(8) DEFAULT 'NULL'::character varying,
                                            vrsn character varying(7) DEFAULT 'NULL'::character varying,
                                            industrystd character varying(7) DEFAULT 'NULL'::character varying,
                                            sensitivityflagid integer,
                                            createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                            statusid integer DEFAULT 1
);


--
-- TOC entry 289 (class 1259 OID 18750)
-- Name: refdata_industrystd_fields_fieldstoindustryid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_industrystd_fields_fieldstoindustryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 289
-- Name: refdata_industrystd_fields_fieldstoindustryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refdata_industrystd_fields_fieldstoindustryid_seq OWNED BY refdata_industrystd_fields.fieldstoindustryid;


--
-- TOC entry 292 (class 1259 OID 18770)
-- Name: refdata_industrystd_segments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_industrystd_segments (
                                              segmenttoindustryid integer NOT NULL,
                                              industrystd character varying(6) NOT NULL,
                                              industrystddesc character varying(30) DEFAULT 'NULL'::character varying,
                                              createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                              statusid integer DEFAULT 1,
                                              segmentname character varying(10) DEFAULT 'NULL'::character varying,
                                              segmentnamedesc character varying(129) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 291 (class 1259 OID 18768)
-- Name: refdata_industrystd_segments_segmenttoindustryid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_industrystd_segments_segmenttoindustryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 291
-- Name: refdata_industrystd_segments_segmenttoindustryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refdata_industrystd_segments_segmenttoindustryid_seq OWNED BY refdata_industrystd_segments.segmenttoindustryid;


--
-- TOC entry 293 (class 1259 OID 18781)
-- Name: refdata_operationtype; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_operationtype (
                                       operationtypeid character varying(7) NOT NULL,
                                       operationtypename character varying(60) DEFAULT 'NULL'::character varying,
                                       createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                       statusid integer DEFAULT 1
);


--
-- TOC entry 295 (class 1259 OID 18791)
-- Name: refdata_platformparams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_platformparams (
                                        platformparamsid integer NOT NULL,
                                        platformparamvalues character varying(35) DEFAULT 'NULL'::character varying,
                                        platformparamdesc character varying(70) DEFAULT 'NULL'::character varying,
                                        createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                        statusid integer DEFAULT 1
);


--
-- TOC entry 294 (class 1259 OID 18789)
-- Name: refdata_platformparams_platformparamsid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_platformparams_platformparamsid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 294
-- Name: refdata_platformparams_platformparamsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refdata_platformparams_platformparamsid_seq OWNED BY refdata_platformparams.platformparamsid;


--
-- TOC entry 297 (class 1259 OID 18803)
-- Name: refdata_platformparamstodataattributes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_platformparamstodataattributes (
                                                        platformparamstodataattributeid integer NOT NULL,
                                                        platformparamsid integer,
                                                        dataattributeid integer,
                                                        createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                                        statusid integer DEFAULT 1,
                                                        registeredapp character varying(38) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 296 (class 1259 OID 18801)
-- Name: refdata_platformparamstodataa_platformparamstodataattribute_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_platformparamstodataa_platformparamstodataattribute_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 296
-- Name: refdata_platformparamstodataa_platformparamstodataattribute_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refdata_platformparamstodataa_platformparamstodataattribute_seq OWNED BY refdata_platformparamstodataattributes.platformparamstodataattributeid;


--
-- TOC entry 299 (class 1259 OID 18814)
-- Name: refdata_sensitivityflag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_sensitivityflag (
                                         sensitiveflagid integer NOT NULL,
                                         sensitiveflagdesc character varying(30) DEFAULT 'NULL'::character varying,
                                         createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                         statusid integer DEFAULT 1
);


--
-- TOC entry 298 (class 1259 OID 18812)
-- Name: refdata_sensitivityflag_sensitiveflagid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_sensitivityflag_sensitiveflagid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 298
-- Name: refdata_sensitivityflag_sensitiveflagid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refdata_sensitivityflag_sensitiveflagid_seq OWNED BY refdata_sensitivityflag.sensitiveflagid;


--
-- TOC entry 301 (class 1259 OID 18825)
-- Name: refdata_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_status (
                                statusid integer NOT NULL,
                                statusdescription character varying(45) NOT NULL,
                                createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                createduser character varying(20) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 300 (class 1259 OID 18823)
-- Name: refdata_status_statusid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_status_statusid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 300
-- Name: refdata_status_statusid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refdata_status_statusid_seq OWNED BY refdata_status.statusid;


--
-- TOC entry 302 (class 1259 OID 18835)
-- Name: refdata_terminologystd; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_terminologystd (
                                        terminologystdid integer NOT NULL,
                                        terminologystd character varying(25) NOT NULL,
                                        terminologystdversion character varying(10) NOT NULL,
                                        terminologystddesc character varying(129) DEFAULT 'NULL'::character varying,
                                        createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                        statusid integer DEFAULT 1
);


--
-- TOC entry 303 (class 1259 OID 18844)
-- Name: refdata_timezones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_timezones (
                                   timezonevalue character varying(3) NOT NULL,
                                   timezonedesc character varying(25) DEFAULT 'NULL'::character varying,
                                   createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                   statusid integer DEFAULT 1
);


--
-- TOC entry 304 (class 1259 OID 18852)
-- Name: refdata_usstates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_usstates (
                                  stateid character varying(2) NOT NULL,
                                  statedescription character varying(65) DEFAULT 'NULL'::character varying,
                                  lattitude character varying(12) DEFAULT 'NULL'::character varying,
                                  longitude character varying(12) DEFAULT 'NULL'::character varying,
                                  createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                  statusid integer DEFAULT 1,
                                  createduser character varying(20) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 306 (class 1259 OID 18865)
-- Name: refdata_vendor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refdata_vendor (
                                vendorid integer NOT NULL,
                                vendorname character varying(50) DEFAULT 'NULL'::character varying,
                                createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                statusid integer DEFAULT 1,
                                createduser character varying(20) DEFAULT 'NULL'::character varying,
                                vendorguid character(38) DEFAULT 'NULL'::bpchar
);


--
-- TOC entry 305 (class 1259 OID 18863)
-- Name: refdata_vendor_vendorid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refdata_vendor_vendorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 305
-- Name: refdata_vendor_vendorid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refdata_vendor_vendorid_seq OWNED BY refdata_vendor.vendorid;


--
-- TOC entry 307 (class 1259 OID 18878)
-- Name: terms_codeset_industrystd; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE terms_codeset_industrystd (
                                           termcodesetid integer NOT NULL,
                                           codesetsid bigint NOT NULL,
                                           createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           codevalue character varying(20) DEFAULT 'NULL'::character varying,
                                           codedesc character varying(129) DEFAULT 'NULL'::character varying,
                                           industrystd character varying(6) DEFAULT 'UNDF'::character varying,
                                           terminologystdid integer
);


--
-- TOC entry 308 (class 1259 OID 18888)
-- Name: terms_umls_mrconoso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE terms_umls_mrconoso (
                                     cui character(8) NOT NULL,
                                     lat character(3) NOT NULL,
                                     ts character(1) NOT NULL,
                                     lui character varying(10) NOT NULL,
                                     stt character varying(3) NOT NULL,
                                     sui character varying(10) NOT NULL,
                                     ispref character(1) NOT NULL,
                                     aui character varying(9) NOT NULL,
                                     saui character varying(50) DEFAULT 'NULL'::character varying,
                                     scui character varying(100) DEFAULT 'NULL'::character varying,
                                     sdui character varying(100) DEFAULT 'NULL'::character varying,
                                     sab character varying(20) NOT NULL,
                                     tty character varying(20) NOT NULL,
                                     code character varying(100) NOT NULL,
                                     str character varying(3000) NOT NULL,
                                     srl character varying(25) NOT NULL,
                                     suppress character(1) NOT NULL,
                                     cvf character varying(25) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 4150 (class 2604 OID 18080)
-- Name: dataexisting_ababanking ababankingid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_ababanking ALTER COLUMN ababankingid SET DEFAULT nextval('dataexisting_ababanking_ababankingid_seq'::regclass);


--
-- TOC entry 4161 (class 2604 OID 18098)
-- Name: dataexisting_areacode areacodeid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_areacode ALTER COLUMN areacodeid SET DEFAULT nextval('dataexisting_areacode_areacodeid_seq'::regclass);


--
-- TOC entry 4171 (class 2604 OID 18120)
-- Name: dataexisting_companies companiesid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_companies ALTER COLUMN companiesid SET DEFAULT nextval('dataexisting_companies_companiesid_seq'::regclass);


--
-- TOC entry 4177 (class 2604 OID 18133)
-- Name: dataexisting_namefirst firstnameid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_namefirst ALTER COLUMN firstnameid SET DEFAULT nextval('dataexisting_namefirst_firstnameid_seq'::regclass);


--
-- TOC entry 4184 (class 2604 OID 18147)
-- Name: dataexisting_namelast lastnameid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_namelast ALTER COLUMN lastnameid SET DEFAULT nextval('dataexisting_namelast_lastnameid_seq'::regclass);


--
-- TOC entry 4190 (class 2604 OID 18160)
-- Name: dataexisting_upccodes upccodeid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_upccodes ALTER COLUMN upccodeid SET DEFAULT nextval('dataexisting_upccodes_upccodeid_seq'::regclass);


--
-- TOC entry 4196 (class 2604 OID 18173)
-- Name: dataexisting_zipcodeintl zipcodeintnlid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_zipcodeintl ALTER COLUMN zipcodeintnlid SET DEFAULT nextval('dataexisting_zipcodeintl_zipcodeintnlid_seq'::regclass);


--
-- TOC entry 4206 (class 2604 OID 18190)
-- Name: dataexisting_zipcodeus zipcodeid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_zipcodeus ALTER COLUMN zipcodeid SET DEFAULT nextval('dataexisting_zipcodeus_zipcodeid_seq'::regclass);


--
-- TOC entry 4217 (class 2604 OID 18208)
-- Name: datagenerated_accountnumbers accountnumbersid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_accountnumbers ALTER COLUMN accountnumbersid SET DEFAULT nextval('datagenerated_accountnumbers_accountnumbersid_seq'::regclass);


--
-- TOC entry 4223 (class 2604 OID 18221)
-- Name: datagenerated_addresses addressid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_addresses ALTER COLUMN addressid SET DEFAULT nextval('datagenerated_addresses_addressid_seq'::regclass);


--
-- TOC entry 4230 (class 2604 OID 18235)
-- Name: datagenerated_bankaccount bankaccountsid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_bankaccount ALTER COLUMN bankaccountsid SET DEFAULT nextval('datagenerated_bankaccount_bankaccountsid_seq'::regclass);


--
-- TOC entry 4236 (class 2604 OID 18248)
-- Name: datagenerated_creditcard creditcardid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_creditcard ALTER COLUMN creditcardid SET DEFAULT nextval('datagenerated_creditcard_creditcardid_seq'::regclass);


--
-- TOC entry 4555 (class 2604 OID 20898)
-- Name: datagenerated_custom datagencustomdid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_custom ALTER COLUMN datagencustomdid SET DEFAULT nextval('datagenerated_custom_datagencustomdid_seq'::regclass);


--
-- TOC entry 4243 (class 2604 OID 18262)
-- Name: datagenerated_dateofbirth dateofbirthsid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_dateofbirth ALTER COLUMN dateofbirthsid SET DEFAULT nextval('datagenerated_dateofbirth_dateofbirthsid_seq'::regclass);


--
-- TOC entry 4249 (class 2604 OID 18275)
-- Name: datagenerated_driverslicenses driverslicensesid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_driverslicenses ALTER COLUMN driverslicensesid SET DEFAULT nextval('datagenerated_driverslicenses_driverslicensesid_seq'::regclass);


--
-- TOC entry 4256 (class 2604 OID 18289)
-- Name: datagenerated_ein einid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_ein ALTER COLUMN einid SET DEFAULT nextval('datagenerated_ein_einid_seq'::regclass);


--
-- TOC entry 4262 (class 2604 OID 18302)
-- Name: datagenerated_phonenumber phonenumberid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_phonenumber ALTER COLUMN phonenumberid SET DEFAULT nextval('datagenerated_phonenumber_phonenumberid_seq'::regclass);


--
-- TOC entry 4268 (class 2604 OID 18315)
-- Name: datagenerated_phonenumbersintl phonenumberintlid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_phonenumbersintl ALTER COLUMN phonenumberintlid SET DEFAULT nextval('datagenerated_phonenumbersintl_phonenumberintlid_seq'::regclass);


--
-- TOC entry 4534 (class 2604 OID 20225)
-- Name: datagenerated_serialnumbers serialnumberid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_serialnumbers ALTER COLUMN serialnumberid SET DEFAULT nextval('datagenerated_serialnumbers_serialnumberid_seq'::regclass);


--
-- TOC entry 4274 (class 2604 OID 18328)
-- Name: datagenerated_socialsecuritynumber socialsecuritynumberid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_socialsecuritynumber ALTER COLUMN socialsecuritynumberid SET DEFAULT nextval('datagenerated_socialsecuritynumber_socialsecuritynumberid_seq'::regclass);


--
-- TOC entry 4280 (class 2604 OID 18341)
-- Name: datagenerated_useridentities useridentitiesid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_useridentities ALTER COLUMN useridentitiesid SET DEFAULT nextval('datagenerated_useridentities_useridentitiesid_seq'::regclass);


--
-- TOC entry 4554 (class 2604 OID 20538)
-- Name: datamodel_apis datamodelapiid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datamodel_apis ALTER COLUMN datamodelapiid SET DEFAULT nextval('datamodel_apis_datamodelapiid_seq'::regclass);


--
-- TOC entry 4293 (class 2604 OID 18371)
-- Name: datastructure_address completeaddressid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_address ALTER COLUMN completeaddressid SET DEFAULT nextval('datastructure_address_completeaddressid_seq'::regclass);


--
-- TOC entry 4301 (class 2604 OID 18386)
-- Name: datastructure_bankaccount databuiltbankaccountsid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_bankaccount ALTER COLUMN databuiltbankaccountsid SET DEFAULT nextval('datastructure_bankaccount_databuiltbankaccountsid_seq'::regclass);


--
-- TOC entry 4308 (class 2604 OID 18400)
-- Name: datastructure_corporations databuiltcorporationid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_corporations ALTER COLUMN databuiltcorporationid SET DEFAULT nextval('datastructure_corporations_databuiltcorporationid_seq'::regclass);


--
-- TOC entry 4317 (class 2604 OID 18416)
-- Name: datastructure_names databuiltnamesid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_names ALTER COLUMN databuiltnamesid SET DEFAULT nextval('datastructure_names_databuiltnamesid_seq'::regclass);


--
-- TOC entry 4323 (class 2604 OID 18429)
-- Name: datastructure_persondemographics persondemographicsid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_persondemographics ALTER COLUMN persondemographicsid SET DEFAULT nextval('datastructure_persondemographics_persondemographicsid_seq'::regclass);


--
-- TOC entry 4331 (class 2604 OID 18444)
-- Name: datastructure_phonenumbers databuiltphonenumbersid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_phonenumbers ALTER COLUMN databuiltphonenumbersid SET DEFAULT nextval('datastructure_phonenumbers_databuiltphonenumbersid_seq'::regclass);


--
-- TOC entry 4338 (class 2604 OID 18458)
-- Name: datastructure_phonenumbersintl databuiltphonenumbersintlid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_phonenumbersintl ALTER COLUMN databuiltphonenumbersintlid SET DEFAULT nextval('datastructure_phonenumbersintl_databuiltphonenumbersintlid_seq'::regclass);


--
-- TOC entry 4345 (class 2604 OID 18472)
-- Name: datastructure_products databuiltproductsid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_products ALTER COLUMN databuiltproductsid SET DEFAULT nextval('datastructure_products_databuiltproductsid_seq'::regclass);


--
-- TOC entry 4357 (class 2604 OID 18495)
-- Name: impl_codesets implcodesetid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_codesets ALTER COLUMN implcodesetid SET DEFAULT nextval('impl_codesets_implcodesetid_seq'::regclass);


--
-- TOC entry 4366 (class 2604 OID 18512)
-- Name: impl_codesets_crossmaps codesetcrossmapid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_codesets_crossmaps ALTER COLUMN codesetcrossmapid SET DEFAULT nextval('impl_codesetscrossmaps_codesetcrossmapid_seq'::regclass);


--
-- TOC entry 4393 (class 2604 OID 18597)
-- Name: impl_rulesets ruleid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_rulesets ALTER COLUMN ruleid SET DEFAULT nextval('impl_rulesets_ruleid_seq'::regclass);


--
-- TOC entry 4404 (class 2604 OID 18620)
-- Name: platform_appsettings_general appsettingsid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_appsettings_general ALTER COLUMN appsettingsid SET DEFAULT nextval('platform_appsettings_general_appsettingsid_seq'::regclass);


--
-- TOC entry 4411 (class 2604 OID 18634)
-- Name: platform_config_dataattributes datagenconfigid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_dataattributes ALTER COLUMN datagenconfigid SET DEFAULT nextval('platform_config_datagen_datagenconfigid_seq'::regclass);


--
-- TOC entry 4425 (class 2604 OID 18662)
-- Name: platform_config_datastructures platformdatastructuresid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_datastructures ALTER COLUMN platformdatastructuresid SET DEFAULT nextval('platform_datastructures_platformdatastructuresid_seq'::regclass);


--
-- TOC entry 4432 (class 2604 OID 18676)
-- Name: platform_config_datastructures_dtl platformdatastructurestodataattributesid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_datastructures_dtl ALTER COLUMN platformdatastructurestodataattributesid SET DEFAULT nextval('platform_datastructurestodata_platformdatastructurestodataa_seq'::regclass);


--
-- TOC entry 4417 (class 2604 OID 18647)
-- Name: platform_dataattributes platformdataattributesid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_dataattributes ALTER COLUMN platformdataattributesid SET DEFAULT nextval('platform_dataattributes_platformdataattributesid_seq'::regclass);


--
-- TOC entry 4440 (class 2604 OID 18691)
-- Name: refdata_codeset codesetsid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_codeset ALTER COLUMN codesetsid SET DEFAULT nextval('refdata_codeset_codesetsid_seq'::regclass);


--
-- TOC entry 4451 (class 2604 OID 18709)
-- Name: refdata_countries countryid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_countries ALTER COLUMN countryid SET DEFAULT nextval('refdata_countries_countryid_seq'::regclass);


--
-- TOC entry 4456 (class 2604 OID 18721)
-- Name: refdata_datagentypes datagentypeid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_datagentypes ALTER COLUMN datagentypeid SET DEFAULT nextval('refdata_datagentypes_datagentypeid_seq'::regclass);


--
-- TOC entry 4540 (class 2604 OID 20248)
-- Name: refdata_devicetypes devicetypeid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_devicetypes ALTER COLUMN devicetypeid SET DEFAULT nextval('refdata_devicetypes_devicetypeid_seq'::regclass);


--
-- TOC entry 4546 (class 2604 OID 20287)
-- Name: refdata_industriestobusiness industrytobusinessid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industriestobusiness ALTER COLUMN industrytobusinessid SET DEFAULT nextval('refdata_industriestobusiness_industrytobusinessid_seq1'::regclass);


--
-- TOC entry 4465 (class 2604 OID 18742)
-- Name: refdata_industrystd_datatypes datatypestoindustryid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd_datatypes ALTER COLUMN datatypestoindustryid SET DEFAULT nextval('refdata_industrystd_datatypes_datatypestoindustryid_seq'::regclass);


--
-- TOC entry 4471 (class 2604 OID 18755)
-- Name: refdata_industrystd_fields fieldstoindustryid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd_fields ALTER COLUMN fieldstoindustryid SET DEFAULT nextval('refdata_industrystd_fields_fieldstoindustryid_seq'::regclass);


--
-- TOC entry 4482 (class 2604 OID 18773)
-- Name: refdata_industrystd_segments segmenttoindustryid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd_segments ALTER COLUMN segmenttoindustryid SET DEFAULT nextval('refdata_industrystd_segments_segmenttoindustryid_seq'::regclass);


--
-- TOC entry 4491 (class 2604 OID 18794)
-- Name: refdata_platformparams platformparamsid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_platformparams ALTER COLUMN platformparamsid SET DEFAULT nextval('refdata_platformparams_platformparamsid_seq'::regclass);


--
-- TOC entry 4496 (class 2604 OID 18806)
-- Name: refdata_platformparamstodataattributes platformparamstodataattributeid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_platformparamstodataattributes ALTER COLUMN platformparamstodataattributeid SET DEFAULT nextval('refdata_platformparamstodataa_platformparamstodataattribute_seq'::regclass);


--
-- TOC entry 4500 (class 2604 OID 18817)
-- Name: refdata_sensitivityflag sensitiveflagid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_sensitivityflag ALTER COLUMN sensitiveflagid SET DEFAULT nextval('refdata_sensitivityflag_sensitiveflagid_seq'::regclass);


--
-- TOC entry 4504 (class 2604 OID 18828)
-- Name: refdata_status statusid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_status ALTER COLUMN statusid SET DEFAULT nextval('refdata_status_statusid_seq'::regclass);


--
-- TOC entry 4519 (class 2604 OID 18868)
-- Name: refdata_vendor vendorid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_vendor ALTER COLUMN vendorid SET DEFAULT nextval('refdata_vendor_vendorid_seq'::regclass);


--
-- TOC entry 4563 (class 2606 OID 18092)
-- Name: dataexisting_ababanking dataexisting_ababanking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_ababanking
    ADD CONSTRAINT dataexisting_ababanking_pkey PRIMARY KEY (ababankingid);


--
-- TOC entry 4565 (class 2606 OID 18106)
-- Name: dataexisting_areacode dataexisting_areacode_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_areacode
    ADD CONSTRAINT dataexisting_areacode_pkey PRIMARY KEY (areacodeid);


--
-- TOC entry 4567 (class 2606 OID 18114)
-- Name: dataexisting_areacodeintl dataexisting_areacodeintl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_areacodeintl
    ADD CONSTRAINT dataexisting_areacodeintl_pkey PRIMARY KEY (iddcode);


--
-- TOC entry 4569 (class 2606 OID 18127)
-- Name: dataexisting_companies dataexisting_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_companies
    ADD CONSTRAINT dataexisting_companies_pkey PRIMARY KEY (companiesid);


--
-- TOC entry 4572 (class 2606 OID 18141)
-- Name: dataexisting_namefirst dataexisting_namefirst_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_namefirst
    ADD CONSTRAINT dataexisting_namefirst_pkey PRIMARY KEY (firstnameid);


--
-- TOC entry 4576 (class 2606 OID 18154)
-- Name: dataexisting_namelast dataexisting_namelast_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_namelast
    ADD CONSTRAINT dataexisting_namelast_pkey PRIMARY KEY (lastnameid);


--
-- TOC entry 4579 (class 2606 OID 18167)
-- Name: dataexisting_upccodes dataexisting_upccodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_upccodes
    ADD CONSTRAINT dataexisting_upccodes_pkey PRIMARY KEY (upccodeid);


--
-- TOC entry 4581 (class 2606 OID 18184)
-- Name: dataexisting_zipcodeintl dataexisting_zipcodeintl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_zipcodeintl
    ADD CONSTRAINT dataexisting_zipcodeintl_pkey PRIMARY KEY (zipcodeintnlid);


--
-- TOC entry 4583 (class 2606 OID 18202)
-- Name: dataexisting_zipcodeus dataexisting_zipcodeus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_zipcodeus
    ADD CONSTRAINT dataexisting_zipcodeus_pkey PRIMARY KEY (zipcodeid);


--
-- TOC entry 4586 (class 2606 OID 18215)
-- Name: datagenerated_accountnumbers datagenerated_accountnumbers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_accountnumbers
    ADD CONSTRAINT datagenerated_accountnumbers_pkey PRIMARY KEY (accountnumbersid);


--
-- TOC entry 4590 (class 2606 OID 18229)
-- Name: datagenerated_addresses datagenerated_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_addresses
    ADD CONSTRAINT datagenerated_addresses_pkey PRIMARY KEY (addressid);


--
-- TOC entry 4594 (class 2606 OID 18242)
-- Name: datagenerated_bankaccount datagenerated_bankaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_bankaccount
    ADD CONSTRAINT datagenerated_bankaccount_pkey PRIMARY KEY (bankaccountsid);


--
-- TOC entry 4598 (class 2606 OID 18256)
-- Name: datagenerated_creditcard datagenerated_creditcard_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_creditcard
    ADD CONSTRAINT datagenerated_creditcard_pkey PRIMARY KEY (creditcardid);


--
-- TOC entry 4725 (class 2606 OID 20906)
-- Name: datagenerated_custom datagenerated_custom_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_custom
    ADD CONSTRAINT datagenerated_custom_pkey PRIMARY KEY (datagencustomdid);


--
-- TOC entry 4602 (class 2606 OID 18269)
-- Name: datagenerated_dateofbirth datagenerated_dateofbirth_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_dateofbirth
    ADD CONSTRAINT datagenerated_dateofbirth_pkey PRIMARY KEY (dateofbirthsid);


--
-- TOC entry 4606 (class 2606 OID 18283)
-- Name: datagenerated_driverslicenses datagenerated_driverslicenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_driverslicenses
    ADD CONSTRAINT datagenerated_driverslicenses_pkey PRIMARY KEY (driverslicensesid);


--
-- TOC entry 4610 (class 2606 OID 18296)
-- Name: datagenerated_ein datagenerated_ein_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_ein
    ADD CONSTRAINT datagenerated_ein_pkey PRIMARY KEY (einid);


--
-- TOC entry 4614 (class 2606 OID 18309)
-- Name: datagenerated_phonenumber datagenerated_phonenumber_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_phonenumber
    ADD CONSTRAINT datagenerated_phonenumber_pkey PRIMARY KEY (phonenumberid);


--
-- TOC entry 4618 (class 2606 OID 18322)
-- Name: datagenerated_phonenumbersintl datagenerated_phonenumbersintl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_phonenumbersintl
    ADD CONSTRAINT datagenerated_phonenumbersintl_pkey PRIMARY KEY (phonenumberintlid);


--
-- TOC entry 4710 (class 2606 OID 20232)
-- Name: datagenerated_serialnumbers datagenerated_serialnumbers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_serialnumbers
    ADD CONSTRAINT datagenerated_serialnumbers_pkey PRIMARY KEY (serialnumberid);


--
-- TOC entry 4622 (class 2606 OID 18335)
-- Name: datagenerated_socialsecuritynumber datagenerated_socialsecuritynumber_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_socialsecuritynumber
    ADD CONSTRAINT datagenerated_socialsecuritynumber_pkey PRIMARY KEY (socialsecuritynumberid);


--
-- TOC entry 4626 (class 2606 OID 18349)
-- Name: datagenerated_useridentities datagenerated_useridentities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_useridentities
    ADD CONSTRAINT datagenerated_useridentities_pkey PRIMARY KEY (useridentitiesid);


--
-- TOC entry 4722 (class 2606 OID 20543)
-- Name: datamodel_apis datamodel_apis_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datamodel_apis
    ADD CONSTRAINT datamodel_apis_pk PRIMARY KEY (datamodelapiid);


--
-- TOC entry 4629 (class 2606 OID 18357)
-- Name: datamodel_datatables datamodel_datatables_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datamodel_datatables
    ADD CONSTRAINT datamodel_datatables_pkey PRIMARY KEY (tablename);


--
-- TOC entry 4631 (class 2606 OID 18365)
-- Name: datamodel_domain datamodel_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datamodel_domain
    ADD CONSTRAINT datamodel_domain_pkey PRIMARY KEY (domainname);


--
-- TOC entry 4633 (class 2606 OID 18380)
-- Name: datastructure_address datastructure_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_address
    ADD CONSTRAINT datastructure_address_pkey PRIMARY KEY (completeaddressid);


--
-- TOC entry 4635 (class 2606 OID 18394)
-- Name: datastructure_bankaccount datastructure_bankaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_bankaccount
    ADD CONSTRAINT datastructure_bankaccount_pkey PRIMARY KEY (databuiltbankaccountsid);


--
-- TOC entry 4637 (class 2606 OID 18410)
-- Name: datastructure_corporations datastructure_corporations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_corporations
    ADD CONSTRAINT datastructure_corporations_pkey PRIMARY KEY (databuiltcorporationid);


--
-- TOC entry 4639 (class 2606 OID 18423)
-- Name: datastructure_names datastructure_names_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_names
    ADD CONSTRAINT datastructure_names_pkey PRIMARY KEY (databuiltnamesid);


--
-- TOC entry 4641 (class 2606 OID 18438)
-- Name: datastructure_persondemographics datastructure_persondemographics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_persondemographics
    ADD CONSTRAINT datastructure_persondemographics_pkey PRIMARY KEY (persondemographicsid);


--
-- TOC entry 4643 (class 2606 OID 18452)
-- Name: datastructure_phonenumbers datastructure_phonenumbers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_phonenumbers
    ADD CONSTRAINT datastructure_phonenumbers_pkey PRIMARY KEY (databuiltphonenumbersid);


--
-- TOC entry 4645 (class 2606 OID 18466)
-- Name: datastructure_phonenumbersintl datastructure_phonenumbersintl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_phonenumbersintl
    ADD CONSTRAINT datastructure_phonenumbersintl_pkey PRIMARY KEY (databuiltphonenumbersintlid);


--
-- TOC entry 4647 (class 2606 OID 18479)
-- Name: datastructure_products datastructure_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_products
    ADD CONSTRAINT datastructure_products_pkey PRIMARY KEY (databuiltproductsid);


--
-- TOC entry 4649 (class 2606 OID 18489)
-- Name: impl_application impl_application_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_application
    ADD CONSTRAINT impl_application_pkey PRIMARY KEY (appguid);


--
-- TOC entry 4651 (class 2606 OID 18506)
-- Name: impl_codesets impl_codesets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_codesets
    ADD CONSTRAINT impl_codesets_pkey PRIMARY KEY (implcodesetid);


--
-- TOC entry 4653 (class 2606 OID 18519)
-- Name: impl_codesets_crossmaps impl_codesetscrossmaps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_codesets_crossmaps
    ADD CONSTRAINT impl_codesetscrossmaps_pkey PRIMARY KEY (codesetcrossmapid);


--
-- TOC entry 4655 (class 2606 OID 18573)
-- Name: impl_legalentities impl_legalentities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_legalentities
    ADD CONSTRAINT impl_legalentities_pkey PRIMARY KEY (legalentityguid);


--
-- TOC entry 4657 (class 2606 OID 18591)
-- Name: impl_organization impl_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_organization
    ADD CONSTRAINT impl_organization_pkey PRIMARY KEY (organizationguid);


--
-- TOC entry 4659 (class 2606 OID 18603)
-- Name: impl_rulesets impl_rulesets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_rulesets
    ADD CONSTRAINT impl_rulesets_pkey PRIMARY KEY (ruleid);


--
-- TOC entry 4661 (class 2606 OID 18614)
-- Name: impl_rulesetsdefinitions impl_rulesetsdefinitions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_rulesetsdefinitions
    ADD CONSTRAINT impl_rulesetsdefinitions_pkey PRIMARY KEY (rulesetdefinitionsid);


--
-- TOC entry 4663 (class 2606 OID 18628)
-- Name: platform_appsettings_general platform_appsettings_general_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_appsettings_general
    ADD CONSTRAINT platform_appsettings_general_pkey PRIMARY KEY (appsettingsid);


--
-- TOC entry 4665 (class 2606 OID 18641)
-- Name: platform_config_dataattributes platform_config_dataattributes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_dataattributes
    ADD CONSTRAINT platform_config_dataattributes_pkey PRIMARY KEY (datagenconfigid);


--
-- TOC entry 4669 (class 2606 OID 18670)
-- Name: platform_config_datastructures platform_config_datastructures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_datastructures
    ADD CONSTRAINT platform_config_datastructures_pkey PRIMARY KEY (platformdatastructuresid);


--
-- TOC entry 4671 (class 2606 OID 18685)
-- Name: platform_config_datastructures_dtl platform_config_datastructuresdtl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_datastructures_dtl
    ADD CONSTRAINT platform_config_datastructuresdtl_pkey PRIMARY KEY (platformdatastructurestodataattributesid);


--
-- TOC entry 4667 (class 2606 OID 18656)
-- Name: platform_dataattributes platform_dataattributes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_dataattributes
    ADD CONSTRAINT platform_dataattributes_pkey PRIMARY KEY (platformdataattributesid);


--
-- TOC entry 4673 (class 2606 OID 18703)
-- Name: refdata_codeset refdata_codeset_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_codeset
    ADD CONSTRAINT refdata_codeset_pkey PRIMARY KEY (codesetsid);


--
-- TOC entry 4675 (class 2606 OID 18715)
-- Name: refdata_countries refdata_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_countries
    ADD CONSTRAINT refdata_countries_pkey PRIMARY KEY (countryid);


--
-- TOC entry 4677 (class 2606 OID 18728)
-- Name: refdata_datagentypes refdata_datagentypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_datagentypes
    ADD CONSTRAINT refdata_datagentypes_pkey PRIMARY KEY (datagentypeid);


--
-- TOC entry 4720 (class 2606 OID 20312)
-- Name: impl_devices refdata_devices_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_devices
    ADD CONSTRAINT refdata_devices_pk PRIMARY KEY (devicesid);


--
-- TOC entry 4712 (class 2606 OID 20252)
-- Name: refdata_devicetypes refdata_devicetypes_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_devicetypes
    ADD CONSTRAINT refdata_devicetypes_pk PRIMARY KEY (devicetypeid);


--
-- TOC entry 4714 (class 2606 OID 20274)
-- Name: refdata_industries refdata_industries_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industries
    ADD CONSTRAINT refdata_industries_pk PRIMARY KEY (industryid);


--
-- TOC entry 4717 (class 2606 OID 20291)
-- Name: refdata_industriestobusiness refdata_industriestobusiness_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industriestobusiness
    ADD CONSTRAINT refdata_industriestobusiness_pk PRIMARY KEY (industrytobusinessid);


--
-- TOC entry 4681 (class 2606 OID 18749)
-- Name: refdata_industrystd_datatypes refdata_industrystd_datatypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd_datatypes
    ADD CONSTRAINT refdata_industrystd_datatypes_pkey PRIMARY KEY (datatypestoindustryid);


--
-- TOC entry 4683 (class 2606 OID 18767)
-- Name: refdata_industrystd_fields refdata_industrystd_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd_fields
    ADD CONSTRAINT refdata_industrystd_fields_pkey PRIMARY KEY (fieldstoindustryid);


--
-- TOC entry 4679 (class 2606 OID 18736)
-- Name: refdata_industrystd refdata_industrystd_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd
    ADD CONSTRAINT refdata_industrystd_pkey PRIMARY KEY (industrystd);


--
-- TOC entry 4685 (class 2606 OID 18780)
-- Name: refdata_industrystd_segments refdata_industrystd_segments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd_segments
    ADD CONSTRAINT refdata_industrystd_segments_pkey PRIMARY KEY (segmenttoindustryid);


--
-- TOC entry 4687 (class 2606 OID 18788)
-- Name: refdata_operationtype refdata_operationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_operationtype
    ADD CONSTRAINT refdata_operationtype_pkey PRIMARY KEY (operationtypeid);


--
-- TOC entry 4689 (class 2606 OID 18800)
-- Name: refdata_platformparams refdata_platformparams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_platformparams
    ADD CONSTRAINT refdata_platformparams_pkey PRIMARY KEY (platformparamsid);


--
-- TOC entry 4691 (class 2606 OID 18811)
-- Name: refdata_platformparamstodataattributes refdata_platformparamstodataattributes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_platformparamstodataattributes
    ADD CONSTRAINT refdata_platformparamstodataattributes_pkey PRIMARY KEY (platformparamstodataattributeid);


--
-- TOC entry 4693 (class 2606 OID 18822)
-- Name: refdata_sensitivityflag refdata_sensitivityflag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_sensitivityflag
    ADD CONSTRAINT refdata_sensitivityflag_pkey PRIMARY KEY (sensitiveflagid);


--
-- TOC entry 4695 (class 2606 OID 18832)
-- Name: refdata_status refdata_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_status
    ADD CONSTRAINT refdata_status_pkey PRIMARY KEY (statusid);


--
-- TOC entry 4697 (class 2606 OID 18843)
-- Name: refdata_terminologystd refdata_terminologystd_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_terminologystd
    ADD CONSTRAINT refdata_terminologystd_pkey PRIMARY KEY (terminologystdid);


--
-- TOC entry 4699 (class 2606 OID 18851)
-- Name: refdata_timezones refdata_timezones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_timezones
    ADD CONSTRAINT refdata_timezones_pkey PRIMARY KEY (timezonevalue);


--
-- TOC entry 4701 (class 2606 OID 18862)
-- Name: refdata_usstates refdata_usstates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_usstates
    ADD CONSTRAINT refdata_usstates_pkey PRIMARY KEY (stateid);


--
-- TOC entry 4703 (class 2606 OID 18875)
-- Name: refdata_vendor refdata_vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_vendor
    ADD CONSTRAINT refdata_vendor_pkey PRIMARY KEY (vendorid);


--
-- TOC entry 4706 (class 2606 OID 18887)
-- Name: terms_codeset_industrystd terms_codeset_industrystd_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terms_codeset_industrystd
    ADD CONSTRAINT terms_codeset_industrystd_pkey PRIMARY KEY (termcodesetid);


--
-- TOC entry 4570 (class 1259 OID 19833)
-- Name: dataexisting_namefirst_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dataexisting_namefirst_idx ON dataexisting_namefirst USING btree (firstnameid, firstname, gender, statusid, createddate, createduser, registeredapp);


--
-- TOC entry 4573 (class 1259 OID 19832)
-- Name: dataexisting_namefirst_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX dataexisting_namefirst_uindex ON dataexisting_namefirst USING btree (firstname, gender, registeredapp);


--
-- TOC entry 4574 (class 1259 OID 19835)
-- Name: dataexisting_namelast_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dataexisting_namelast_index ON dataexisting_namelast USING btree (lastnameid, lastname, statusid, createddate, createduser, registeredapp);


--
-- TOC entry 4577 (class 1259 OID 19834)
-- Name: dataexisting_namelast_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX dataexisting_namelast_uindex ON dataexisting_namelast USING btree (lastname, registeredapp);


--
-- TOC entry 4584 (class 1259 OID 19849)
-- Name: datagenerated_accountnumbers_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX datagenerated_accountnumbers_index ON datagenerated_accountnumbers USING btree (accountnumbersid, accountnumbervalue, createddate, createduser, statusid, registeredapp, datagentypeid);


--
-- TOC entry 4587 (class 1259 OID 19850)
-- Name: datagenerated_accountnumbers_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX datagenerated_accountnumbers_uindex ON datagenerated_accountnumbers USING btree (accountnumbervalue, registeredapp, datagentypeid);


--
-- TOC entry 4588 (class 1259 OID 19852)
-- Name: datagenerated_addresses_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX datagenerated_addresses_index ON datagenerated_addresses USING btree (addressid, addressstreet, addressstreet2, createddate, createduser, statusid, registeredapp, datagentypeid);


--
-- TOC entry 4591 (class 1259 OID 19853)
-- Name: datagenerated_addresses_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX datagenerated_addresses_uindex ON datagenerated_addresses USING btree (addressstreet, addressstreet2, registeredapp, datagentypeid);


--
-- TOC entry 4592 (class 1259 OID 19854)
-- Name: datagenerated_bankaccount_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX datagenerated_bankaccount_index ON datagenerated_bankaccount USING btree (bankaccountsid, bankaccountvalue, createddate, statusid, createduser, registeredapp, datagentypeid);


--
-- TOC entry 4595 (class 1259 OID 19855)
-- Name: datagenerated_bankaccount_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX datagenerated_bankaccount_uindex ON datagenerated_bankaccount USING btree (bankaccountvalue, registeredapp, datagentypeid);


--
-- TOC entry 4596 (class 1259 OID 19856)
-- Name: datagenerated_creditcard_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX datagenerated_creditcard_index ON datagenerated_creditcard USING btree (creditcardid, creditcardnumber, creditcardname, createddate, statusid, createduser, registeredapp, datagentypeid);


--
-- TOC entry 4599 (class 1259 OID 19857)
-- Name: datagenerated_creditcard_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX datagenerated_creditcard_uindex ON datagenerated_creditcard USING btree (creditcardnumber, creditcardname, registeredapp, datagentypeid);


--
-- TOC entry 4723 (class 1259 OID 20922)
-- Name: datagenerated_custom_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX datagenerated_custom_index ON datagenerated_custom USING btree (customidentifier, customidentifierdesc, createddate, statusid, createduser, registeredapp, datagentypeid);


--
-- TOC entry 4726 (class 1259 OID 20924)
-- Name: datagenerated_custom_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX datagenerated_custom_uindex ON datagenerated_custom USING btree (customidentifier, customidentifierdesc, registeredapp, datagentypeid);


--
-- TOC entry 4600 (class 1259 OID 19859)
-- Name: datagenerated_dateofbirth_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX datagenerated_dateofbirth_index ON datagenerated_dateofbirth USING btree (dateofbirthsid, dateofbirth, age, dateofbirthdate, createddate, statusid, createduser, registeredapp);


--
-- TOC entry 4603 (class 1259 OID 19860)
-- Name: datagenerated_dateofbirth_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX datagenerated_dateofbirth_uindex ON datagenerated_dateofbirth USING btree (dateofbirthdate, dateofbirth, dateofbirthdate, registeredapp);


--
-- TOC entry 4604 (class 1259 OID 19861)
-- Name: datagenerated_driverslicenses_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX datagenerated_driverslicenses_index ON datagenerated_driverslicenses USING btree (driverslicensesid, dln, statecode, createddate, statusid, datagentypeid, createduser, registeredapp);


--
-- TOC entry 4607 (class 1259 OID 19862)
-- Name: datagenerated_driverslicenses_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX datagenerated_driverslicenses_uindex ON datagenerated_driverslicenses USING btree (dln, statecode, datagentypeid, registeredapp);


--
-- TOC entry 4608 (class 1259 OID 19863)
-- Name: datagenerated_ein_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX datagenerated_ein_index ON datagenerated_ein USING btree (einid, einvalue, createddate, statusid, createduser, registeredapp);


--
-- TOC entry 4611 (class 1259 OID 19864)
-- Name: datagenerated_ein_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX datagenerated_ein_uindex ON datagenerated_ein USING btree (einvalue, registeredapp);


--
-- TOC entry 4612 (class 1259 OID 19865)
-- Name: datagenerated_phonenumber_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX datagenerated_phonenumber_index ON datagenerated_phonenumber USING btree (phonenumberid, phonenumbervalue, createddate, statusid, createduser, registeredapp);


--
-- TOC entry 4615 (class 1259 OID 19866)
-- Name: datagenerated_phonenumber_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX datagenerated_phonenumber_uindex ON datagenerated_phonenumber USING btree (phonenumbervalue, registeredapp);


--
-- TOC entry 4616 (class 1259 OID 19867)
-- Name: datagenerated_phonenumbersintl_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX datagenerated_phonenumbersintl_index ON datagenerated_phonenumbersintl USING btree (phonenumberintlid, phonenumbervalue, createddate, statusid, countryid, createduser, registeredapp);


--
-- TOC entry 4619 (class 1259 OID 19868)
-- Name: datagenerated_phonenumbersintl_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX datagenerated_phonenumbersintl_uindex ON datagenerated_phonenumbersintl USING btree (phonenumbervalue, countryid, registeredapp);


--
-- TOC entry 4620 (class 1259 OID 19869)
-- Name: datagenerated_socialsecuritynumber_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX datagenerated_socialsecuritynumber_index ON datagenerated_socialsecuritynumber USING btree (socialsecuritynumberid, socialsecuritynumbervalue, createddate, statusid, createduser, registeredapp);


--
-- TOC entry 4623 (class 1259 OID 19870)
-- Name: datagenerated_socialsecuritynumber_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX datagenerated_socialsecuritynumber_uindex ON datagenerated_socialsecuritynumber USING btree (socialsecuritynumbervalue, registeredapp);


--
-- TOC entry 4624 (class 1259 OID 19871)
-- Name: datagenerated_useridentities_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX datagenerated_useridentities_index ON datagenerated_useridentities USING btree (useridentitiesid, useridentityvalue, userdomain, additionalattributes, createddate, statusid, registeredapp, datagentypeid);


--
-- TOC entry 4627 (class 1259 OID 19872)
-- Name: datagenerated_useridentities_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX datagenerated_useridentities_uindex ON datagenerated_useridentities USING btree (useridentityvalue, userdomain, additionalattributes, registeredapp);


--
-- TOC entry 4718 (class 1259 OID 20338)
-- Name: refdata_devices_devicesid_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX refdata_devices_devicesid_uindex ON impl_devices USING btree (devicesid);


--
-- TOC entry 4715 (class 1259 OID 20302)
-- Name: refdata_industriestobusiness_industrytobusinessid_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX refdata_industriestobusiness_industrytobusinessid_uindex ON refdata_industriestobusiness USING btree (industrytobusinessid);


--
-- TOC entry 4704 (class 1259 OID 19847)
-- Name: terms_codeset_industrystd_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX terms_codeset_industrystd_index ON terms_codeset_industrystd USING btree (termcodesetid, codesetsid, createddate, statusid, codevalue, codedesc, industrystd);


--
-- TOC entry 4707 (class 1259 OID 19848)
-- Name: terms_codeset_industrystd_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX terms_codeset_industrystd_uindex ON terms_codeset_industrystd USING btree (codesetsid, codevalue, codedesc, industrystd);


--
-- TOC entry 4708 (class 1259 OID 19836)
-- Name: terms_umls_mrconoso_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX terms_umls_mrconoso_index ON terms_umls_mrconoso USING btree (cui, lat, ts, lui, stt, sui, ispref, aui, saui, scui, sdui, sab, tty, code, str, srl, suppress, cvf);


--
-- TOC entry 4727 (class 2606 OID 18898)
-- Name: dataexisting_ababanking dataexisting_ababanking_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_ababanking
    ADD CONSTRAINT dataexisting_ababanking_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4728 (class 2606 OID 18903)
-- Name: dataexisting_ababanking dataexisting_ababanking_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_ababanking
    ADD CONSTRAINT dataexisting_ababanking_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4732 (class 2606 OID 18923)
-- Name: dataexisting_areacode dataexisting_areacode_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_areacode
    ADD CONSTRAINT dataexisting_areacode_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4729 (class 2606 OID 18908)
-- Name: dataexisting_areacode dataexisting_areacode_statecode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_areacode
    ADD CONSTRAINT dataexisting_areacode_statecode_fkey FOREIGN KEY (statecode) REFERENCES refdata_usstates(stateid);


--
-- TOC entry 4731 (class 2606 OID 18918)
-- Name: dataexisting_areacode dataexisting_areacode_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_areacode
    ADD CONSTRAINT dataexisting_areacode_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4730 (class 2606 OID 18913)
-- Name: dataexisting_areacode dataexisting_areacode_timezone_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_areacode
    ADD CONSTRAINT dataexisting_areacode_timezone_fkey FOREIGN KEY (timezone) REFERENCES refdata_timezones(timezonevalue);


--
-- TOC entry 4735 (class 2606 OID 18938)
-- Name: dataexisting_areacodeintl dataexisting_areacodeintl_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_areacodeintl
    ADD CONSTRAINT dataexisting_areacodeintl_countryid_fkey FOREIGN KEY (countryid) REFERENCES refdata_countries(countryid);


--
-- TOC entry 4733 (class 2606 OID 18928)
-- Name: dataexisting_areacodeintl dataexisting_areacodeintl_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_areacodeintl
    ADD CONSTRAINT dataexisting_areacodeintl_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4734 (class 2606 OID 18933)
-- Name: dataexisting_areacodeintl dataexisting_areacodeintl_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_areacodeintl
    ADD CONSTRAINT dataexisting_areacodeintl_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4736 (class 2606 OID 18943)
-- Name: dataexisting_companies dataexisting_companies_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_companies
    ADD CONSTRAINT dataexisting_companies_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4737 (class 2606 OID 18948)
-- Name: dataexisting_companies dataexisting_companies_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_companies
    ADD CONSTRAINT dataexisting_companies_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4738 (class 2606 OID 18953)
-- Name: dataexisting_namefirst dataexisting_namefirst_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_namefirst
    ADD CONSTRAINT dataexisting_namefirst_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4739 (class 2606 OID 18958)
-- Name: dataexisting_namefirst dataexisting_namefirst_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_namefirst
    ADD CONSTRAINT dataexisting_namefirst_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4741 (class 2606 OID 18968)
-- Name: dataexisting_namelast dataexisting_namelast_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_namelast
    ADD CONSTRAINT dataexisting_namelast_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4740 (class 2606 OID 18963)
-- Name: dataexisting_namelast dataexisting_namelast_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_namelast
    ADD CONSTRAINT dataexisting_namelast_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4742 (class 2606 OID 18973)
-- Name: dataexisting_upccodes dataexisting_upccodes_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_upccodes
    ADD CONSTRAINT dataexisting_upccodes_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4743 (class 2606 OID 18978)
-- Name: dataexisting_upccodes dataexisting_upccodes_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_upccodes
    ADD CONSTRAINT dataexisting_upccodes_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4746 (class 2606 OID 18993)
-- Name: dataexisting_zipcodeintl dataexisting_zipcodeintl_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_zipcodeintl
    ADD CONSTRAINT dataexisting_zipcodeintl_country_fkey FOREIGN KEY (country) REFERENCES refdata_countries(countryid);


--
-- TOC entry 4744 (class 2606 OID 18983)
-- Name: dataexisting_zipcodeintl dataexisting_zipcodeintl_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_zipcodeintl
    ADD CONSTRAINT dataexisting_zipcodeintl_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4745 (class 2606 OID 18988)
-- Name: dataexisting_zipcodeintl dataexisting_zipcodeintl_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_zipcodeintl
    ADD CONSTRAINT dataexisting_zipcodeintl_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4747 (class 2606 OID 19000)
-- Name: dataexisting_zipcodeus dataexisting_zipcodeus_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_zipcodeus
    ADD CONSTRAINT dataexisting_zipcodeus_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4748 (class 2606 OID 19005)
-- Name: dataexisting_zipcodeus dataexisting_zipcodeus_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataexisting_zipcodeus
    ADD CONSTRAINT dataexisting_zipcodeus_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4749 (class 2606 OID 19010)
-- Name: datagenerated_accountnumbers datagenerated_accountnumbers_datagentypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_accountnumbers
    ADD CONSTRAINT datagenerated_accountnumbers_datagentypeid_fkey FOREIGN KEY (datagentypeid) REFERENCES refdata_datagentypes(datagentypeid);


--
-- TOC entry 4751 (class 2606 OID 19020)
-- Name: datagenerated_accountnumbers datagenerated_accountnumbers_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_accountnumbers
    ADD CONSTRAINT datagenerated_accountnumbers_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4750 (class 2606 OID 19015)
-- Name: datagenerated_accountnumbers datagenerated_accountnumbers_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_accountnumbers
    ADD CONSTRAINT datagenerated_accountnumbers_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4752 (class 2606 OID 19025)
-- Name: datagenerated_addresses datagenerated_addresses_datagentypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_addresses
    ADD CONSTRAINT datagenerated_addresses_datagentypeid_fkey FOREIGN KEY (datagentypeid) REFERENCES refdata_datagentypes(datagentypeid);


--
-- TOC entry 4754 (class 2606 OID 19035)
-- Name: datagenerated_addresses datagenerated_addresses_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_addresses
    ADD CONSTRAINT datagenerated_addresses_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4753 (class 2606 OID 19030)
-- Name: datagenerated_addresses datagenerated_addresses_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_addresses
    ADD CONSTRAINT datagenerated_addresses_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4757 (class 2606 OID 19050)
-- Name: datagenerated_bankaccount datagenerated_bankaccount_datagentypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_bankaccount
    ADD CONSTRAINT datagenerated_bankaccount_datagentypeid_fkey FOREIGN KEY (datagentypeid) REFERENCES refdata_datagentypes(datagentypeid);


--
-- TOC entry 4755 (class 2606 OID 19040)
-- Name: datagenerated_bankaccount datagenerated_bankaccount_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_bankaccount
    ADD CONSTRAINT datagenerated_bankaccount_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4756 (class 2606 OID 19045)
-- Name: datagenerated_bankaccount datagenerated_bankaccount_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_bankaccount
    ADD CONSTRAINT datagenerated_bankaccount_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4759 (class 2606 OID 19060)
-- Name: datagenerated_creditcard datagenerated_creditcard_datagentypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_creditcard
    ADD CONSTRAINT datagenerated_creditcard_datagentypeid_fkey FOREIGN KEY (datagentypeid) REFERENCES refdata_datagentypes(datagentypeid);


--
-- TOC entry 4760 (class 2606 OID 19065)
-- Name: datagenerated_creditcard datagenerated_creditcard_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_creditcard
    ADD CONSTRAINT datagenerated_creditcard_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4758 (class 2606 OID 19055)
-- Name: datagenerated_creditcard datagenerated_creditcard_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_creditcard
    ADD CONSTRAINT datagenerated_creditcard_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4876 (class 2606 OID 20917)
-- Name: datagenerated_custom datagenerated_custom_datagentypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_custom
    ADD CONSTRAINT datagenerated_custom_datagentypeid_fkey FOREIGN KEY (datagentypeid) REFERENCES refdata_datagentypes(datagentypeid);


--
-- TOC entry 4877 (class 2606 OID 20912)
-- Name: datagenerated_custom datagenerated_custom_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_custom
    ADD CONSTRAINT datagenerated_custom_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4878 (class 2606 OID 20907)
-- Name: datagenerated_custom datagenerated_custom_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_custom
    ADD CONSTRAINT datagenerated_custom_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4761 (class 2606 OID 19070)
-- Name: datagenerated_dateofbirth datagenerated_dateofbirth_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_dateofbirth
    ADD CONSTRAINT datagenerated_dateofbirth_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4762 (class 2606 OID 19075)
-- Name: datagenerated_dateofbirth datagenerated_dateofbirth_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_dateofbirth
    ADD CONSTRAINT datagenerated_dateofbirth_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4764 (class 2606 OID 19085)
-- Name: datagenerated_driverslicenses datagenerated_driverslicenses_datagentypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_driverslicenses
    ADD CONSTRAINT datagenerated_driverslicenses_datagentypeid_fkey FOREIGN KEY (datagentypeid) REFERENCES refdata_datagentypes(datagentypeid);


--
-- TOC entry 4766 (class 2606 OID 19095)
-- Name: datagenerated_driverslicenses datagenerated_driverslicenses_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_driverslicenses
    ADD CONSTRAINT datagenerated_driverslicenses_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4765 (class 2606 OID 19090)
-- Name: datagenerated_driverslicenses datagenerated_driverslicenses_statecode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_driverslicenses
    ADD CONSTRAINT datagenerated_driverslicenses_statecode_fkey FOREIGN KEY (statecode) REFERENCES refdata_usstates(stateid);


--
-- TOC entry 4763 (class 2606 OID 19080)
-- Name: datagenerated_driverslicenses datagenerated_driverslicenses_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_driverslicenses
    ADD CONSTRAINT datagenerated_driverslicenses_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4768 (class 2606 OID 19105)
-- Name: datagenerated_ein datagenerated_ein_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_ein
    ADD CONSTRAINT datagenerated_ein_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4767 (class 2606 OID 19100)
-- Name: datagenerated_ein datagenerated_ein_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_ein
    ADD CONSTRAINT datagenerated_ein_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4769 (class 2606 OID 19110)
-- Name: datagenerated_phonenumber datagenerated_phonenumber_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_phonenumber
    ADD CONSTRAINT datagenerated_phonenumber_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4770 (class 2606 OID 19115)
-- Name: datagenerated_phonenumber datagenerated_phonenumber_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_phonenumber
    ADD CONSTRAINT datagenerated_phonenumber_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4772 (class 2606 OID 19125)
-- Name: datagenerated_phonenumbersintl datagenerated_phonenumbersintl_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_phonenumbersintl
    ADD CONSTRAINT datagenerated_phonenumbersintl_countryid_fkey FOREIGN KEY (countryid) REFERENCES refdata_countries(countryid);


--
-- TOC entry 4773 (class 2606 OID 19130)
-- Name: datagenerated_phonenumbersintl datagenerated_phonenumbersintl_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_phonenumbersintl
    ADD CONSTRAINT datagenerated_phonenumbersintl_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4771 (class 2606 OID 19120)
-- Name: datagenerated_phonenumbersintl datagenerated_phonenumbersintl_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_phonenumbersintl
    ADD CONSTRAINT datagenerated_phonenumbersintl_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4866 (class 2606 OID 20238)
-- Name: datagenerated_serialnumbers datagenerated_serialnumbers_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_serialnumbers
    ADD CONSTRAINT datagenerated_serialnumbers_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4865 (class 2606 OID 20233)
-- Name: datagenerated_serialnumbers datagenerated_serialnumbers_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_serialnumbers
    ADD CONSTRAINT datagenerated_serialnumbers_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4775 (class 2606 OID 19140)
-- Name: datagenerated_socialsecuritynumber datagenerated_socialsecuritynumber_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_socialsecuritynumber
    ADD CONSTRAINT datagenerated_socialsecuritynumber_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4774 (class 2606 OID 19135)
-- Name: datagenerated_socialsecuritynumber datagenerated_socialsecuritynumber_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_socialsecuritynumber
    ADD CONSTRAINT datagenerated_socialsecuritynumber_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4777 (class 2606 OID 19150)
-- Name: datagenerated_useridentities datagenerated_useridentities_datagentypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_useridentities
    ADD CONSTRAINT datagenerated_useridentities_datagentypeid_fkey FOREIGN KEY (datagentypeid) REFERENCES refdata_datagentypes(datagentypeid);


--
-- TOC entry 4778 (class 2606 OID 19155)
-- Name: datagenerated_useridentities datagenerated_useridentities_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_useridentities
    ADD CONSTRAINT datagenerated_useridentities_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4776 (class 2606 OID 19145)
-- Name: datagenerated_useridentities datagenerated_useridentities_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datagenerated_useridentities
    ADD CONSTRAINT datagenerated_useridentities_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4780 (class 2606 OID 19165)
-- Name: datastructure_address datastructure_address_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_address
    ADD CONSTRAINT datastructure_address_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4779 (class 2606 OID 19160)
-- Name: datastructure_address datastructure_address_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_address
    ADD CONSTRAINT datastructure_address_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4782 (class 2606 OID 19175)
-- Name: datastructure_bankaccount datastructure_bankaccount_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_bankaccount
    ADD CONSTRAINT datastructure_bankaccount_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4781 (class 2606 OID 19170)
-- Name: datastructure_bankaccount datastructure_bankaccount_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_bankaccount
    ADD CONSTRAINT datastructure_bankaccount_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4783 (class 2606 OID 19180)
-- Name: datastructure_corporations datastructure_corporations_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_corporations
    ADD CONSTRAINT datastructure_corporations_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4784 (class 2606 OID 19185)
-- Name: datastructure_corporations datastructure_corporations_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_corporations
    ADD CONSTRAINT datastructure_corporations_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4785 (class 2606 OID 19190)
-- Name: datastructure_names datastructure_names_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_names
    ADD CONSTRAINT datastructure_names_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4786 (class 2606 OID 19195)
-- Name: datastructure_names datastructure_names_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_names
    ADD CONSTRAINT datastructure_names_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4788 (class 2606 OID 19205)
-- Name: datastructure_persondemographics datastructure_persondemographics_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_persondemographics
    ADD CONSTRAINT datastructure_persondemographics_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4787 (class 2606 OID 19200)
-- Name: datastructure_persondemographics datastructure_persondemographics_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_persondemographics
    ADD CONSTRAINT datastructure_persondemographics_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4790 (class 2606 OID 19215)
-- Name: datastructure_phonenumbers datastructure_phonenumbers_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_phonenumbers
    ADD CONSTRAINT datastructure_phonenumbers_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4789 (class 2606 OID 19210)
-- Name: datastructure_phonenumbers datastructure_phonenumbers_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_phonenumbers
    ADD CONSTRAINT datastructure_phonenumbers_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4791 (class 2606 OID 19220)
-- Name: datastructure_phonenumbers datastructure_phonenumbers_statusid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_phonenumbers
    ADD CONSTRAINT datastructure_phonenumbers_statusid_fkey1 FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4793 (class 2606 OID 19230)
-- Name: datastructure_phonenumbersintl datastructure_phonenumbersintl_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_phonenumbersintl
    ADD CONSTRAINT datastructure_phonenumbersintl_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4792 (class 2606 OID 19225)
-- Name: datastructure_phonenumbersintl datastructure_phonenumbersintl_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_phonenumbersintl
    ADD CONSTRAINT datastructure_phonenumbersintl_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4794 (class 2606 OID 19235)
-- Name: datastructure_phonenumbersintl datastructure_phonenumbersintl_statusid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_phonenumbersintl
    ADD CONSTRAINT datastructure_phonenumbersintl_statusid_fkey1 FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4796 (class 2606 OID 19245)
-- Name: datastructure_products datastructure_products_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_products
    ADD CONSTRAINT datastructure_products_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4795 (class 2606 OID 19240)
-- Name: datastructure_products datastructure_products_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datastructure_products
    ADD CONSTRAINT datastructure_products_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4874 (class 2606 OID 20328)
-- Name: impl_devices fk_impl_devices_applications; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_devices
    ADD CONSTRAINT fk_impl_devices_applications FOREIGN KEY (application) REFERENCES impl_application(appguid);


--
-- TOC entry 4872 (class 2606 OID 20318)
-- Name: impl_devices fk_impl_devices_devicetype; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_devices
    ADD CONSTRAINT fk_impl_devices_devicetype FOREIGN KEY (devicetypeid) REFERENCES refdata_devicetypes(devicetypeid);


--
-- TOC entry 4871 (class 2606 OID 20313)
-- Name: impl_devices fk_impl_devices_industry; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_devices
    ADD CONSTRAINT fk_impl_devices_industry FOREIGN KEY (industryid) REFERENCES refdata_industries(industryid);


--
-- TOC entry 4875 (class 2606 OID 20333)
-- Name: impl_devices fk_impl_devices_organizations; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_devices
    ADD CONSTRAINT fk_impl_devices_organizations FOREIGN KEY (organization) REFERENCES impl_organization(organizationguid);


--
-- TOC entry 4873 (class 2606 OID 20323)
-- Name: impl_devices fk_impl_devices_statuses; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_devices
    ADD CONSTRAINT fk_impl_devices_statuses FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4867 (class 2606 OID 20253)
-- Name: refdata_devicetypes fk_refdata_devicetypes_statuses; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_devicetypes
    ADD CONSTRAINT fk_refdata_devicetypes_statuses FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4868 (class 2606 OID 20275)
-- Name: refdata_industries fk_refdata_industries_status; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industries
    ADD CONSTRAINT fk_refdata_industries_status FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4869 (class 2606 OID 20292)
-- Name: refdata_industriestobusiness fk_refdata_industriestobusiness_industries; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industriestobusiness
    ADD CONSTRAINT fk_refdata_industriestobusiness_industries FOREIGN KEY (industryid) REFERENCES refdata_industries(industryid);


--
-- TOC entry 4870 (class 2606 OID 20297)
-- Name: refdata_industriestobusiness fk_refdata_industriestobusiness_statuses; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industriestobusiness
    ADD CONSTRAINT fk_refdata_industriestobusiness_statuses FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4798 (class 2606 OID 19255)
-- Name: impl_application impl_application_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_application
    ADD CONSTRAINT impl_application_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4797 (class 2606 OID 19250)
-- Name: impl_application impl_application_vendorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_application
    ADD CONSTRAINT impl_application_vendorid_fkey FOREIGN KEY (vendorid) REFERENCES refdata_vendor(vendorid);


--
-- TOC entry 4803 (class 2606 OID 19285)
-- Name: impl_codesets impl_codesets_applicationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_codesets
    ADD CONSTRAINT impl_codesets_applicationid_fkey FOREIGN KEY (applicationid) REFERENCES impl_application(appguid);


--
-- TOC entry 4799 (class 2606 OID 19260)
-- Name: impl_codesets impl_codesets_codesetsid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_codesets
    ADD CONSTRAINT impl_codesets_codesetsid_fkey FOREIGN KEY (codesetsid) REFERENCES refdata_codeset(codesetsid);


--
-- TOC entry 4806 (class 2606 OID 20809)
-- Name: impl_codesets_crossmaps impl_codesets_crossmaps_implcodesets_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_codesets_crossmaps
    ADD CONSTRAINT impl_codesets_crossmaps_implcodesets_fk FOREIGN KEY (implcodesetsid) REFERENCES impl_codesets(implcodesetid);


--
-- TOC entry 4804 (class 2606 OID 19290)
-- Name: impl_codesets_crossmaps impl_codesets_crossmaps_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_codesets_crossmaps
    ADD CONSTRAINT impl_codesets_crossmaps_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4805 (class 2606 OID 19300)
-- Name: impl_codesets_crossmaps impl_codesets_crossmaps_terminologystdto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_codesets_crossmaps
    ADD CONSTRAINT impl_codesets_crossmaps_terminologystdto_fkey FOREIGN KEY (terminologystdto) REFERENCES refdata_terminologystd(terminologystdid);


--
-- TOC entry 4801 (class 2606 OID 19275)
-- Name: impl_codesets impl_codesets_industrystd_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_codesets
    ADD CONSTRAINT impl_codesets_industrystd_fkey FOREIGN KEY (industrystd) REFERENCES refdata_industrystd(industrystd);


--
-- TOC entry 4800 (class 2606 OID 19270)
-- Name: impl_codesets impl_codesets_organizationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_codesets
    ADD CONSTRAINT impl_codesets_organizationid_fkey FOREIGN KEY (organizationid) REFERENCES impl_organization(organizationguid);


--
-- TOC entry 4802 (class 2606 OID 19280)
-- Name: impl_codesets impl_codesets_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_codesets
    ADD CONSTRAINT impl_codesets_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4808 (class 2606 OID 19355)
-- Name: impl_legalentities impl_legalentities_stateid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_legalentities
    ADD CONSTRAINT impl_legalentities_stateid_fkey FOREIGN KEY (stateid) REFERENCES refdata_usstates(stateid);


--
-- TOC entry 4807 (class 2606 OID 19350)
-- Name: impl_legalentities impl_legalentities_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_legalentities
    ADD CONSTRAINT impl_legalentities_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4811 (class 2606 OID 19370)
-- Name: impl_organization impl_organization_legalentityguid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_organization
    ADD CONSTRAINT impl_organization_legalentityguid_fkey FOREIGN KEY (legalentityguid) REFERENCES impl_legalentities(legalentityguid);


--
-- TOC entry 4810 (class 2606 OID 19365)
-- Name: impl_organization impl_organization_stateid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_organization
    ADD CONSTRAINT impl_organization_stateid_fkey FOREIGN KEY (stateid) REFERENCES refdata_usstates(stateid);


--
-- TOC entry 4809 (class 2606 OID 19360)
-- Name: impl_organization impl_organization_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_organization
    ADD CONSTRAINT impl_organization_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4812 (class 2606 OID 19375)
-- Name: impl_rulesets impl_rulesets_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_rulesets
    ADD CONSTRAINT impl_rulesets_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4813 (class 2606 OID 19380)
-- Name: impl_rulesetsdefinitions impl_rulesetsdefinitions_applicationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_rulesetsdefinitions
    ADD CONSTRAINT impl_rulesetsdefinitions_applicationid_fkey FOREIGN KEY (applicationid) REFERENCES impl_application(appguid);


--
-- TOC entry 4817 (class 2606 OID 19400)
-- Name: impl_rulesetsdefinitions impl_rulesetsdefinitions_dataattributeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_rulesetsdefinitions
    ADD CONSTRAINT impl_rulesetsdefinitions_dataattributeid_fkey FOREIGN KEY (dataattributeid) REFERENCES platform_dataattributes(platformdataattributesid);


--
-- TOC entry 4815 (class 2606 OID 19390)
-- Name: impl_rulesetsdefinitions impl_rulesetsdefinitions_operationtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_rulesetsdefinitions
    ADD CONSTRAINT impl_rulesetsdefinitions_operationtypeid_fkey FOREIGN KEY (operationtypeid) REFERENCES refdata_operationtype(operationtypeid);


--
-- TOC entry 4816 (class 2606 OID 19395)
-- Name: impl_rulesetsdefinitions impl_rulesetsdefinitions_rulesetid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_rulesetsdefinitions
    ADD CONSTRAINT impl_rulesetsdefinitions_rulesetid_fkey FOREIGN KEY (rulesetid) REFERENCES impl_rulesets(ruleid);


--
-- TOC entry 4814 (class 2606 OID 19385)
-- Name: impl_rulesetsdefinitions impl_rulesetsdefinitions_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY impl_rulesetsdefinitions
    ADD CONSTRAINT impl_rulesetsdefinitions_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4820 (class 2606 OID 19415)
-- Name: platform_appsettings_general platform_appsettings_general_defaultdatagenerationapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_appsettings_general
    ADD CONSTRAINT platform_appsettings_general_defaultdatagenerationapp_fkey FOREIGN KEY (defaultdatagenerationapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4819 (class 2606 OID 19410)
-- Name: platform_appsettings_general platform_appsettings_general_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_appsettings_general
    ADD CONSTRAINT platform_appsettings_general_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4818 (class 2606 OID 19405)
-- Name: platform_appsettings_general platform_appsettings_general_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_appsettings_general
    ADD CONSTRAINT platform_appsettings_general_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4821 (class 2606 OID 19420)
-- Name: platform_config_dataattributes platform_config_dataattributes_applicationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_dataattributes
    ADD CONSTRAINT platform_config_dataattributes_applicationid_fkey FOREIGN KEY (applicationid) REFERENCES impl_application(appguid);


--
-- TOC entry 4824 (class 2606 OID 19435)
-- Name: platform_config_dataattributes platform_config_dataattributes_dataattributeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_dataattributes
    ADD CONSTRAINT platform_config_dataattributes_dataattributeid_fkey FOREIGN KEY (dataattributeid) REFERENCES platform_dataattributes(platformdataattributesid);


--
-- TOC entry 4822 (class 2606 OID 19425)
-- Name: platform_config_dataattributes platform_config_dataattributes_datagentypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_dataattributes
    ADD CONSTRAINT platform_config_dataattributes_datagentypeid_fkey FOREIGN KEY (datagentypeid) REFERENCES refdata_datagentypes(datagentypeid);


--
-- TOC entry 4823 (class 2606 OID 19430)
-- Name: platform_config_dataattributes platform_config_dataattributes_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_dataattributes
    ADD CONSTRAINT platform_config_dataattributes_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4828 (class 2606 OID 19465)
-- Name: platform_config_datastructures platform_config_datastructures_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_datastructures
    ADD CONSTRAINT platform_config_datastructures_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4829 (class 2606 OID 19460)
-- Name: platform_config_datastructures platform_config_datastructures_sensitivityflagid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_datastructures
    ADD CONSTRAINT platform_config_datastructures_sensitivityflagid_fkey FOREIGN KEY (sensitivityflagid) REFERENCES refdata_sensitivityflag(sensitiveflagid);


--
-- TOC entry 4830 (class 2606 OID 19455)
-- Name: platform_config_datastructures platform_config_datastructures_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_datastructures
    ADD CONSTRAINT platform_config_datastructures_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4831 (class 2606 OID 19490)
-- Name: platform_config_datastructures_dtl platform_config_datastructuresdtl_platformdataattributesid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_datastructures_dtl
    ADD CONSTRAINT platform_config_datastructuresdtl_platformdataattributesid_fkey FOREIGN KEY (platformdataattributesid) REFERENCES platform_dataattributes(platformdataattributesid);


--
-- TOC entry 4832 (class 2606 OID 19480)
-- Name: platform_config_datastructures_dtl platform_config_datastructuresdtl_platformdatastructuresid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_datastructures_dtl
    ADD CONSTRAINT platform_config_datastructuresdtl_platformdatastructuresid_fkey FOREIGN KEY (platformdatastructuresid) REFERENCES platform_config_datastructures(platformdatastructuresid);


--
-- TOC entry 4833 (class 2606 OID 19470)
-- Name: platform_config_datastructures_dtl platform_config_datastructuresdtl_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_datastructures_dtl
    ADD CONSTRAINT platform_config_datastructuresdtl_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4834 (class 2606 OID 19485)
-- Name: platform_config_datastructures_dtl platform_config_datastructuresdtl_sensitivityflagid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_datastructures_dtl
    ADD CONSTRAINT platform_config_datastructuresdtl_sensitivityflagid_fkey FOREIGN KEY (sensitivityflagid) REFERENCES refdata_sensitivityflag(sensitiveflagid);


--
-- TOC entry 4835 (class 2606 OID 19475)
-- Name: platform_config_datastructures_dtl platform_config_datastructuresdtl_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_config_datastructures_dtl
    ADD CONSTRAINT platform_config_datastructuresdtl_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4827 (class 2606 OID 19450)
-- Name: platform_dataattributes platform_dataattributes_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_dataattributes
    ADD CONSTRAINT platform_dataattributes_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4826 (class 2606 OID 19445)
-- Name: platform_dataattributes platform_dataattributes_sensitivityflagid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_dataattributes
    ADD CONSTRAINT platform_dataattributes_sensitivityflagid_fkey FOREIGN KEY (sensitivityflagid) REFERENCES refdata_sensitivityflag(sensitiveflagid);


--
-- TOC entry 4825 (class 2606 OID 19440)
-- Name: platform_dataattributes platform_dataattributes_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platform_dataattributes
    ADD CONSTRAINT platform_dataattributes_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4838 (class 2606 OID 19505)
-- Name: refdata_codeset refdata_codeset_industrystd_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_codeset
    ADD CONSTRAINT refdata_codeset_industrystd_fkey FOREIGN KEY (industrystd) REFERENCES refdata_industrystd(industrystd);


--
-- TOC entry 4837 (class 2606 OID 19500)
-- Name: refdata_codeset refdata_codeset_sensitivityflagid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_codeset
    ADD CONSTRAINT refdata_codeset_sensitivityflagid_fkey FOREIGN KEY (sensitivityflagid) REFERENCES refdata_sensitivityflag(sensitiveflagid);


--
-- TOC entry 4836 (class 2606 OID 19495)
-- Name: refdata_codeset refdata_codeset_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_codeset
    ADD CONSTRAINT refdata_codeset_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4839 (class 2606 OID 19510)
-- Name: refdata_countries refdata_countries_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_countries
    ADD CONSTRAINT refdata_countries_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4840 (class 2606 OID 19515)
-- Name: refdata_datagentypes refdata_datagentypes_dataattributeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_datagentypes
    ADD CONSTRAINT refdata_datagentypes_dataattributeid_fkey FOREIGN KEY (dataattributeid) REFERENCES platform_dataattributes(platformdataattributesid);


--
-- TOC entry 4841 (class 2606 OID 19520)
-- Name: refdata_datagentypes refdata_datagentypes_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_datagentypes
    ADD CONSTRAINT refdata_datagentypes_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4844 (class 2606 OID 19535)
-- Name: refdata_industrystd_datatypes refdata_industrystd_datatypes_industrystd_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd_datatypes
    ADD CONSTRAINT refdata_industrystd_datatypes_industrystd_fkey FOREIGN KEY (industrystd) REFERENCES refdata_industrystd(industrystd);


--
-- TOC entry 4843 (class 2606 OID 19530)
-- Name: refdata_industrystd_datatypes refdata_industrystd_datatypes_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd_datatypes
    ADD CONSTRAINT refdata_industrystd_datatypes_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4847 (class 2606 OID 19550)
-- Name: refdata_industrystd_fields refdata_industrystd_fields_industrystd_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd_fields
    ADD CONSTRAINT refdata_industrystd_fields_industrystd_fkey FOREIGN KEY (industrystd) REFERENCES refdata_industrystd(industrystd);


--
-- TOC entry 4846 (class 2606 OID 19545)
-- Name: refdata_industrystd_fields refdata_industrystd_fields_sensitivityflagid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd_fields
    ADD CONSTRAINT refdata_industrystd_fields_sensitivityflagid_fkey FOREIGN KEY (sensitivityflagid) REFERENCES refdata_sensitivityflag(sensitiveflagid);


--
-- TOC entry 4845 (class 2606 OID 19540)
-- Name: refdata_industrystd_fields refdata_industrystd_fields_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd_fields
    ADD CONSTRAINT refdata_industrystd_fields_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4849 (class 2606 OID 19560)
-- Name: refdata_industrystd_segments refdata_industrystd_segments_industrystd_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd_segments
    ADD CONSTRAINT refdata_industrystd_segments_industrystd_fkey FOREIGN KEY (industrystd) REFERENCES refdata_industrystd(industrystd);


--
-- TOC entry 4848 (class 2606 OID 19555)
-- Name: refdata_industrystd_segments refdata_industrystd_segments_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd_segments
    ADD CONSTRAINT refdata_industrystd_segments_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4842 (class 2606 OID 19525)
-- Name: refdata_industrystd refdata_industrystd_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_industrystd
    ADD CONSTRAINT refdata_industrystd_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4850 (class 2606 OID 19565)
-- Name: refdata_operationtype refdata_operationtype_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_operationtype
    ADD CONSTRAINT refdata_operationtype_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4851 (class 2606 OID 19570)
-- Name: refdata_platformparams refdata_platformparams_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_platformparams
    ADD CONSTRAINT refdata_platformparams_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4855 (class 2606 OID 19590)
-- Name: refdata_platformparamstodataattributes refdata_platformparamstodataattributes_dataattributeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_platformparamstodataattributes
    ADD CONSTRAINT refdata_platformparamstodataattributes_dataattributeid_fkey FOREIGN KEY (dataattributeid) REFERENCES platform_dataattributes(platformdataattributesid);


--
-- TOC entry 4853 (class 2606 OID 19580)
-- Name: refdata_platformparamstodataattributes refdata_platformparamstodataattributes_platformparamsid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_platformparamstodataattributes
    ADD CONSTRAINT refdata_platformparamstodataattributes_platformparamsid_fkey FOREIGN KEY (platformparamsid) REFERENCES refdata_platformparams(platformparamsid);


--
-- TOC entry 4852 (class 2606 OID 19575)
-- Name: refdata_platformparamstodataattributes refdata_platformparamstodataattributes_registeredapp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_platformparamstodataattributes
    ADD CONSTRAINT refdata_platformparamstodataattributes_registeredapp_fkey FOREIGN KEY (registeredapp) REFERENCES impl_application(appguid);


--
-- TOC entry 4854 (class 2606 OID 19585)
-- Name: refdata_platformparamstodataattributes refdata_platformparamstodataattributes_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_platformparamstodataattributes
    ADD CONSTRAINT refdata_platformparamstodataattributes_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4856 (class 2606 OID 19595)
-- Name: refdata_sensitivityflag refdata_sensitivityflag_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_sensitivityflag
    ADD CONSTRAINT refdata_sensitivityflag_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4857 (class 2606 OID 19600)
-- Name: refdata_terminologystd refdata_terminologystd_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_terminologystd
    ADD CONSTRAINT refdata_terminologystd_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4858 (class 2606 OID 19605)
-- Name: refdata_timezones refdata_timezones_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_timezones
    ADD CONSTRAINT refdata_timezones_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4859 (class 2606 OID 19610)
-- Name: refdata_usstates refdata_usstates_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_usstates
    ADD CONSTRAINT refdata_usstates_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4860 (class 2606 OID 19615)
-- Name: refdata_vendor refdata_vendor_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refdata_vendor
    ADD CONSTRAINT refdata_vendor_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4863 (class 2606 OID 19625)
-- Name: terms_codeset_industrystd terms_codeset_industrystd_codesetsid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terms_codeset_industrystd
    ADD CONSTRAINT terms_codeset_industrystd_codesetsid_fkey FOREIGN KEY (codesetsid) REFERENCES refdata_codeset(codesetsid);


--
-- TOC entry 4861 (class 2606 OID 19842)
-- Name: terms_codeset_industrystd terms_codeset_industrystd_industrystd_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terms_codeset_industrystd
    ADD CONSTRAINT terms_codeset_industrystd_industrystd_fkey FOREIGN KEY (industrystd) REFERENCES refdata_industrystd(industrystd);


--
-- TOC entry 4862 (class 2606 OID 19620)
-- Name: terms_codeset_industrystd terms_codeset_industrystd_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terms_codeset_industrystd
    ADD CONSTRAINT terms_codeset_industrystd_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_status(statusid);


--
-- TOC entry 4864 (class 2606 OID 20804)
-- Name: terms_codeset_industrystd terms_codeset_industrystd_termstd_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terms_codeset_industrystd
    ADD CONSTRAINT terms_codeset_industrystd_termstd_fk FOREIGN KEY (terminologystdid) REFERENCES refdata_terminologystd(terminologystdid);


-- Completed on 2022-05-31 00:46:19 CDT

--
-- PostgreSQL database dump complete
--

