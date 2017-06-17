CREATE DATABASE campaign_expenditures;
USE `campaign_expenditures`;

# create the filing table
CREATE TABLE filings (
    filing_id INT,
    fec_committee_id VARCHAR(255),
    committee_name VARCHAR(255),
    PRIMARY KEY (filing_id)
);

# populate the filing table
LOAD DATA LOCAL INFILE '../../data/filings.csv'
INTO TABLE filings
FIELDS TERMINATED BY ','  # comma delimited
ENCLOSED BY '"'           # allow commas within double quotes
LINES TERMINATED BY '\r'  # carriage return, not newline
IGNORE 1 ROWS;            # ignore the header

# create the expenditures table
CREATE TABLE expenditures (
    exp_id INT NOT NULL AUTO_INCREMENT,
    filing_id INT,
    recip_name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    date DATE,
    amount FLOAT,
    purpose VARCHAR(255),
    PRIMARY KEY (exp_id)
);

# populate expenditure table
LOAD DATA LOCAL INFILE '../../data/expenditures.csv'
INTO TABLE expenditures
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(filing_id, recip_name, address, city, state, date, amount, purpose);

# create a read only user
CREATE USER 'reader'@'localhost';
GRANT SELECT ON campaign_expenditures FROM 'reader'@'localhost';
FLUSH PRIVILEGES;
