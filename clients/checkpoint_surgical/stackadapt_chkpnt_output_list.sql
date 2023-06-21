/*
STACKADAPT_CHKPNT_OUTPUT_LIST.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 6/21/23 modified:

Script to pull HCPs for StackAdapt campaigns using Checkpoint's ortho hand HCP list
Outputs: select mail address, mail phone, practice address, practice phone and direct endpoint
*/

-- SCRIPT BEGINS

-- first, create and populate table for addresses from npi_npidata table where npi in checkpoint hcp list is in npi_npidata
DROP TABLE IF EXISTS hcp_chkpnt_addresses;
CREATE TABLE hcp_chkpnt_addresses (
npi INT,
fname VARCHAR(100),
lname VARCHAR(100),
mail_address VARCHAR(500),
mail_city VARCHAR(100),
mail_state VARCHAR(100),
mail_zip VARCHAR(100),
mail_phone VARCHAR(100),
prac_address VARCHAR(500),
prac_city VARCHAR(100),
prac_state VARCHAR(100),
prac_zip VARCHAR(100),
prac_phone VARCHAR(100));

INSERT INTO hcp_chkpnt_addresses 
(npi, fname, lname, mail_address, mail_city, mail_state, mail_zip, mail_phone, prac_address, prac_city, prac_state, prac_zip, prac_phone)
SELECT npi, prov_first_name AS first_name, prov_last_name AS last_name, CONCAT(mailing_address_line_1, " ", mailing_address_line_2) AS mail_address, mailing_address_city AS mail_city, mailing_address_state AS mail_state, mailing_address_zip AS mail_zip, mailing_address_phone AS mail_phone, CONCAT(practice_address_line_1, " ", practice_address_line_2) AS practice_address, practice_address_city AS practice_city, practice_address_state AS practice_state, practice_address_zip AS practice_zip, practice_address_phone AS practice_phone
FROM npi_npidata n
WHERE n.npi IN (SELECT choh.npi FROM checkpoint.checkpoint_hcps_ortho_hand choh);

SELECT * FROM hcp_chkpnt_addresses;
SELECT COUNT(*) FROM hcp_chkpnt_addresses;

-- next, create and populate table for the endpoint of type direct (must pull only one if there are dupes) corresponding to the npi
DROP TABLE IF EXISTS hcp_chkpnt_direct_endpoints;
CREATE TABLE hcp_chkpnt_direct_endpoints (
npi INT,
endpoint VARCHAR(1000));

INSERT INTO hcp_chkpnt_direct_endpoints
(npi, endpoint)
SELECT DISTINCT npi, endpoint
FROM npi_endpoints
WHERE endpoint_type='DIRECT' AND npi IN (SELECT npi FROM hcp_chkpnt_addresses);

SELECT * FROM hcp_chkpnt_direct_endpoints;
SELECT COUNT(*) FROM hcp_chkpnt_direct_endpoints;

-- join tables to combine endpoint with addresses
DROP TABLE IF EXISTS hcp_output_list;
CREATE TABLE hcp_output_list (
fname VARCHAR(100),
lname VARCHAR(100),
mail_address VARCHAR(500),
mail_city VARCHAR(100),
mail_state VARCHAR(100),
mail_zip VARCHAR(100),
mail_phone VARCHAR(100),
prac_address VARCHAR(500),
prac_city VARCHAR(100),
prac_state VARCHAR(100),
prac_zip VARCHAR(100),
prac_phone VARCHAR(100),
endpoint VARCHAR(1000));

INSERT INTO hcp_output_list
(fname, lname, mail_address, mail_city, mail_state, mail_zip, mail_phone, prac_address, prac_city, prac_state, prac_zip, prac_phone, endpoint)
SELECT fname, lname, mail_address, mail_city, mail_state, mail_zip, mail_phone, prac_address, prac_city, prac_state, prac_zip, prac_phone, endpoint 
FROM hcp_chkpnt_addresses
LEFT JOIN hcp_chkpnt_direct_endpoints USING (npi);

SELECT * FROM hcp_output_list;
SELECT COUNT(*) FROM hcp_output_list;

/*
-- UPDATE THIS PART WITH NAME TO BE USED FOR OUTPUT FILE ********************
-- ONLY USE THIS IF NOT CREATING EXPORT FILE WITH AZURE DATA FACTORY

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














