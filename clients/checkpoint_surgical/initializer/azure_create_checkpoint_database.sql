/*
AZURE_CREATE_CHECKPOINT_DATABASE.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 6/20/23 modified:

Script to create client database and tables for Checkpoint Surgical on MS AZURE
*/

-- create database
CREATE DATABASE checkpoint;

-- create tables

-- create checkpoint_hcps_ortho_hand
 CREATE TABLE checkpoint_hcps_ortho_hand (
   hcp_pk INT AUTO_INCREMENT PRIMARY KEY,
   npi VARCHAR(10),
   last_name VARCHAR(20),
   first_name VARCHAR(20),
   primary_specialty VARCHAR(55),
   city VARCHAR(30),
   state VARCHAR(2),
   cbsa VARCHAR(55),	
   hcpcs_cpt_code VARCHAR(5),
   hcpcs_cpt_desc VARCHAR(25),
   total_proc_cnt VARCHAR(10),
   percent_total_procs VARCHAR(10),
   unique_patients_cnt VARCHAR(10),
   total_charges VARCHAR(10),
   percent_total_charges VARCHAR(10),
   avg_charge_per_proc VARCHAR(10));
   
SELECT * FROM checkpoint_hcps_ortho_hand choh;