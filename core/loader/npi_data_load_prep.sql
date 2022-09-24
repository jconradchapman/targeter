/*
NPI_DATA_LOAD_PREP.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 8.30.2022 modified
Script that prepares the npi database for the full monthly data update by backing up current npi database tables
*/
 
-- backup and drop npi_otherorgnames data tables
DROP TABLE npi_otherorgnames_backup;

CREATE TABLE npi_otherorgnames_backup LIKE npi_otherorgnames;
INSERT INTO npi_otherorgnames_backup SELECT * FROM npi_otherorgnames;

DROP TABLE npi_otherorgnames;

-- backup and drop npi_otherpraclocations data tables
DROP TABLE npi_otherpraclocations_backup;

CREATE TABLE npi_otherpraclocations_backup LIKE npi_otherpraclocations;
INSERT INTO npi_otherpraclocations_backup SELECT * FROM npi_otherpraclocations;

DROP TABLE npi_otherpraclocations;

-- backup and drop npi_endpoints data tables
DROP TABLE npi_endpoints_backup;

CREATE TABLE npi_endpoints_backup LIKE npi_endpoints;
INSERT INTO npi_endpoints_backup SELECT * FROM npi_endpoints;

DROP TABLE npi_endpoints;

-- backup and drop npi_npidata data tables
DROP TABLE npi_npidata_backup;

-- allow for large table creation. RUN THE NEXT TWO 'SET' STATEMENTS SEPARATELY!!
SET GLOBAL innodb_default_row_format='dynamic';
SET SESSION innodb_strict_mode=OFF;

CREATE TABLE npi_npidata_backup LIKE npi_npidata;
INSERT INTO npi_npidata_backup SELECT * FROM npi_npidata;

DROP TABLE npi_npidata;