/*
SYN_CMS_DATA_EXPLORATION_STATEMENTS.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 05.11.2023 modified: 05.17.2023
Script contains data analysis statements for SYN_CMS data
*/

-- EXPLORE DATA

-- inspect data fields from syn_cms db tables
SELECT * FROM syn_cms_beneficiaries LIMIT 250;

SELECT * FROM syn_cms_carrier_claims LIMIT 250; -- icd9_dgns_cd_1 is most populated of the repeating group, percent populated decreases exponentially towards icd9_dgns_cd_8

SELECT * FROM syn_cms_inpat_claims LIMIT 250;

SELECT * FROM syn_cms_outpat_claims LIMIT 250;

SELECT * FROM syn_cms_prescriptions LIMIT 250;

-- run counts on syn_cms db tables
SELECT COUNT(*) FROM syn_cms_beneficiaries; -- 7,104,285 | 5/12/2023

SELECT COUNT(*) FROM syn_cms_carrier_claims; -- 94,863,452 | 5/12/2023

SELECT COUNT(*) FROM syn_cms_inpat_claims; -- 1,332,822 | 5/12/2023

SELECT COUNT(*) FROM syn_cms_outpat_claims; -- 15,036,943 | 5/12/2023

SELECT COUNT(*) FROM syn_cms_prescriptions; -- 105,533,822 | 5/12/2023

-- run counts from syn_cms_beneficiaries by gender
SELECT bene_sex_ident_cd, COUNT(*) FROM syn_cms_beneficiaries GROUP BY bene_sex_ident_cd; -- females outnumber males

-- calculate age of beneficiaries, then determine counts of beneficiaries grouped per age
SELECT ROUND(DATEDIFF(NOW(), STR_TO_DATE(bene_birth_dt, '%Y%m%d'))/365) AS bene_age, COUNT(*)
FROM syn_cms_beneficiaries
GROUP BY bene_age;
-- INITIAL FINDINGS: ages range from 39 to 114, greatest number of beneficiaries are 84 years old

-- run counts from syn_cms_beneficiaries by state
SELECT scb.sp_state_code, COUNT(*)
FROM syn_cms_beneficiaries scb
GROUP BY scb.sp_state_code;

-- run counts from syn_cms_beneficiaries by state joined to lkup_cms_state_codes to include state name in results
SELECT scb.sp_state_code, lcsc.state_name, COUNT(*)
FROM syn_cms_beneficiaries scb
JOIN lkup_cms_state_codes lcsc ON scb.sp_state_code = lcsc.state_code
GROUP BY scb.sp_state_code, lcsc.state_name;

-- calculate the extent to which data in syn_cms_carrier_claims are missing
SELECT 
SUM(CASE WHEN icd9_dgns_cd_1 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_1_missing,
SUM(CASE WHEN icd9_dgns_cd_2 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_2_missing,
SUM(CASE WHEN icd9_dgns_cd_3 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_3_missing,
SUM(CASE WHEN icd9_dgns_cd_4 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_4_missing,
SUM(CASE WHEN icd9_dgns_cd_5 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_5_missing,
SUM(CASE WHEN icd9_dgns_cd_6 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_6_missing,
SUM(CASE WHEN icd9_dgns_cd_7 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_7_missing,
SUM(CASE WHEN icd9_dgns_cd_8 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_8_missing,
SUM(CASE WHEN prf_physn_npi_1 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_1_missing,
SUM(CASE WHEN prf_physn_npi_2 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_2_missing,
SUM(CASE WHEN prf_physn_npi_3 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_3_missing,
SUM(CASE WHEN prf_physn_npi_4 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_4_missing,
SUM(CASE WHEN prf_physn_npi_5 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_5_missing,
SUM(CASE WHEN prf_physn_npi_6 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_6_missing,
SUM(CASE WHEN prf_physn_npi_7 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_7_missing,
SUM(CASE WHEN prf_physn_npi_8 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_8_missing,
SUM(CASE WHEN prf_physn_npi_9 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_9_missing,
SUM(CASE WHEN prf_physn_npi_10 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_10_missing,
SUM(CASE WHEN prf_physn_npi_11 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_11_missing,
SUM(CASE WHEN prf_physn_npi_12 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_12_missing,
SUM(CASE WHEN prf_physn_npi_13 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_13_missing,
SUM(CASE WHEN prf_physn_npi_1 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_1_missing,
SUM(CASE WHEN prf_physn_npi_2 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_2_missing,
SUM(CASE WHEN prf_physn_npi_3 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_3_missing,
SUM(CASE WHEN prf_physn_npi_4 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_4_missing,
SUM(CASE WHEN prf_physn_npi_5 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_5_missing,
SUM(CASE WHEN prf_physn_npi_6 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_6_missing,
SUM(CASE WHEN prf_physn_npi_7 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_7_missing,
SUM(CASE WHEN prf_physn_npi_8 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_8_missing,
SUM(CASE WHEN prf_physn_npi_9 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_9_missing,
SUM(CASE WHEN prf_physn_npi_10 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_10_missing,
SUM(CASE WHEN prf_physn_npi_11 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_11_missing,
SUM(CASE WHEN prf_physn_npi_12 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_12_missing,
SUM(CASE WHEN prf_physn_npi_13 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS prf_physn_npi_13_missing
FROM syn_cms_carrier_claims;

-- calculate the extent to which data in syn_cms_inpat_claims are missing
SELECT 
SUM(CASE WHEN at_physn_npi IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS at_physn_npi_missing,
SUM(CASE WHEN op_physn_npi IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS op_physn_npi_missing,
SUM(CASE WHEN ot_physn_npi IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS ot_physn_npi_missing,
SUM(CASE WHEN icd9_dgns_cd_1 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_1_missing,
SUM(CASE WHEN icd9_dgns_cd_2 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_2_missing,
SUM(CASE WHEN icd9_dgns_cd_3 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_3_missing,
SUM(CASE WHEN icd9_dgns_cd_4 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_4_missing,
SUM(CASE WHEN icd9_dgns_cd_5 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_5_missing,
SUM(CASE WHEN icd9_dgns_cd_6 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_6_missing,
SUM(CASE WHEN icd9_dgns_cd_7 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_7_missing,
SUM(CASE WHEN icd9_dgns_cd_8 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_8_missing,
SUM(CASE WHEN icd9_dgns_cd_9 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_9_missing,
SUM(CASE WHEN icd9_dgns_cd_10 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_10_missing,
SUM(CASE WHEN icd9_prcdr_cd_1 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_prcdr_1_missing,
SUM(CASE WHEN icd9_prcdr_cd_2 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_prcdr_2_missing,
SUM(CASE WHEN icd9_prcdr_cd_2 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_prcdr_3_missing,
SUM(CASE WHEN icd9_prcdr_cd_4 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_prcdr_4_missing,
SUM(CASE WHEN icd9_prcdr_cd_5 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_prcdr_5_missing,
SUM(CASE WHEN icd9_prcdr_cd_6 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_prcdr_6_missing
FROM syn_cms_inpat_claims;

-- calculate the extent to which data in syn_cms_outpat_claims are missing
SELECT 
SUM(CASE WHEN at_physn_npi IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS at_physn_npi_missing,
SUM(CASE WHEN op_physn_npi IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS op_physn_npi_missing,
SUM(CASE WHEN ot_physn_npi IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS ot_physn_npi_missing,
SUM(CASE WHEN icd9_dgns_cd_1 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_1_missing,
SUM(CASE WHEN icd9_dgns_cd_2 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_2_missing,
SUM(CASE WHEN icd9_dgns_cd_3 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_3_missing,
SUM(CASE WHEN icd9_dgns_cd_4 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_4_missing,
SUM(CASE WHEN icd9_dgns_cd_5 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_5_missing,
SUM(CASE WHEN icd9_dgns_cd_6 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_6_missing,
SUM(CASE WHEN icd9_dgns_cd_7 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_7_missing,
SUM(CASE WHEN icd9_dgns_cd_8 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_8_missing,
SUM(CASE WHEN icd9_dgns_cd_9 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_9_missing,
SUM(CASE WHEN icd9_dgns_cd_10 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_10_missing,
SUM(CASE WHEN icd9_prcdr_cd_1 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_prcdr_1_missing,
SUM(CASE WHEN icd9_prcdr_cd_2 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_prcdr_2_missing,
SUM(CASE WHEN icd9_prcdr_cd_2 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_prcdr_3_missing,
SUM(CASE WHEN icd9_prcdr_cd_4 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_prcdr_4_missing,
SUM(CASE WHEN icd9_prcdr_cd_5 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_prcdr_5_missing,
SUM(CASE WHEN icd9_prcdr_cd_6 IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_prcdr_6_missing
FROM syn_cms_outpat_claims;

-- EXPLORE USE CASE SCENARIOS

-- 1 ******************** generate list of attending HCPs treating patients with tuberous sclerosis by querying for outpatient patients with tuberous sclerosis, matching synthetic HCP IDs to actual HCP IDs in the NPI database

SELECT scoc.desynpuf_id, scoc.icd9_dgns_cd_1 AS first_diagnosis_code, scoc.at_physn_npi AS synthetic_npi_id, nn.npi AS real_npi_id, nn.prov_first_name, nn.prov_last_name, nn.health_prov_taxonomy_code_1, nn.practice_address_line_1, nn.practice_address_city, nn.practice_address_state, nn.practice_address_phone  
FROM syn_cms_outpat_claims scoc
LEFT JOIN npi.npi_npidata nn ON nn.npi = CAST(scoc.at_physn_npi AS UNSIGNED) 
WHERE scoc.icd9_dgns_cd_1 = "7595" OR scoc.icd9_dgns_cd_2 = "7595" OR scoc.icd9_dgns_cd_3 = "7595";
-- INITIAL FINDINGS: NPI IDs used in the DE-SynPUF data don't match NPI IDs from current NPI data - assuming DE-SynPUF IDs have been munged

-- **********************


-- 2 ******************** generate a combined list of HCPs from inpatient, outpatient and carrier claims diagnosing patients with tuberous sclerosis 

-- truncate table clear old HCP list
TRUNCATE TABLE hcp_list_by_dgns;

/*
CREATE TABLE hcp_list_by_dgns (
hcp_pk INT AUTO_INCREMENT PRIMARY KEY,
hcp_npi VARCHAR(50));
*/

-- set qualifying condition (ICD-9 code)
-- set variable = a single diagnosis code or a comma-separated list of codes (ex. '7595' | '7595,49399')
SET @dgns_code = '7595';

-- insert HCPs from carrier claims data
INSERT INTO hcp_list_by_dgns (hcp_npi)
SELECT prf_physn_npi_1 
FROM syn_cms_carrier_claims sccc
WHERE 
	FIND_IN_SET(sccc.icd9_dgns_cd_1, @dgns_code) OR 
	FIND_IN_SET(sccc.icd9_dgns_cd_2, @dgns_code) OR
	FIND_IN_SET(sccc.icd9_dgns_cd_3, @dgns_code);

INSERT INTO hcp_list_by_dgns (hcp_npi)
SELECT prf_physn_npi_2 
FROM syn_cms_carrier_claims sccc
WHERE
	FIND_IN_SET(sccc.icd9_dgns_cd_1, @dgns_code) OR 
	FIND_IN_SET(sccc.icd9_dgns_cd_2, @dgns_code) OR
	FIND_IN_SET(sccc.icd9_dgns_cd_3, @dgns_code);

-- insert HCPs from inpatient claims data
INSERT INTO hcp_list_by_dgns (hcp_npi)
SELECT at_physn_npi
FROM syn_cms_inpat_claims scic
WHERE 
	FIND_IN_SET(scic.icd9_dgns_cd_1, @dgns_code) OR 
	FIND_IN_SET(scic.icd9_dgns_cd_2, @dgns_code) OR
	FIND_IN_SET(scic.icd9_dgns_cd_3, @dgns_code);

INSERT INTO hcp_list_by_dgns (hcp_npi)
SELECT op_physn_npi
FROM syn_cms_inpat_claims scic
WHERE
	FIND_IN_SET(scic.icd9_dgns_cd_1, @dgns_code) OR 
	FIND_IN_SET(scic.icd9_dgns_cd_2, @dgns_code) OR
	FIND_IN_SET(scic.icd9_dgns_cd_3, @dgns_code);

-- insert HCPs from outpatient claims data
INSERT INTO hcp_list_by_dgns (hcp_npi)
SELECT at_physn_npi
FROM syn_cms_outpat_claims scoc
WHERE
	FIND_IN_SET(scoc.icd9_dgns_cd_1, @dgns_code) OR 
	FIND_IN_SET(scoc.icd9_dgns_cd_2, @dgns_code) OR
	FIND_IN_SET(scoc.icd9_dgns_cd_3, @dgns_code);

-- create final deduped HCP list
SELECT COUNT(DISTINCT hcp_npi) FROM hcp_list_by_dgns;

-- INITIAL FINDINGS: 590 distinct HCPs found to have patients with tuberous sclerosis

-- **********************

