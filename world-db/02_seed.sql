-- 01-seed.sql
USE world-db;

CREATE TABLE IF NOT EXISTS country (
  Code CHAR(3) PRIMARY KEY,
  Name VARCHAR(52) NOT NULL
);

CREATE TABLE IF NOT EXISTS city (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(35) NOT NULL,
  CountryCode CHAR(3) NOT NULL,
  Population INT NOT NULL DEFAULT 0,
  FOREIGN KEY (CountryCode) REFERENCES country(Code)
);

INSERT INTO country (Code, Name) VALUES
  ('MMR', 'Myanmar'),
  ('FRA', 'France'),
  ('JPN', 'Japan')
ON DUPLICATE KEY UPDATE Name = VALUES(Name);

INSERT INTO city (Name, CountryCode, Population) VALUES
  ('Yangon', 'MMR', 5000000),
  ('Mandalay', 'MMR', 1200000),
  ('Paris', 'FRA', 2148000),
  ('Tokyo', 'JPN', 13960000);
