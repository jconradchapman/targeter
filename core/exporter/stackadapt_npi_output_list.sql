/*
UNIVERSAL_NPI_OUTPUT_LIST.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 6/24/22 modified:

Script to pull HCPs for StackAdapt campaigns
Outputs: elect mail address, mail phone, practice address, practice phone and direct endpoint
*/


-- first, create and populate table for addresses from npi_npidata table
DROP TABLE IF EXISTS hcp_addresses;
CREATE TABLE hcp_addresses (
npi int,
fname varchar(100),
lname varchar(100),
mail_address varchar(500),
mail_city varchar(100),
mail_state varchar(100),
mail_zip varchar(100),
mail_phone varchar(100),
prac_address varchar(500),
prac_city varchar(100),
prac_state varchar(100),
prac_zip varchar(100),
prac_phone varchar(100));

INSERT INTO hcp_addresses 
(npi, fname, lname, mail_address, mail_city, mail_state, mail_zip, mail_phone, prac_address, prac_city, prac_state, prac_zip, prac_phone)
SELECT npi, prov_first_name AS first_name, prov_last_name AS last_name, CONCAT(c21, " ", c22) AS mail_address, c23 AS mail_city, c24 AS mail_state, c25 AS mail_zip, c27 AS mail_phone, CONCAT(c29, " ", c30) AS practice_address, c31 AS practice_city, c32 AS practice_state, c33 AS practice_zip, c35 AS practice_phone
FROM npi_npidata USE INDEX (taxonomy_code_1)

-- ******************** UPDATE THIS PART ONLY WITH RELEVANT TAXONOMY CODES ********************

WHERE
	npi_npidata.health_prov_taxonomy_code_1 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR 
	npi_npidata.health_prov_taxonomy_code_2 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR 
	npi_npidata.health_prov_taxonomy_code_3 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR
	npi_npidata.health_prov_taxonomy_code_4 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR
	npi_npidata.health_prov_taxonomy_code_5 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR
	npi_npidata.health_prov_taxonomy_code_6 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR 
	npi_npidata.health_prov_taxonomy_code_7 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR 
	npi_npidata.health_prov_taxonomy_code_8 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR
	npi_npidata.health_prov_taxonomy_code_9 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR
	npi_npidata.health_prov_taxonomy_code_10 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR
	npi_npidata.health_prov_taxonomy_code_11 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR 
	npi_npidata.health_prov_taxonomy_code_12 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR 
	npi_npidata.health_prov_taxonomy_code_13 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR
	npi_npidata.health_prov_taxonomy_code_14 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X') OR
	npi_npidata.health_prov_taxonomy_code_15 IN ('207RH0003X', '207RX0202X', '2085R0001X', '163WX0200X', '364SX0200X');

-- ***************************************************************************************

SELECT * FROM hcp_addresses;
SELECT COUNT(*) FROM hcp_addresses;

-- next, create and populate table for the endpoint of type direct (must pull only one if there are dupes) corresponding to the npi
DROP TABLE IF EXISTS hcp_direct_endpoints;
CREATE TABLE hcp_direct_endpoints (
npi int,
endpoint varchar(1000));

INSERT INTO hcp_direct_endpoints
(npi, endpoint)
SELECT DISTINCT npi, endpoint
FROM npi_endpoints
WHERE endpoint_type='DIRECT' AND npi IN (SELECT npi FROM hcp_addresses);

SELECT * FROM hcp_direct_endpoints;
SELECT COUNT(*) FROM hcp_direct_endpoints;

-- join tables to combine endpoint with addresses
DROP TABLE IF EXISTS hcp_output_list;
CREATE TABLE hcp_output_list (
fname varchar(100),
lname varchar(100),
mail_address varchar(500),
mail_city varchar(100),
mail_state varchar(100),
mail_zip varchar(100),
mail_phone varchar(100),
prac_address varchar(500),
prac_city varchar(100),
prac_state varchar(100),
prac_zip varchar(100),
prac_phone varchar(100),
endpoint varchar(1000));

INSERT INTO hcp_output_list
(fname, lname, mail_address, mail_city, mail_state, mail_zip, mail_phone, prac_address, prac_city, prac_state, prac_zip, prac_phone, endpoint)
SELECT fname, lname, mail_address, mail_city, mail_state, mail_zip, mail_phone, prac_address, prac_city, prac_state, prac_zip, prac_phone, endpoint 
FROM hcp_addresses
LEFT JOIN hcp_direct_endpoints USING (npi);

SELECT * FROM hcp_output_list;
SELECT COUNT(*) FROM hcp_output_list;