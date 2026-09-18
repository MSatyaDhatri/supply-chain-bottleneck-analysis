SELECT COUNT(*) FROM supply_chain;
SELECT * 
FROM supply_chain
LIMIT 10;
SELECT
    COUNT(*) AS total_shipments,
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time,
    ROUND(AVG(carrier_reliability_score), 2) AS avg_carrier_reliability,
    COUNT(*) FILTER (WHERE disruption_occurred = 'Yes') AS total_disruptions
FROM supply_chain;
SELECT 
    disruption_occurred,
    COUNT(*) AS count
FROM supply_chain
GROUP BY disruption_occurred;
SELECT
    COUNT(*) AS total_shipments,
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time,
    ROUND(AVG(carrier_reliability_score), 2) AS avg_carrier_reliability,
    COUNT(*) FILTER (WHERE disruption_occurred = '1') AS total_disruptions,
    ROUND(
        COUNT(*) FILTER (WHERE disruption_occurred = '1') * 100.0 
        / COUNT(*), 
        2
    ) AS disruption_rate_percent
FROM supply_chain;
SELECT
    ROUND(
        COUNT(*) FILTER (WHERE disruption_occurred = '1') * 100.0
        / COUNT(*),
        2
    ) AS disruption_rate_percent
FROM supply_chain;
SELECT
    transport_mode,
    COUNT(*) AS total_shipments,
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time_days,
    ROUND(AVG(carrier_reliability_score), 2) AS avg_reliability_score,
    COUNT(*) FILTER (WHERE disruption_occurred = '1') AS disruptions,
    ROUND(
        COUNT(*) FILTER (WHERE disruption_occurred = '1') * 100.0
        / COUNT(*),
        2
    ) AS disruption_rate_percent
FROM supply_chain
GROUP BY transport_mode
ORDER BY disruption_rate_percent DESC;
SELECT
    weather_condition,
    COUNT(*) AS total_shipments,
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time_days,
    COUNT(*) FILTER (WHERE disruption_occurred = '1') AS disruptions,
    ROUND(
        COUNT(*) FILTER (WHERE disruption_occurred = '1') * 100.0
        / COUNT(*),
        2
    ) AS disruption_rate_percent
FROM supply_chain
GROUP BY weather_condition
ORDER BY avg_lead_time_days DESC;
SELECT
    origin_port,
    COUNT(*) AS total_shipments,
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time_days,
    COUNT(*) FILTER (WHERE disruption_occurred = '1') AS disruptions,
    ROUND(
        COUNT(*) FILTER (WHERE disruption_occurred = '1') * 100.0
        / COUNT(*),
        2
    ) AS disruption_rate_percent
FROM supply_chain
GROUP BY origin_port
ORDER BY disruption_rate_percent DESC, avg_lead_time_days DESC;
SELECT
    origin_port,
    COUNT(*) AS total_shipments,
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time_days,
    COUNT(*) FILTER (WHERE disruption_occurred = '1') AS disruptions,
    ROUND(
        COUNT(*) FILTER (WHERE disruption_occurred = '1') * 100.0
        / COUNT(*),
        2
    ) AS disruption_rate_percent
FROM supply_chain
GROUP BY origin_port
ORDER BY disruption_rate_percent DESC, avg_lead_time_days DESC;
SELECT
    product_category,
    COUNT(*) AS total_shipments,
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time_days,
    COUNT(*) FILTER (WHERE disruption_occurred = '1') AS disruptions,
    ROUND(
        COUNT(*) FILTER (WHERE disruption_occurred = '1') * 100.0
        / COUNT(*),
        2
    ) AS disruption_rate_percent
FROM supply_chain
WHERE product_category IS NOT NULL
  AND TRIM(product_category) <> ''
GROUP BY product_category
ORDER BY avg_lead_time_days DESC;
SELECT
    weather_condition,
    COUNT(*) AS total_shipments,
    ROUND(AVG(geopolitical_risk_score), 2) AS avg_geopolitical_risk,
    ROUND(AVG(carrier_reliability_score), 2) AS avg_carrier_reliability,
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time,
    ROUND(
        COUNT(*) FILTER (WHERE disruption_occurred = '1') * 100.0
        / COUNT(*),
        2
    ) AS disruption_rate_percent
FROM supply_chain
GROUP BY weather_condition
ORDER BY disruption_rate_percent DESC;

SELECT
    weather_condition,
    transport_mode,
    COUNT(*) AS total_shipments,
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time_days,
    COUNT(*) FILTER (WHERE disruption_occurred = '1') AS disruptions,
    ROUND(
        COUNT(*) FILTER (WHERE disruption_occurred = '1') * 100.0
        / COUNT(*),
        2
    ) AS disruption_rate_percent
FROM supply_chain
WHERE TRIM(weather_condition) <> ''
GROUP BY weather_condition, transport_mode
ORDER BY disruption_rate_percent DESC, avg_lead_time_days DESC;

SELECT
    CASE
        WHEN geopolitical_risk_score <= 3 THEN 'Low Risk'
        WHEN geopolitical_risk_score <= 7 THEN 'Medium Risk'
        ELSE 'High Risk'
    END AS risk_category,
    
    COUNT(*) AS total_shipments,
    
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time_days,
    
    ROUND(
        AVG(carrier_reliability_score),
        2
    ) AS avg_carrier_reliability,
    
    COUNT(*) FILTER (
        WHERE disruption_occurred = '1'
    ) AS disruptions,
    
    ROUND(
        COUNT(*) FILTER (
            WHERE disruption_occurred = '1'
        ) * 100.0 / COUNT(*),
        2
    ) AS disruption_rate_percent

FROM supply_chain

GROUP BY risk_category

ORDER BY disruption_rate_percent DESC;

SELECT
    CASE
        WHEN carrier_reliability_score < 0.70 THEN 'Low Reliability'
        WHEN carrier_reliability_score < 0.85 THEN 'Medium Reliability'
        ELSE 'High Reliability'
    END AS reliability_category,

    COUNT(*) AS total_shipments,

    ROUND(AVG(lead_time_days), 2) AS avg_lead_time_days,

    COUNT(*) FILTER (
        WHERE disruption_occurred = '1'
    ) AS disruptions,

    ROUND(
        COUNT(*) FILTER (
            WHERE disruption_occurred = '1'
        ) * 100.0 / COUNT(*),
        2
    ) AS disruption_rate_percent

FROM supply_chain

GROUP BY reliability_category

ORDER BY disruption_rate_percent DESC;

SELECT
    weather_condition,
    transport_mode,
    CASE
        WHEN geopolitical_risk_score <= 3 THEN 'Low Risk'
        WHEN geopolitical_risk_score <= 7 THEN 'Medium Risk'
        ELSE 'High Risk'
    END AS risk_category,

    COUNT(*) AS total_shipments,

    ROUND(AVG(lead_time_days), 2) AS avg_lead_time_days,

    COUNT(*) FILTER (
        WHERE disruption_occurred = '1'
    ) AS disruptions,

    ROUND(
        COUNT(*) FILTER (
            WHERE disruption_occurred = '1'
        ) * 100.0 / COUNT(*),
        2
    ) AS disruption_rate_percent

FROM supply_chain

GROUP BY
    weather_condition,
    transport_mode,
    CASE
        WHEN geopolitical_risk_score <= 3 THEN 'Low Risk'
        WHEN geopolitical_risk_score <= 7 THEN 'Medium Risk'
        ELSE 'High Risk'
    END

HAVING COUNT(*) >= 20

ORDER BY
    disruption_rate_percent DESC,
    avg_lead_time_days DESC;

SELECT *
FROM supply_chain
WHERE origin_port IS NULL
   OR TRIM(origin_port) = '';
  DELETE FROM supply_chain
WHERE origin_port IS NULL
   OR TRIM(origin_port) = '';
SELECT COUNT(*)
FROM supply_chain;
