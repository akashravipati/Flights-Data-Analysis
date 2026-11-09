SELECT a.AIRLINE, ap.AIRPORT, COUNT(f.ARRIVAL_DELAY) as total_flights, ROUND(AVG(ARRIVAL_DELAY),2) as avg_delay 
FROM flights AS f
JOIN airlines AS a
	ON f.AIRLINE = a.IATA_CODE
JOIN airports AS ap
	ON f.DESTINATION_AIRPORT = ap.IATA_CODE
GROUP BY a.AIRLINE, ap.AIRPORT
HAVING COUNT(f.ARRIVAL_DELAY) > 1000
ORDER BY avg_delay DESC

SELECT a.AIRLINE, COUNT(f.AIRLINE) as total_flights, ROUND(AVG(ARRIVAL_DELAY),2) as avg_delay 
FROM flights AS f
JOIN airlines AS a
	ON f.AIRLINE = a.IATA_CODE
GROUP BY a.AIRLINE
ORDER BY total_flights DESC

SELECT MONTH,
       COUNT(f.ARRIVAL_DELAY) AS flights_with_delay,
       ROUND(AVG(f.ARRIVAL_DELAY), 2) AS avg_delay,
       a.AIRLINE
FROM flights as f
JOIN airlines as a
ON f.AIRLINE = a.IATA_CODE
GROUP BY MONTH, a.AIRLINE
ORDER BY MONTH;

SELECT ROUND(AVG(ARRIVAL_DELAY), 2) AS overall_avg_delay FROM flights;

SELECT a.AIRLINE,
       COUNT(f.ARRIVAL_DELAY) AS flights_with_delay,
       ROUND(AVG(f.ARRIVAL_DELAY), 2) AS avg_delay
FROM flights AS f
JOIN airlines AS a ON f.AIRLINE = a.IATA_CODE
JOIN airports AS ap ON f.DESTINATION_AIRPORT = ap.IATA_CODE
WHERE ap.AIRPORT LIKE 'Philadelphia%'
GROUP BY a.AIRLINE
ORDER BY avg_delay DESC;

SELECT *
FROM airlines

SELECT COUNT(*)
FROM flights

SELECT *
FROM airports
