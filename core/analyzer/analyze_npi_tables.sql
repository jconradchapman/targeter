/*
ANALYZE_NPI_TABLES.SQL
Targeter v1
MySQL 5.7.32 Database
jchapman - created: 3.18.2022 modified: 3.19.2022
Script that creates npi data tables and loads data from .csv files
*/

/*
-- create process log table
CREATE TABLE npi_process_log (
process_log_id INT AUTO_INCREMENT PRIMARY KEY,
update_month VARCHAR(20),
update_year VARCHAR(20),
update_run_date DATETIME,
npidata_row_count INT,
npidata_npi_count INT,
npidata_npi_distinct_count INT,
otherorgnames_row_count INT,
otherorgnames_npi_count INT,
otherorgnames_npi_distinct_count INT,
otherpraclocations_row_count INT,
otherpraclocations_npi_count INT,
otherpraclocations_npi_distinct_count INT,
endpoints_row_count INT,
endpoints_npi_count INT,
endpoints_npi_distinct_count INT);
*/

-- set variables
SET @update_mo = MONTHNAME(NOW());
SET @update_yr = YEAR(NOW());
SET @run_date = NOW();
SET @npidata_row_cnt = (SELECT COUNT(*) FROM npi_npidata);
SET @npidata_npi_cnt = (SELECT COUNT(npi) FROM npi_npidata);
SET @npidata_npi_distinct_cnt = (SELECT COUNT(DISTINCT npi) FROM npi_npidata);
SET @otherorgnames_row_cnt = (SELECT COUNT(*) FROM npi_otherorgnames);
SET @otherorgnames_npi_cnt = (SELECT COUNT(npi) FROM npi_otherorgnames);
SET @otherorgnames_npi_distinct_cnt = (SELECT COUNT(DISTINCT npi) FROM npi_otherorgnames);
SET @otherpraclocations_row_cnt = (SELECT COUNT(*) FROM npi_otherpraclocations);
SET @otherpraclocations_npi_cnt = (SELECT COUNT(npi) FROM npi_otherpraclocations);
SET @otherpraclocations_npi_distinct_cnt = (SELECT COUNT(DISTINCT npi) FROM npi_otherpraclocations);
SET @endpoints_row_cnt = (SELECT COUNT(*) FROM npi_endpoints);
SET @endpoints_npi_cnt = (SELECT COUNT(npi) FROM npi_endpoints);
SET @endpoints_npi_distinct_cnt = (SELECT COUNT(DISTINCT npi) FROM npi_endpoints);

INSERT INTO npi_process_log (update_month, update_year, update_run_date, npidata_row_count, npidata_npi_count, npidata_npi_distinct_count, otherorgnames_row_count, otherorgnames_npi_count, otherorgnames_npi_distinct_count,
otherpraclocations_row_count, otherpraclocations_npi_count, otherpraclocations_npi_distinct_count, endpoints_row_count, endpoints_npi_count, endpoints_npi_distinct_count)
VALUES (@update_mo, @update_yr, @run_date, @npidata_row_cnt, @npidata_npi_cnt, @npidata_npi_distinct_cnt, @otherorgnames_row_cnt, @otherorgnames_npi_cnt, @otherorgnames_npi_distinct_cnt, @otherpraclocations_row_cnt,
@otherpraclocations_npi_cnt, @otherpraclocations_npi_distinct_cnt, @endpoints_row_cnt, @endpoints_npi_cnt, @endpoints_npi_distinct_cnt);

SELECT * FROM npi_process_log;