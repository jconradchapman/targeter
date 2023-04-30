/*
STACKADAPT_NPI_OUTPUT_LIST.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 6/24/22 modified: 10/4/22

Script to pull HCPs for StackAdapt campaigns
Outputs: select mail address, mail phone, practice address, practice phone and direct endpoint
*/

-- SCRIPT BEGINS

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
SELECT npi, prov_first_name AS first_name, prov_last_name AS last_name, CONCAT(mailing_address_line_1, " ", mailing_address_line_2) AS mail_address, mailing_address_city AS mail_city, mailing_address_state AS mail_state, mailing_address_zip AS mail_zip, mailing_address_phone AS mail_phone, CONCAT(practice_address_line_1, " ", practice_address_line_2) AS practice_address, practice_address_city AS practice_city, practice_address_state AS practice_state, practice_address_zip AS practice_zip, practice_address_phone AS practice_phone
FROM npi_npidata

-- UPDATE THIS PART ONLY WITH RELEVANT TAXONOMY CODES ********************

WHERE
	npi_npidata.health_prov_taxonomy_code_1 IN ('207RG0100X') OR
	npi_npidata.health_prov_taxonomy_code_2 IN ('207RG0100X') OR
	npi_npidata.health_prov_taxonomy_code_3 IN ('207RG0100X') OR
	npi_npidata.health_prov_taxonomy_code_4 IN ('207RG0100X') OR
	npi_npidata.health_prov_taxonomy_code_5 IN ('207RG0100X') OR
	npi_npidata.health_prov_taxonomy_code_6 IN ('207RG0100X') OR 
	npi_npidata.health_prov_taxonomy_code_7 IN ('207RG0100X') OR 
	npi_npidata.health_prov_taxonomy_code_8 IN ('207RG0100X') OR
	npi_npidata.health_prov_taxonomy_code_9 IN ('207RG0100X') OR
	npi_npidata.health_prov_taxonomy_code_10 IN ('207RG0100X') OR
	npi_npidata.health_prov_taxonomy_code_11 IN ('207RG0100X') OR
	npi_npidata.health_prov_taxonomy_code_12 IN	('207RG0100X') OR 
	npi_npidata.health_prov_taxonomy_code_13 IN ('207RG0100X') OR
	npi_npidata.health_prov_taxonomy_code_14 IN ('207RG0100X') OR
	npi_npidata.health_prov_taxonomy_code_15 IN ('207RG0100X');

-- ************************************************************************

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

/*
-- UPDATE THIS PART WITH NAME TO BE USED FOR OUTPUT FILE ********************

-- export column names in first row (preferred)
SELECT 'fname', 'lname', 'mail_address', 'mail_city', 'mail_state', 'mail_zip', 'mail_phone', 'prac_address', 'prac_city', 'prac_state', 'prac_zip', 'prac_phone', 'endpoint'
UNION ALL
SELECT * FROM (SELECT fname, lname, mail_address, mail_city, mail_state, mail_zip, mail_phone, prac_address, prac_city, prac_state, prac_zip, prac_phone, endpoint FROM hcp_output_list) a
INTO OUTFILE 'C:\Users\jchapman\Downloads\lungevity_gateways_campaign_hcp_list_20221004test.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- **************************************************************************
*/

-- SCRIPT ENDS














