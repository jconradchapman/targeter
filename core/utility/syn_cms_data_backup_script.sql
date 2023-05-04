/*
SYN_CMS_DATA_BACKUP_SCRIPT.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 05.03.2023 modified: 
Script that backups syn_cms tables
*/

-- drop previous backups and create new data backups from latest data tables

-- syn_cms_beneficiaries
DROP TABLE IF EXISTS syn_cms_beneficiaries_backup;

CREATE TABLE syn_cms_beneficiaries_backup LIKE syn_cms_beneficiaries;
INSERT INTO syn_cms_beneficiaries_backup SELECT * FROM syn_cms_beneficiaries;

-- syn_cms_carrier_claims
DROP TABLE IF EXISTS syn_cms_carrier_claims_backup;

CREATE TABLE syn_cms_carrier_claims_backup LIKE syn_cms_carrier_claims;
INSERT INTO syn_cms_carrier_claims_backup SELECT * FROM syn_cms_carrier_claims;

-- syn_cms_inpat_claims
DROP TABLE IF EXISTS syn_cms_inpat_claims_backup;

CREATE TABLE syn_cms_inpat_claims_backup LIKE syn_cms_inpat_claims;
INSERT INTO syn_cms_inpat_claims_backup SELECT * FROM syn_cms_inpat_claims;

-- syn_cms_outpat_claims
DROP TABLE IF EXISTS syn_cms_outpat_claims_backup;

CREATE TABLE syn_cms_outpat_claims_backup LIKE syn_cms_outpat_claims;
INSERT INTO syn_cms_outpat_claims_backup SELECT * FROM syn_cms_outpat_claims;

-- syn_cms_prescriptions
DROP TABLE IF EXISTS syn_cms_prescriptions_backup;

CREATE TABLE syn_cms_prescriptions_backup LIKE syn_cms_prescriptions;
INSERT INTO syn_cms_prescriptions_backup SELECT * FROM syn_cms_prescriptions;