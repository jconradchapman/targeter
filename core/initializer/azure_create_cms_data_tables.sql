/*
AZURE_CREATE_CMS_DATA_TABLES.SQL
MySQL 5.7.32 Database
Targeter - CMS DE-SynPUF DATA TABLES SCRIPT
Queries needed to create data tables 
jchapman - created: 4.15.2022 modified: 4.27.2023
*/

-- create table for beneficiaries
CREATE TABLE syn_cms_beneficiaries (
beneficiary_pk INT AUTO_INCREMENT PRIMARY KEY,
desynpuf_id varchar(100),
bene_birth_dt varchar(100),
bene_death_dt varchar(100),
bene_sex_ident_cd varchar(100),
bene_race_cd varchar(100),
bene_esrd_ind varchar(100),
sp_state_code varchar(100),
bene_county_cd varchar(100),
bene_hi_cvrage_tot_mons varchar(100),
bene_smi_cvrage_tot_mons varchar(100),
bene_hmo_cvrage_tot_mons varchar(100),
plan_cvrg_mos_num varchar(100),
sp_alzhdmta varchar(100),
sp_chf varchar(100),
sp_chrnkidn varchar(100),
sp_cncr varchar(100),
sp_copd varchar(100),
sp_depressn varchar(100),
sp_diabetes varchar(100),
sp_ischmcht varchar(100),
sp_osteoprs varchar(100),
sp_ra_oa varchar(100),
sp_strketia varchar(100),
medreimb_ip varchar(100),
benres_ip varchar(100),
pppymt_ip varchar(100),
medreimb_op varchar(100),
benres_op varchar(100),
pppymt_op varchar(100),
medreimb_car varchar(100),
benres_car varchar(100),
pppymt_car varchar(100));

/*
LOAD DATA INFILE '/Users/jchapman/Downloads/targeter_input_files/cms_desynpuf_files/sample1/DE1_0_2010_Beneficiary_Summary_File_Sample_1.csv' IGNORE INTO TABLE ts_cms_desynpuf_beneficiaries
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(desynpuf_id, bene_birth_dt, bene_death_dt, bene_sex_ident_cd, bene_race_cd, bene_esrd_ind, sp_state_code, bene_county_cd, bene_hi_cvrage_tot_mons, bene_smi_cvrage_tot_mons,
bene_hmo_cvrage_tot_mons, plan_cvrg_mos_num, sp_alzhdmta, sp_chf, sp_chrnkidn, sp_cncr, sp_copd, sp_depressn, sp_diabetes, sp_ischmcht, sp_osteoprs, sp_ra_oa, sp_strketia, medreimb_ip,
benres_ip, pppymt_ip, medreimb_op, benres_op, pppymt_op, medreimb_car, benres_car, pppymt_car);

SELECT * FROM syn_cms_beneficiaries;
*/

-- create table for inpatient_claims
CREATE TABLE syn_cms_inpat_claims (
inpat_claims_pk INT AUTO_INCREMENT PRIMARY KEY,
desynpuf_id varchar(100),
clm_id varchar(100),
segment varchar(100),
clm_from_dt varchar(100),
clm_thru_dt varchar(100),
prvdr_num varchar(100),
clm_pmt_amt varchar(100),
nch_prmry_pyr_clm_pd_amt varchar(100),
at_physn_npi int,
op_physn_npi int,
ot_physn_npi int,
clm_admsn_dt varchar(100),
admtng_icd9_dgns_cd varchar(100),
clm_pass_thru_per_diem_amt varchar(100),
nch_bene_ip_ddctbl_amt varchar(100),
nch_bene_pta_coinsrnc_lblty_am varchar(100),
nch_bene_blood_ddctbl_lblty_am varchar(100),
clm_utlztn_day_cnt varchar(100),
nch_bene_dschrg_dt varchar(100),
clm_drg_cd varchar(100),
icd9_dgns_cd_1 varchar(50),
icd9_dgns_cd_2 varchar(50),
icd9_dgns_cd_3 varchar(50),
icd9_dgns_cd_4 varchar(50),
icd9_dgns_cd_5 varchar(50),
icd9_dgns_cd_6 varchar(50),
icd9_dgns_cd_7 varchar(50),
icd9_dgns_cd_8 varchar(50),
icd9_dgns_cd_9 varchar(50),
icd9_dgns_cd_10 varchar(50),
icd9_prcdr_cd_1 varchar(50),
icd9_prcdr_cd_2 varchar(50),
icd9_prcdr_cd_3 varchar(50),
icd9_prcdr_cd_4 varchar(50),
icd9_prcdr_cd_5 varchar(50),
icd9_prcdr_cd_6 varchar(50),
hcpcs_cd_1 varchar(50),
hcpcs_cd_2 varchar(50),
hcpcs_cd_3 varchar(50),
hcpcs_cd_4 varchar(50),
hcpcs_cd_5 varchar(50),
hcpcs_cd_6 varchar(50),
hcpcs_cd_7 varchar(50),
hcpcs_cd_8 varchar(50),
hcpcs_cd_9 varchar(50),
hcpcs_cd_10 varchar(50),
hcpcs_cd_11 varchar(50),
hcpcs_cd_12 varchar(50),
hcpcs_cd_13 varchar(50),
hcpcs_cd_14 varchar(50),
hcpcs_cd_15 varchar(50),
hcpcs_cd_16 varchar(50),
hcpcs_cd_17 varchar(50),
hcpcs_cd_18 varchar(50),
hcpcs_cd_19 varchar(50),
hcpcs_cd_20 varchar(50),
hcpcs_cd_21 varchar(50),
hcpcs_cd_22 varchar(50),
hcpcs_cd_23 varchar(50),
hcpcs_cd_24 varchar(50),
hcpcs_cd_25 varchar(50),
hcpcs_cd_26 varchar(50),
hcpcs_cd_27 varchar(50),
hcpcs_cd_28 varchar(50),
hcpcs_cd_29 varchar(50),
hcpcs_cd_30 varchar(50),
hcpcs_cd_31 varchar(50),
hcpcs_cd_32 varchar(50),
hcpcs_cd_33 varchar(50),
hcpcs_cd_34 varchar(50),
hcpcs_cd_35 varchar(50),
hcpcs_cd_36 varchar(50),
hcpcs_cd_37 varchar(50),
hcpcs_cd_38 varchar(50),
hcpcs_cd_39 varchar(50),
hcpcs_cd_40 varchar(50),
hcpcs_cd_41 varchar(50),
hcpcs_cd_42 varchar(50),
hcpcs_cd_43 varchar(50),
hcpcs_cd_44 varchar(50),
hcpcs_cd_45 varchar(50));

/*
LOAD DATA INFILE '/Users/jchapman/Downloads/targeter_input_files/cms_desynpuf_files/sample1/DE1_0_2008_to_2010_Inpatient_Claims_Sample_1.csv' IGNORE INTO TABLE ts_cms_desynpuf_inpat_claims
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(desynpuf_id, clm_id, segment, clm_from_dt, clm_thru_dt, prvdr_num, clm_pmt_amt, nch_prmry_pyr_clm_pd_amt, at_physn_npi, op_physn_npi, ot_physn_npi,
clm_admsn_dt, admtng_icd9_dgns_cd, clm_pass_thru_per_diem_amt, nch_bene_ip_ddctbl_amt, nch_bene_pta_coinsrnc_lblty_am, nch_bene_blood_ddctbl_lblty_am, clm_utlztn_day_cnt,
nch_bene_dschrg_dt, clm_drg_cd, icd9_dgns_cd_1, icd9_dgns_cd_2, icd9_dgns_cd_3, icd9_dgns_cd_4, icd9_dgns_cd_5, icd9_dgns_cd_6, icd9_dgns_cd_7, icd9_dgns_cd_8, icd9_dgns_cd_9, 
icd9_dgns_cd_10, icd9_prcdr_cd_1, icd9_prcdr_cd_2, icd9_prcdr_cd_3, icd9_prcdr_cd_4, icd9_prcdr_cd_5, icd9_prcdr_cd_6, hcpcs_cd_1, hcpcs_cd_2, hcpcs_cd_3, hcpcs_cd_4, 
hcpcs_cd_5, hcpcs_cd_6, hcpcs_cd_7, hcpcs_cd_8, hcpcs_cd_9, hcpcs_cd_10, hcpcs_cd_11, hcpcs_cd_12, hcpcs_cd_13, hcpcs_cd_14, hcpcs_cd_15, hcpcs_cd_16, hcpcs_cd_17, hcpcs_cd_18, 
hcpcs_cd_19, hcpcs_cd_20, hcpcs_cd_21, hcpcs_cd_22, hcpcs_cd_23, hcpcs_cd_24, hcpcs_cd_25, hcpcs_cd_26, hcpcs_cd_27, hcpcs_cd_28, hcpcs_cd_29, hcpcs_cd_30, hcpcs_cd_31, 
hcpcs_cd_32, hcpcs_cd_33, hcpcs_cd_34, hcpcs_cd_35, hcpcs_cd_36, hcpcs_cd_37, hcpcs_cd_38, hcpcs_cd_39, hcpcs_cd_40, hcpcs_cd_41, hcpcs_cd_42, hcpcs_cd_43, hcpcs_cd_44, hcpcs_cd_45);

SELECT * FROM syn_cms_inpat_claims;
*/

-- create table for outpatient_claims
CREATE TABLE syn_cms_outpat_claims (
outpat_claims_pk INT AUTO_INCREMENT PRIMARY KEY,
desynpuf_id varchar(50),
clm_id varchar(50),
segment varchar(50),
clm_from_dt varchar(50),
clm_thru_dt varchar(50),
prvdr_num varchar(50),
clm_pmt_amt varchar(50),
nch_prmry_pyr_clm_pd_amt varchar(50),
at_physn_npi int,
op_physn_npi int,
ot_physn_npi int,
nch_bene_blood_ddctbl_lblty_am varchar(50),
icd9_dgns_cd_1 varchar(50),
icd9_dgns_cd_2 varchar(50),
icd9_dgns_cd_3 varchar(50),
icd9_dgns_cd_4 varchar(50),
icd9_dgns_cd_5 varchar(50),
icd9_dgns_cd_6 varchar(50),
icd9_dgns_cd_7 varchar(50),
icd9_dgns_cd_8 varchar(50),
icd9_dgns_cd_9 varchar(50),
icd9_dgns_cd_10 varchar(50),
icd9_prcdr_cd_1 varchar(50),
icd9_prcdr_cd_2 varchar(50),
icd9_prcdr_cd_3 varchar(50),
icd9_prcdr_cd_4 varchar(50),
icd9_prcdr_cd_5 varchar(50),
icd9_prcdr_cd_6 varchar(50),
nch_bene_ptb_ddctbl_amt varchar(50),
nch_bene_ptb_coinsrnc_amt varchar(50),
admtng_icd9_dgns_cd varchar(50),
hcpcs_cd_1 varchar(50),
hcpcs_cd_2 varchar(50),
hcpcs_cd_3 varchar(50),
hcpcs_cd_4 varchar(50),
hcpcs_cd_5 varchar(50),
hcpcs_cd_6 varchar(50),
hcpcs_cd_7 varchar(50),
hcpcs_cd_8 varchar(50),
hcpcs_cd_9 varchar(50),
hcpcs_cd_10 varchar(50),
hcpcs_cd_11 varchar(50),
hcpcs_cd_12 varchar(50),
hcpcs_cd_13 varchar(50),
hcpcs_cd_14 varchar(50),
hcpcs_cd_15 varchar(50),
hcpcs_cd_16 varchar(50),
hcpcs_cd_17 varchar(50),
hcpcs_cd_18 varchar(50),
hcpcs_cd_19 varchar(50),
hcpcs_cd_20 varchar(50),
hcpcs_cd_21 varchar(50),
hcpcs_cd_22 varchar(50),
hcpcs_cd_23 varchar(50),
hcpcs_cd_24 varchar(50),
hcpcs_cd_25 varchar(50),
hcpcs_cd_26 varchar(50),
hcpcs_cd_27 varchar(50),
hcpcs_cd_28 varchar(50),
hcpcs_cd_29 varchar(50),
hcpcs_cd_30 varchar(50),
hcpcs_cd_31 varchar(50),
hcpcs_cd_32 varchar(50),
hcpcs_cd_33 varchar(50),
hcpcs_cd_34 varchar(50),
hcpcs_cd_35 varchar(50),
hcpcs_cd_36 varchar(50),
hcpcs_cd_37 varchar(50),
hcpcs_cd_38 varchar(50),
hcpcs_cd_39 varchar(50),
hcpcs_cd_40 varchar(50),
hcpcs_cd_41 varchar(50),
hcpcs_cd_42 varchar(50),
hcpcs_cd_43 varchar(50),
hcpcs_cd_44 varchar(50),
hcpcs_cd_45 varchar(50));

/*
LOAD DATA INFILE '/Users/jchapman/Downloads/targeter_input_files/cms_desynpuf_files/sample1/DE1_0_2008_to_2010_Outpatient_Claims_Sample_1.csv' IGNORE INTO TABLE ts_cms_desynpuf_outpat_claims
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(desynpuf_id, clm_id, segment, clm_from_dt, clm_thru_dt, prvdr_num, clm_pmt_amt, nch_prmry_pyr_clm_pd_amt, at_physn_npi, op_physn_npi, ot_physn_npi,
nch_bene_blood_ddctbl_lblty_am, icd9_dgns_cd_1, icd9_dgns_cd_2, icd9_dgns_cd_3, icd9_dgns_cd_4, icd9_dgns_cd_5, icd9_dgns_cd_6, icd9_dgns_cd_7, icd9_dgns_cd_8,
icd9_dgns_cd_9, icd9_dgns_cd_10, icd9_prcdr_cd_1, icd9_prcdr_cd_2, icd9_prcdr_cd_3, icd9_prcdr_cd_4, icd9_prcdr_cd_5, icd9_prcdr_cd_6, nch_bene_ptb_ddctbl_amt,
nch_bene_ptb_coinsrnc_amt, admtng_icd9_dgns_cd, hcpcs_cd_1, hcpcs_cd_2, hcpcs_cd_3, hcpcs_cd_4, hcpcs_cd_5, hcpcs_cd_6, hcpcs_cd_7, hcpcs_cd_8, hcpcs_cd_9,
hcpcs_cd_10, hcpcs_cd_11, hcpcs_cd_12, hcpcs_cd_13, hcpcs_cd_14, hcpcs_cd_15, hcpcs_cd_16, hcpcs_cd_17, hcpcs_cd_18, hcpcs_cd_19, hcpcs_cd_20, hcpcs_cd_21,
hcpcs_cd_22, hcpcs_cd_23, hcpcs_cd_24, hcpcs_cd_25, hcpcs_cd_26, hcpcs_cd_27, hcpcs_cd_28, hcpcs_cd_29, hcpcs_cd_30, hcpcs_cd_31, hcpcs_cd_32, hcpcs_cd_33,
hcpcs_cd_34, hcpcs_cd_35, hcpcs_cd_36, hcpcs_cd_37, hcpcs_cd_38, hcpcs_cd_39, hcpcs_cd_40, hcpcs_cd_41, hcpcs_cd_42, hcpcs_cd_43, hcpcs_cd_44, hcpcs_cd_45);

SELECT * FROM syn_cms_outpat_claims;
*/

-- create table for carrier_claims
CREATE TABLE syn_cms_carrier_claims (
carrier_claims_pk INT AUTO_INCREMENT PRIMARY KEY,
desynpuf_id varchar(50),
clm_id varchar(50),
clm_from_dt varchar(50),
clm_thru_dt varchar(50),
icd9_dgns_cd_1 varchar(50),
icd9_dgns_cd_2 varchar(50),
icd9_dgns_cd_3 varchar(50),
icd9_dgns_cd_4 varchar(50),
icd9_dgns_cd_5 varchar(50),
icd9_dgns_cd_6 varchar(50),
icd9_dgns_cd_7 varchar(50),
icd9_dgns_cd_8 varchar(50),
prf_physn_npi_1 int,
prf_physn_npi_2 int,
prf_physn_npi_3 int,
prf_physn_npi_4 int,
prf_physn_npi_5 int,
prf_physn_npi_6 int,
prf_physn_npi_7 int,
prf_physn_npi_8 int,
prf_physn_npi_9 int,
prf_physn_npi_10 int,
prf_physn_npi_11 int,
prf_physn_npi_12 int,
prf_physn_npi_13 int,
hcpcs_cd_1 varchar(50),
hcpcs_cd_2 varchar(50),
hcpcs_cd_3 varchar(50),
hcpcs_cd_4 varchar(50),
hcpcs_cd_5 varchar(50),
hcpcs_cd_6 varchar(50),
hcpcs_cd_7 varchar(50),
hcpcs_cd_8 varchar(50),
hcpcs_cd_9 varchar(50),
hcpcs_cd_10 varchar(50),
hcpcs_cd_11 varchar(50),
hcpcs_cd_12 varchar(50),
hcpcs_cd_13 varchar(50),
line_icd9_dgns_cd_1 varchar(50), 
line_icd9_dgns_cd_2 varchar(50),
line_icd9_dgns_cd_3 varchar(50),
line_icd9_dgns_cd_4 varchar(50),
line_icd9_dgns_cd_5 varchar(50),
line_icd9_dgns_cd_6 varchar(50),
line_icd9_dgns_cd_7 varchar(50),
line_icd9_dgns_cd_8 varchar(50),
line_icd9_dgns_cd_9 varchar(50),
line_icd9_dgns_cd_10 varchar(50),
line_icd9_dgns_cd_11 varchar(50),
line_icd9_dgns_cd_12 varchar(50),
line_icd9_dgns_cd_13 varchar(50));

/*
-- only load some fields, ignore those not needed
LOAD DATA INFILE '/Users/jchapman/Downloads/targeter_input_files/cms_desynpuf_files/sample1/DE1_0_2008_to_2010_Carrier_Claims_Sample_1B.csv' IGNORE INTO TABLE ts_cms_desynpuf_carrier_claims
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(desynpuf_id, clm_id, clm_from_dt, clm_thru_dt, icd9_dgns_cd_1, icd9_dgns_cd_2, icd9_dgns_cd_3, icd9_dgns_cd_4, icd9_dgns_cd_5, icd9_dgns_cd_6, icd9_dgns_cd_7, icd9_dgns_cd_8, prf_physn_npi_1,
prf_physn_npi_2, prf_physn_npi_3, prf_physn_npi_4, prf_physn_npi_5, prf_physn_npi_6, prf_physn_npi_7, prf_physn_npi_8, prf_physn_npi_9, prf_physn_npi_10, prf_physn_npi_11, prf_physn_npi_12,
prf_physn_npi_13, @col26, @col27, @col28, @col29, @col30, @col31, @col32, @col33, @col34, @col35, @col36, @col37, @col38, hcpcs_cd_1, hcpcs_cd_2, hcpcs_cd_3, hcpcs_cd_4, hcpcs_cd_5,
hcpcs_cd_6, hcpcs_cd_7, hcpcs_cd_8, hcpcs_cd_9, hcpcs_cd_10, hcpcs_cd_11, hcpcs_cd_12, hcpcs_cd_13, @col52, @col53, @col54, @col55, @col56, @col57, @col58, @col59, @col60, @col61, @col62, @col63,
@col64, @col65, @col66, @col67, @col68, @col69, @col70, @col71, @col72, @col73, @col74, @col75, @col76, @col77, @col78, @col79, @col80, @col81, @col82, @col83, @col84, @col85, @col86, @col87,
@col88, @col89, @col90, @col91, @col92, @col93, @col94, @col95, @col96, @col97, @col98, @col99, @col100, @col101, @col102, @col103, @col104, @col105, @col106, @col107, @col108, @col109, @col110,
@col111, @col112, @col113, @col114, @col115, @col116, @col117, @col118, @col119, @col120, @col121, @col122, @col123, @col124, @col125, @col126, @col127, @col128, @col129, line_icd9_dgns_cd_1,
line_icd9_dgns_cd_2, line_icd9_dgns_cd_3, line_icd9_dgns_cd_4, line_icd9_dgns_cd_5, line_icd9_dgns_cd_6, line_icd9_dgns_cd_7, line_icd9_dgns_cd_8, line_icd9_dgns_cd_9, line_icd9_dgns_cd_10,
line_icd9_dgns_cd_11, line_icd9_dgns_cd_12, line_icd9_dgns_cd_13);

SELECT * FROM syn_cms_carrier_claims;
*/

-- create table for prescriptions
CREATE TABLE syn_cms_prescriptions (
prescribe_events_pk INT AUTO_INCREMENT PRIMARY KEY,
desynpuf_id varchar(50),
pde_id varchar(50),
srvc_dt varchar(50),
prod_srvc_id varchar(50),
qty_dspnsd_num varchar(50),
days_suply_num varchar(50),
ptnt_pay_amt varchar(50),
tot_rx_cst_amt varchar(50));

/*
LOAD DATA INFILE '/Users/jchapman/Downloads/targeter_input_files/cms_desynpuf_files/sample1/DE1_0_2008_to_2010_Prescription_Drug_Events_Sample_1.csv' IGNORE INTO TABLE ts_cms_desynpuf_prescrib_events
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(desynpuf_id, pde_id, srvc_dt, prod_srvc_id, qty_dspnsd_num, days_suply_num, ptnt_pay_amt, tot_rx_cst_amt);

SELECT * FROM syn_cms_prescriptions;
*/
