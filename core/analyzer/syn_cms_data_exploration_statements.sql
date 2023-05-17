/*
SYN_CMS_DATA_EXPLORATION_STATEMENTS.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 05.11.2023 modified: 
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

-- calculate the extent to which icd9 codes are not missing
SELECT 
SUM(CASE WHEN icd9_dgns_cd_1 IS NOT NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_1_avail_rate
SUM(CASE WHEN icd9_dgns_cd_2 IS NOT NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_2_avail_rate
SUM(CASE WHEN icd9_dgns_cd_3 IS NOT NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_3_avail_rate
SUM(CASE WHEN icd9_dgns_cd_4 IS NOT NULL THEN 1 ELSE 0 END)/COUNT(*) AS icd9_dgns_4_avail_rate
FROM syn_cms_carrier_claims;

SELECT COUNT(*) FROM syn_cms_carrier_claims;
SELECT COUNT(icd9_dgns_cd_1) FROM syn_cms_carrier_claims; -- 94,860,876
SELECT COUNT(icd9_dgns_cd_2) FROM syn_cms_carrier_claims;

-- EXPLORE USE CASE SCENARIOS

-- generate list of attending HCPs treating patients with tuberous sclerosis by querying for outpatient patients with tuberous sclerosis, matching synthetic HCP IDs to actual HCP IDs in the NPI database
SELECT scoc.desynpuf_id, scoc.icd9_dgns_cd_1 AS first_diagnosis_code, scoc.at_physn_npi AS synthetic_npi_id, nn.npi AS real_npi_id, nn.prov_first_name, nn.prov_last_name, nn.health_prov_taxonomy_code_1, nn.practice_address_line_1, nn.practice_address_city, nn.practice_address_state, nn.practice_address_phone  
FROM syn_cms_outpat_claims scoc
LEFT JOIN npi.npi_npidata nn ON nn.npi = scoc.at_physn_npi 
WHERE scoc.icd9_dgns_cd_1 = "7595" OR scoc.icd9_dgns_cd_2 = "7595" OR scoc.icd9_dgns_cd_3 = "7595";
-- INITIAL FINDINGS: NPI IDs used in the DE-SynPUF data don't match NPI IDs from current NPI data - assuming DE-SynPUF IDs have been munged