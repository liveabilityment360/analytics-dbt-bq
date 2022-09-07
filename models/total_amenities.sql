{{ config(materialized='view') }}

WITH total_amenities AS (
	SELECT cdata.postcode as postcode
		  ,cdata.suburb as suburb
		  ,SUM(cdata.count_amenities) as total_count_amenities
	FROM `analytics_data.combined_data` cdata
	GROUP BY cdata.postcode

)

SELECT * FROM total_amenities