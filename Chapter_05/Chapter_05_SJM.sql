CREATE TABLE us_counties_pop_est_2019 (
    state_fips text,                         -- State FIPS code
    county_fips text,                        -- County FIPS code
    region smallint,                         -- Region
    state_name text,                         -- State name	
    county_name text,                        -- County name
    area_land bigint,                        -- Area (Land) in square meters
    area_water bigint,                       -- Area (Water) in square meters
    internal_point_lat numeric(10,7),        -- Internal point (latitude)
    internal_point_lon numeric(10,7),        -- Internal point (longitude)
    pop_est_2018 integer,                    -- 2018-07-01 resident total population estimate
    pop_est_2019 integer,                    -- 2019-07-01 resident total population estimate
    births_2019 integer,                     -- Births from 2018-07-01 to 2019-06-30
    deaths_2019 integer,                     -- Deaths from 2018-07-01 to 2019-06-30
    international_migr_2019 integer,         -- Net international migration from 2018-07-01 to 2019-06-30
    domestic_migr_2019 integer,              -- Net domestic migration from 2018-07-01 to 2019-06-30
    residual_2019 integer,                   -- Residual for 2018-07-01 to 2019-06-30
    CONSTRAINT counties_2019_key PRIMARY KEY (state_fips, county_fips)	
);

SELECT * FROM us_counties_pop_est_2019;

COPY us_counties_pop_est_2019
FROM 'C:\Users\sjmat\GitHub\practical-sql-2\Chapter_05\us_counties_pop_est_2019.csv'
WITH (FORMAT CSV, HEADER);

-- Checking the data

SELECT * FROM us_counties_pop_est_2019;

SELECT county_name, state_name, area_land
FROM us_counties_pop_est_2019
ORDER BY area_land DESC
LIMIT 3;

SELECT county_name, state_name, internal_point_lat, internal_point_lon
FROM us_counties_pop_est_2019
ORDER BY internal_point_lon DESC
LIMIT 5;

-- Try It Yourself
-- 1.
COPY movie_db
FROM 'path\to\movie\file'
WITH (FORMAT CSV, HEADER, DELIMITER ':', QUOTE '#')

-- 2.
COPY (
    SELECT county_name, state_name, births_2019
    FROM us_counties_pop_est_2019
    ORDER BY births_2019 DESC
    LIMIT 20
)
TO 'path\to\export\file'
WITH (FORMAT CSV, HEADER);

-- 3.
-- use data type numeric(8,3) i.e. 8 digits, 3 after the decimal rather than numeric(3,8)