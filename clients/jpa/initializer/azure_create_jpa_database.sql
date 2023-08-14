/*
AZURE_CREATE_JPA_DATABASE.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 8/8/23 modified:

Script to create contacts database and tables for JPA Health on MS AZURE
*/

-- create database
CREATE DATABASE jpa;

-- create tables

-- create jpa_hubspot_contacts
 CREATE TABLE jpa_hubspot_contacts (
   hcontact_pk INT AUTO_INCREMENT PRIMARY KEY,
   source_rec_id VARCHAR(10),
   contact_fname VARCHAR(25),
   contact_lname VARCHAR(50),
   contact_title VARCHAR(75),
   company_name VARCHAR(100),
   company_industry VARCHAR(100),
   contact_email VARCHAR(100),	
   contact_phone VARCHAR(15),
   contact_address VARCHAR(75),
   contact_city VARCHAR(50),
   contact_state VARCHAR(2),
   contact_postal_code VARCHAR(10),
   contact_country_region VARCHAR(50),
   became_lead_date VARCHAR(25),
   contact_unworked VARCHAR(5),
   became_cust_date VARCHAR(25),
   ip_country VARCHAR(25),
   ip_state_region_code VARCHAR(5),
   ip_state_region VARCHAR(25),
   ip_timezone VARCHAR(50));
 
-- create jpa_deltek_contacts
 CREATE TABLE jpa_deltek_contacts (
   dcontact_pk INT AUTO_INCREMENT PRIMARY KEY,
   source_rec_id VARCHAR(10),
   contact_fname VARCHAR(25),
   contact_lname VARCHAR(50),
   contact_title VARCHAR(75),
   company_name VARCHAR(100),
   company_industry VARCHAR(100),
   contact_email VARCHAR(100),	
   contact_phone VARCHAR(15),
   contact_address VARCHAR(75),
   contact_city VARCHAR(50),
   contact_state VARCHAR(2),
   contact_postal_code VARCHAR(10),
   contact_country_region VARCHAR(50),
   became_lead_date VARCHAR(25),
   contact_unworked VARCHAR(5),
   became_cust_date VARCHAR(25),
   ip_country VARCHAR(25),
   ip_state_region_code VARCHAR(5),
   ip_state_region VARCHAR(25),
   ip_timezone VARCHAR(50));

  