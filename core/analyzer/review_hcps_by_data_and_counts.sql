
/*
REVIEW_HCPS_BY_DATA_AND_COUNTS.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 3/7/23 modified:

Script to pull HCPs for counts and data inspection
Outputs: 1. select mail address, mail phone, practice address, practice phone and direct endpoint
		 2. total count	
*/

SELECT npi, prov_first_name AS first_name, prov_last_name AS last_name, CONCAT(mailing_address_line_1, " ", mailing_address_line_2) AS mail_address, mailing_address_city AS mail_city, mailing_address_state AS mail_state, mailing_address_zip AS mail_zip, mailing_address_phone AS mail_phone, CONCAT(practice_address_line_1, " ", practice_address_line_2) AS practice_address, practice_address_city AS practice_city, practice_address_state AS practice_state, practice_address_zip AS practice_zip, practice_address_phone AS practice_phone
FROM npi_npidata 
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

SELECT COUNT(*)
FROM npi_npidata
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
