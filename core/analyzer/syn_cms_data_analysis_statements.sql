/*
SYN_CMS_DATA_ANALYSIS_STATEMENTS.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 05.11.2023 modified: 
Script contains data analysis statements for SYN_CMS data
*/

-- inspects data fields from syn_cms db tables

SELECT * FROM syn_cms_beneficiaries LIMIT 250;

SELECT * FROM syn_cms_carrier_claims LIMIT 250;

SELECT * FROM syn_cms_inpat_claims LIMIT 250;

SELECT * FROM syn_cms_outpat_claims LIMIT 250;

SELECT * FROM syn_cms_prescriptions LIMIT 250;