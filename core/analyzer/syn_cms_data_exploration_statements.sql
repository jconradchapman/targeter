/*
SYN_CMS_DATA_EXPLORATION_STATEMENTS.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 05.11.2023 modified: 
Script contains data analysis statements for SYN_CMS data
*/

-- BASIC DATA EXPLORATION

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

-- PRACTICAL SCENARIOS

-- generate list of attending HCPs treating patients with tuberous sclerosis by querying for outpatient patients with tuberous sclerosis, matching synthetic HCP IDs to actual HCP IDs in the NPI database
SELECT scoc.desynpuf_id, scoc.icd9_dgns_cd_1 AS first_diagnosis_code, scoc.at_physn_npi AS synthetic_npi_id, nn.npi AS real_npi_id, nn.prov_first_name, nn.prov_last_name, nn.health_prov_taxonomy_code_1, nn.practice_address_line_1, nn.practice_address_city, nn.practice_address_state, nn.practice_address_phone  
FROM syn_cms_outpat_claims scoc
LEFT JOIN npi.npi_npidata nn ON nn.npi = scoc.at_physn_npi 
WHERE scoc.icd9_dgns_cd_1 = "7595" OR scoc.icd9_dgns_cd_2 = "7595" OR scoc.icd9_dgns_cd_3 = "7595";

-- INITIAL FINDING: NPI IDs used in the DE-SynPUF data don't match NPI IDs from current NPI data - assume those IDs have been altered

-- klk