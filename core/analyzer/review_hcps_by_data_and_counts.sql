
/*
REVIEW_HCPS_BY_DATA_AND_COUNTS.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 3/7/2023 modified: 05/10/2023

Script to pull HCPs for counts and data inspection
Outputs: 1. total count
		 2. select mail address, mail phone, practice address, practice phone and direct endpoint
*/

-- set variable = a single taxonomy code or a comma-separated list of codes (ex. '207RH0003X' | '207RH0003X,207RX0202X')
SET @tcode = '207RH0003X,207RX0202X';

-- generate count of HCPs
SELECT COUNT(*)
FROM npi_npidata
WHERE
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_1, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_2, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_3, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_4, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_5, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_6, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_7, @tcode) OR 
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_8, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_9, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_10, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_11, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_12, @tcode) OR 
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_13, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_14, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_15, @tcode);


-- generate list of HCPs
SELECT npi, prov_first_name AS first_name, prov_last_name AS last_name, CONCAT(mailing_address_line_1, " ", mailing_address_line_2) AS mail_address, mailing_address_city AS mail_city, mailing_address_state AS mail_state, mailing_address_zip AS mail_zip, mailing_address_phone AS mail_phone, CONCAT(practice_address_line_1, " ", practice_address_line_2) AS practice_address, practice_address_city AS practice_city, practice_address_state AS practice_state, practice_address_zip AS practice_zip, practice_address_phone AS practice_phone
FROM npi_npidata 
WHERE
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_1, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_2, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_3, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_4, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_5, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_6, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_7, @tcode) OR 
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_8, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_9, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_10, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_11, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_12, @tcode) OR 
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_13, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_14, @tcode) OR
	FIND_IN_SET(npi_npidata.health_prov_taxonomy_code_15, @tcode);