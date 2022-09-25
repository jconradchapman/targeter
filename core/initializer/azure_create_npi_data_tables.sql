/*
AZURE_CREATE_NPI_DATA_TABLES.SQL
Targeter v
MySQL 5.7.32 Database
jchapman - created: 9/26/22 modified:

Script to create tables for npi data on MS AZURE
*/

-- npi.npi_npidata definition
CREATE TABLE `npi_npidata` (
  `npidata_id` int(11) NOT NULL AUTO_INCREMENT,
  `npi` int(11) DEFAULT NULL,
  `entity_type_code` varchar(100) DEFAULT NULL,
  `replacement_npi` varchar(100) DEFAULT NULL,
  `employ_id_nbr` varchar(100) DEFAULT NULL,
  `prov_org_name` varchar(100) DEFAULT NULL,
  `prov_last_name` varchar(100) DEFAULT NULL,
  `prov_first_name` varchar(100) DEFAULT NULL,
  `prov_middle_name` varchar(100) DEFAULT NULL,
  `prov_name_prefix` varchar(100) DEFAULT NULL,
  `prov_name_suffix` varchar(100) DEFAULT NULL,
  `prov_cred_text` varchar(100) DEFAULT NULL,
  `mailing_address_line_1` varchar(100) DEFAULT NULL,
  `mailing_address_line_2` varchar(100) DEFAULT NULL,
  `mailing_address_city` varchar(100) DEFAULT NULL,
  `mailing_address_state` varchar(100) DEFAULT NULL,
  `mailing_address_zip` varchar(100) DEFAULT NULL,
  `mailing_address_country` varchar(100) DEFAULT NULL,
  `mailing_address_phone` varchar(100) DEFAULT NULL,
  `mailing_address_fax` varchar(100) DEFAULT NULL,
  `practice_address_line_1` varchar(100) DEFAULT NULL,
  `practice_address_line_2` varchar(100) DEFAULT NULL,
  `practice_address_city` varchar(100) DEFAULT NULL,
  `practice_address_state` varchar(100) DEFAULT NULL,
  `practice_address_zip` varchar(100) DEFAULT NULL,
  `practice_address_country` varchar(100) DEFAULT NULL,
  `practice_address_phone` varchar(100) DEFAULT NULL,
  `practice_address_fax` varchar(100) DEFAULT NULL,
  `last_update_date` varchar(100) DEFAULT NULL,
  `npi_deactivation_reason_code` varchar(100) DEFAULT NULL,
  `npi_deactivation_date` varchar(100) DEFAULT NULL,
  `npi_reactivation_date` varchar(100) DEFAULT NULL,
  `prov_gender_code` varchar(100) DEFAULT NULL,
  `authorized_official_title` varchar(100) DEFAULT NULL,
  `authorized_official_phone_nbr` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_1` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_2` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_3` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_4` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_5` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_6` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_7` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_8` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_9` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_10` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_11` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_12` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_13` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_14` varchar(100) DEFAULT NULL,
  `health_prov_taxonomy_code_15` varchar(100) DEFAULT NULL,
  `sole_proprietor` varchar(100) DEFAULT NULL,
  `org_subpart` varchar(100) DEFAULT NULL,
  `cert_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`npidata_id`));

-- npi.npi_otherorgnames definition
CREATE TABLE `npi_otherorgnames` (
  `othername_id` int(11) NOT NULL AUTO_INCREMENT,
  `npi` int(11) DEFAULT NULL,
  `prov_othr_org_name` varchar(120) DEFAULT NULL,
  `prov_othr_org_name_type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`othername_id`));

-- npi.npi_otherpraclocations definition
CREATE TABLE `npi_otherpraclocations` (
  `other_prac_loc_id` int(11) NOT NULL AUTO_INCREMENT,
  `npi` int(11) DEFAULT NULL,
  `address_line_1` varchar(55) DEFAULT NULL,
  `address_line_2` varchar(55) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `telephone_nbr` varchar(20) DEFAULT NULL,
  `telephone_ext` varchar(5) DEFAULT NULL,
  `fax_nbr` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`other_prac_loc_id`));

-- npi.npi_endpoints definition
CREATE TABLE `npi_endpoints` (
  `endpoint_id` int(11) NOT NULL AUTO_INCREMENT,
  `npi` int(11) DEFAULT NULL,
  `endpoint_type` varchar(50) DEFAULT NULL,
  `endpoint_type_desc` varchar(255) DEFAULT NULL,
  `endpoint` varchar(1000) DEFAULT NULL,
  `affiliation` varchar(1) DEFAULT NULL,
  `endpoint_desc` varchar(1000) DEFAULT NULL,
  `affiliation_legal_bus_name` varchar(70) DEFAULT NULL,
  `use_code` varchar(25) DEFAULT NULL,
  `use_desc` varchar(100) DEFAULT NULL,
  `other_use_desc` varchar(200) DEFAULT NULL,
  `content_type` varchar(25) DEFAULT NULL,
  `content_desc` varchar(100) DEFAULT NULL,
  `other_content_desc` varchar(200) DEFAULT NULL,
  `affiliation_address_line_1` varchar(55) DEFAULT NULL,
  `affiliation_address_line_2` varchar(55) DEFAULT NULL,
  `affiliation_address_city` varchar(40) DEFAULT NULL,
  `affiliation_address_state` varchar(40) DEFAULT NULL,
  `affiliation_address_country` varchar(2) DEFAULT NULL,
  `affiliation_address_postal_code` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`endpoint_id`));