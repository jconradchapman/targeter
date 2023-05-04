/*
SYN_CMS_DATA_RESTORE_SCRIPT.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 05.03.2023 modified: 
Script that restores syn_cms tables from backups
*/

-- drop primary syn_cms tables and restore from data backups

-- syn_cms_beneficiaries
DROP TABLE IF EXISTS syn_cms_beneficiaries;

CREATE TABLE syn_cms_beneficiaries LIKE syn_cms_beneficiaries_backup;
INSERT INTO syn_cms_beneficiaries SELECT * FROM syn_cms_beneficiaries_backup;

-- syn_cms_carrier_claims
DROP TABLE IF EXISTS syn_cms_carrier_claims;

CREATE TABLE syn_cms_carrier_claims LIKE syn_cms_carrier_claims_backup;
INSERT INTO syn_cms_carrier_claims SELECT * FROM syn_cms_carrier_claims_backup;

-- syn_cms_inpat_claims
DROP TABLE IF EXISTS syn_cms_inpat_claims;

CREATE TABLE syn_cms_inpat_claims LIKE syn_cms_inpat_claims_backup;
INSERT INTO syn_cms_inpat_claims SELECT * FROM syn_cms_inpat_claims_backup;

-- syn_cms_outpat_claims
DROP TABLE IF EXISTS syn_cms_outpat_claims;

CREATE TABLE syn_cms_outpat_claims LIKE syn_cms_outpat_claims_backup;
INSERT INTO syn_cms_outpat_claims SELECT * FROM syn_cms_outpat_claims_backup;

-- syn_cms_prescriptions
DROP TABLE IF EXISTS syn_cms_prescriptions;

CREATE TABLE syn_cms_prescriptions LIKE syn_cms_prescriptions_backup;
INSERT INTO syn_cms_prescriptions SELECT * FROM syn_cms_prescriptions_backup;