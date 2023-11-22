SELECT * FROM Electricalcars;

SELECT
    SUM(value) AS Total
FROM Electricalcars
WHERE powertrain = 'BEV';

SELECT
    SUM(value) AS Total
FROM Electricalcars
WHERE powertrain = 'PHEV';

SELECT
    year,
    SUM(value) AS [Total Penjualan]
FROM Electricalcars
GROUP BY year 
ORDER BY [Total Penjualan] DESC;

SELECT *
FROM Electricalcars
WHERE
    region = 'Australia' AND powertrain = 'BEV' AND (year = 2020 OR year = 2021);

--BEGINNER LEVEL :
--1. Total penjualan kendaraan listrik (EV) per tahun di Australia:
SELECT
    region,
    parameter,
    year,
    SUM(value) AS [Total Penjualan Kendaraan Listrik]
FROM Electricalcars
GROUP BY region,year, parameter
HAVING region = 'Australia' AND parameter = 'EV sales'

--2. Total penjualan kendaraan listrik berdasarkan mode dan tahun:
SELECT
    mode,
    year,
    SUM(value) AS [Total Penjualan Kendaraan Listrik]
FROM Electricalcars
GROUP BY mode,year;

--3. Rata-rata penjualan kendaraan listrik per tahun:
SELECT
    year,
    AVG(value) AS [Rata-rata Penjualan Kendaraan Listrik]
FROM Electricalcars
GROUP BY year
ORDER BY [Rata-rata Penjualan Kendaraan Listrik] DESC;

--4. Total Penjualan Berdasarkan Negara
SELECT
    region,
    year,
    SUM(value) AS [Total Penjualan]
FROM Electricalcars
GROUP BY region,year
ORDER BY region,year;

--LEVEL INTERMEDIATE :
--1. Tahun mana dengan penjualan kendaraan listrik tertinggi di Australia?


SELECT TOP 1
    year,
    SUM(value) AS [Total Penjualan]
FROM Electricalcars
GROUP BY region,year
HAVING region = 'Australia'
ORDER BY [Total Penjualan] DESC;


--2. Total penjualan kendaraan listrik (EV) berdasarkan mode di tahun 2018:
SELECT
    mode,
    SUM(value) AS [Total Penjualan]
FROM Electricalcars
GROUP BY parameter,mode,year
HAVING parameter = 'EV sales' AND mode = 'Cars'AND year = 2018;

--3. Rata-rata penjualan kendaraan listrik (EV) per tahun:
SELECT
    year,
    AVG(value) AS [Rata-rata Penjualan Tahunan]
FROM Electricalcars
GROUP BY year 
ORDER BY year;


--4. Total penjualan kendaraan listrik (EV) per tahun untuk BEV dan PHEV secara terpisah:

SELECT
    year,
    powertrain,
    SUM(value) AS [Total Penjualan]
FROM Electricalcars
WHERE powertrain = 'BEV' OR powertrain = 'PHEV'
GROUP BY year,powertrain; 


--5. Persentase pertumbuhan penjualan kendaraan listrik (EV) dari tahun ke tahun:
SELECT
    year,
    ((sum(value) - LAG(SUM(value),1,0) OVER (ORDER BY year)) / (LAG(SUM(value),1,1) OVER (ORDER BY year))) * 100  AS [Total Penjualan Tahunan]
FROM Electricalcars
GROUP BY year
ORDER BY year ASC;


SELECT
    sum(value) AS [Total Penjualan Tahunan],
    LAG(SUM(value),1,0) OVER (ORDER BY year) AS Lag1,
    LAG(SUM(value),1,1) OVER (ORDER BY year) AS Lag2
FROM Electricalcars
GROUP BY year
ORDER BY year ASC;



--6. Total penjualan kendaraan listrik (EV) per mode untuk tahun 2019 dan 2020:
SELECT
    year,
    SUM(value) AS [Total Penjualan Tahunan]
FROM Electricalcars
GROUP BY year,parameter,mode
HAVING parameter = 'EV sales' AND mode = 'cars' AND (year IN(2019,2020));


SELECT * FROM Electricalcars;
--7. Tahun berapa memiliki penjualan kendaraan listrik (EV) terendah untuk mode PHEV?

SELECT TOP 1
    year,
    SUM(value) AS [Total Penjualan Tahunan]
FROM Electricalcars
GROUP BY year,powertrain,parameter
HAVING powertrain = 'PHEV' AND parameter = 'EV sales'
ORDER BY [Total Penjualan Tahunan] ASC;



