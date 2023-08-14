/*
JPA_DATA_EXPLORATION_STATEMENTS.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 08.10.2023 modified:
Script contains data analysis statements for JPA contact data
*/

-- EXPLORE DATA

-- inspect data fields from jpa db tables
SELECT * FROM jpa_hubspot_contacts LIMIT 250;

SELECT * FROM jpa_deltek_contacts jdc  LIMIT 250;

-- run counts on jpa db tables
SELECT COUNT(*) FROM jpa_hubspot_contacts; -- 27,786 | 8/10/2023

SELECT COUNT(*) FROM jpa_deltek_contacts; -- 238 | 8/10/2023

-- count distinct email addresses
SELECT COUNT(DISTINCT contact_email) FROM jpa_hubspot_contacts; -- 27,775

SELECT COUNT(DISTINCT contact_email) FROM jpa_deltek_contacts; -- 223

-- run counts by industry
SELECT company_industry, COUNT(*) AS frequency FROM jpa_hubspot_contacts GROUP BY company_industry ORDER BY frequency DESC;
-- top 10: organizations, hospitals and health care, manufacturing & business services, manufacturing, biotechnology, pharmaceuticals, medical devices & equipment, insurance, medical devices, business services

SELECT company_industry, COUNT(*) AS frequency FROM jpa_deltek_contacts GROUP BY company_industry ORDER BY frequency DESC; 
-- company industry not provided, all null values

-- run counts by title
SELECT contact_title, COUNT(*) AS frequency FROM jpa_hubspot_contacts GROUP BY contact_title ORDER BY frequency DESC;
-- 0 contacts have titles

SELECT contact_title, COUNT(*) AS frequency FROM jpa_deltek_contacts GROUP BY contact_title ORDER BY frequency DESC;
-- 59 out of 238 contacts have titles

-- calculate the extent to which data in jpa_hubspot_contacts are missing
SELECT 
SUM(CASE WHEN contact_fname IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_fname_missing,
SUM(CASE WHEN contact_lname IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_lname_missing,
SUM(CASE WHEN contact_title IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_title_missing,
SUM(CASE WHEN company_name IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS company_name_missing,
SUM(CASE WHEN company_industry IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS company_industry_missing,
SUM(CASE WHEN contact_email IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_email_missing,
SUM(CASE WHEN contact_phone IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_phone_missing,
SUM(CASE WHEN contact_address IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_address_missing,
SUM(CASE WHEN contact_city IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_city_missing,
SUM(CASE WHEN contact_state IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_state_missing,
SUM(CASE WHEN contact_postal_code IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_postal_code_missing
FROM jpa_hubspot_contacts;

-- calculate the extent to which data in jpa_deltek_contacts are missing
SELECT 
SUM(CASE WHEN contact_fname IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_fname_missing,
SUM(CASE WHEN contact_lname IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_lname_missing,
SUM(CASE WHEN contact_title IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_title_missing,
SUM(CASE WHEN company_name IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS company_name_missing,
SUM(CASE WHEN company_industry IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS company_industry_missing,
SUM(CASE WHEN contact_email IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_email_missing,
SUM(CASE WHEN contact_phone IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_phone_missing,
SUM(CASE WHEN contact_address IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_address_missing,
SUM(CASE WHEN contact_city IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_city_missing,
SUM(CASE WHEN contact_state IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_state_missing,
SUM(CASE WHEN contact_postal_code IS NULL THEN 1 ELSE 0 END)/COUNT(*) AS contact_postal_code_missing
FROM jpa_deltek_contacts;
