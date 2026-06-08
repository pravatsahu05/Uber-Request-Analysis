-- =====================================================
-- Uber Request Data Analysis using MySQL
-- =====================================================

-- =====================================================
-- 1. Create Database
-- =====================================================

CREATE DATABASE uber_analysis;

-- =====================================================
-- 2. Use Database
-- =====================================================

USE uber_analysis;

-- =====================================================
-- 3. Create Table
-- =====================================================

CREATE TABLE uber_requests (
request_id INT,
pickup_point VARCHAR(50),
driver_id VARCHAR(50),
status VARCHAR(50),
request_timestamp VARCHAR(50),
drop_timestamp VARCHAR(50),
request_hour INT,
request_date VARCHAR(50),
time_slot VARCHAR(50)
);

-- =====================================================
-- 4. View Dataset
-- =====================================================

SELECT *
FROM uber_requests
LIMIT 10;

-- =====================================================
-- 5. Ride Status Distribution
-- =====================================================

SELECT
status,
COUNT(*) AS total
FROM uber_requests
GROUP BY status;

-- =====================================================
-- 6. Peak Request Hours
-- =====================================================

SELECT
request_hour,
COUNT(*) AS total_requests
FROM uber_requests
GROUP BY request_hour
ORDER BY total_requests DESC;

-- =====================================================
-- 7. Pickup Point Analysis
-- =====================================================

SELECT
pickup_point,
COUNT(*) AS total
FROM uber_requests
GROUP BY pickup_point;

-- =====================================================
-- 8. Cancellation Analysis
-- =====================================================

SELECT
pickup_point,
COUNT(*) AS cancelled_rides
FROM uber_requests
WHERE status = 'Cancelled'
GROUP BY pickup_point;

-- =====================================================
-- 9. No Cars Available Analysis
-- =====================================================

SELECT
request_hour,
COUNT(*) AS no_cars
FROM uber_requests
WHERE status = 'No Cars Available'
GROUP BY request_hour
ORDER BY no_cars DESC;

-- =====================================================
-- 10. Time Slot Analysis
-- =====================================================

SELECT
time_slot,
COUNT(*) AS total_requests
FROM uber_requests
GROUP BY time_slot;

-- =====================================================
-- 11. Completion Rate Analysis
-- =====================================================

SELECT
ROUND(
SUM(
CASE
WHEN status = 'Trip Completed'
THEN 1
ELSE 0
END
) * 100.0 / COUNT(*),
2
) AS completion_rate
FROM uber_requests;

-- =====================================================
-- END OF FILE
-- =====================================================
