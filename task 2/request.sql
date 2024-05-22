CREATE TABLE Anastasia.winemag(
	id UInt32,
	country String,
	description String,
	designation String,
	points UInt8,
	price Float32,
	province String,
	region_1 String,
	region_2 String,
	taster_name String,
	taster_twitter_handle String,
	title String,
	variety String,
	winery String
) Engine = MergeTree()
PRIMARY KEY id;


SELECT * FROM Anastasia.winemag;

SELECT DISTINCT price FROM Anastasia.winemag;
SELECT DISTINCT country FROM Anastasia.winemag;

SELECT * FROM Anastasia.winemag
WHERE country != '' AND country IS NOT NULL AND price != 0 AND price IS NOT NULL;


SELECT 
country, 
MAX(price) as max_price
FROM Anastasia.winemag
WHERE country != '' AND country IS NOT NULL 
GROUP BY country;


SELECT 
country, 
MAX(price) as max_price
FROM Anastasia.winemag
WHERE country != '' AND country IS NOT NULL 
GROUP BY country
ORDER BY max_price DESC
LIMIT 10;

SELECT 
CORR(price, points)
FROM Anastasia.winemag
WHERE country != '' AND country IS NOT NULL AND price != 0 AND price IS NOT NULL;

SELECT 
country, 
CORR(price, points)
FROM Anastasia.winemag
WHERE country != '' AND country IS NOT NULL AND price != 0 AND price IS NOT NULL
GROUP BY country;

SELECT 
region_1, 
region_2,
CORR(price, points)
FROM Anastasia.winemag
WHERE country != '' AND country IS NOT NULL AND price != 0 AND price IS NOT NULL
GROUP BY region_1, region_2;
