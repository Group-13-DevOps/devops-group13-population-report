-- 00-create-db.sql
CREATE DATABASE IF NOT EXISTS world-db
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

-- Ensure we use the target DB for any subsequent scripts
USE world-db;
