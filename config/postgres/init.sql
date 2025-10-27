-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "hstore";
CREATE EXTENSION IF NOT EXISTS "postgis";

-- Create schema for SIEG-L
CREATE SCHEMA IF NOT EXISTS siegl;

-- Set search path
ALTER DATABASE siegl_db SET search_path TO siegl, public;

-- Grant privileges
GRANT ALL PRIVILEGES ON SCHEMA siegl TO siegl_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA siegl TO siegl_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA siegl TO siegl_user;