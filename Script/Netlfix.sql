-- staging.netflix_10m definition

CREATE TABLE `staging`.`netflix_10m` (
  `id` bigint(20) NULL,
  `age` bigint(20) NULL,
  `workclass` text NULL,
  `fnlwgt` bigint(20) NULL,
  `education` text NULL,
  `education_num` bigint(20) NULL,
  `marital_status` text NULL,
  `occupation` text NULL,
  `relationship` text NULL,
  `race` text NULL,
  `sex` text NULL,
  `capital_gain` bigint(20) NULL,
  `capital_loss` bigint(20) NULL,
  `hours_per_week` bigint(20) NULL,
  `native_country` text NULL,
  `income` text NULL
) ENGINE=OLAP
DUPLICATE KEY(`id`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`id`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);

--check row data

wc -l /home/administrator/application/sampleData/netflix10m.txt

10000000


-- bulk insert

curl --location-trusted -u root:"" -H "Expect:100-continue" -H "column_separator:,"  -H "columns:id,age,workclass,fnlwgt,education,education_num,marital_status,occupation,relationship,race,sex,capital_gain,capital_loss,hours_per_week,native_country,income" -T /home/administrator/application/sampleData/netflix10m.txt -H "max_filter_ratio:0.1"  -XPUT http://103.82.93.55:8030/api/staging/netflix_10m_test/_stream_load


-- query test

WITH cte_age_demographics AS (
    SELECT 
        CASE 
            WHEN age < 20 THEN 'Teen'
            WHEN age BETWEEN 20 AND 29 THEN '20s'
            WHEN age BETWEEN 30 AND 39 THEN '30s'
            WHEN age BETWEEN 40 AND 49 THEN '40s'
            WHEN age BETWEEN 50 AND 59 THEN '50s'
            ELSE '60+'
        END AS age_group,
        COUNT(*) AS population_count,
        AVG(hours_per_week) AS avg_hours_per_week
    FROM staging.netflix_10m
    GROUP BY 
        CASE 
            WHEN age < 20 THEN 'Teen'
            WHEN age BETWEEN 20 AND 29 THEN '20s'
            WHEN age BETWEEN 30 AND 39 THEN '30s'
            WHEN age BETWEEN 40 AND 49 THEN '40s'
            WHEN age BETWEEN 50 AND 59 THEN '50s'
            ELSE '60+'
        END
),
cte_education_analysis AS (
    SELECT 
        education,
        COUNT(*) AS total_population,
        AVG(age) AS avg_age,
        AVG(hours_per_week) AS avg_hours_per_week
    FROM staging.netflix_10m
    GROUP BY education
),
cte_gender_distribution AS (
    SELECT 
        sex,
        COUNT(*) AS population_count,
        AVG(age) AS avg_age,
        AVG(hours_per_week) AS avg_hours_per_week
    FROM staging.netflix_10m
    GROUP BY sex
),
cte_country_distribution AS (
    SELECT 
        native_country,
        COUNT(*) AS population_count,
        AVG(age) AS avg_age,
        AVG(hours_per_week) AS avg_hours_per_week
    FROM staging.netflix_10m
    GROUP BY native_country
)
SELECT 
    'Age Group Distribution' AS report_section,
    age_group AS category,
    population_count,
    avg_hours_per_week
FROM cte_age_demographics
UNION ALL
SELECT 
    'Education Analysis' AS report_section,
    education,
    total_population,
    avg_hours_per_week
FROM cte_education_analysis
UNION ALL
SELECT 
    'Gender Distribution'  AS report_section,
    sex,
    population_count,
    avg_hours_per_week
FROM cte_gender_distribution
UNION ALL
SELECT 
    'Country Distribution' AS report_section,
    native_country,
    population_count,
    avg_hours_per_week
FROM cte_country_distribution
ORDER BY report_section, population_count DESC
LIMIT 50