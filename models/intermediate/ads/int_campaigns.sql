SELECT *
FROM {{ ref('stg_raw__facebook') }}
UNION ALL
SELECT *
FROM {{ ref('stg_raw_adwords') }}
UNION ALL 
SELECT *
FROM {{ ref('stg_raw_bing') }}
UNION ALL 
SELECT*
FROM {{ ref('stg_raw_criteo') }}