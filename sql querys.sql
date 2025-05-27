USE customers;

-- 1. Total Number of Customers
SELECT COUNT(*) AS TotalCustomers
FROM Customers;

-- 2. Top 5 Countries with the Most Customers
SELECT Country, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY Country
ORDER BY CustomerCount DESC
LIMIT 5;

-- 3. Customer Signups Per Year
SELECT YEAR(SubscriptionDate) AS Year, COUNT(*) AS Signups
FROM Customers
GROUP BY YEAR(SubscriptionDate)
ORDER BY Year;

-- 4. Most Common Cities
SELECT City, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY City
ORDER BY CustomerCount DESC
LIMIT 10;

-- 5. Customers Missing Email or Phone1
SELECT *
FROM Customers
WHERE Email IS NULL OR Email = ''
   OR Phone1 IS NULL OR Phone1 = '';

-- 6. Duplicate First + Last Names
SELECT FirstName, LastName, COUNT(*) AS Count
FROM Customers
GROUP BY FirstName, LastName
HAVING COUNT(*) > 1;

-- 7. Customers Registered in the Last 6 Months
SELECT *
FROM Customers
WHERE SubscriptionDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 8. Top 10 Companies by Customer Count
SELECT Company, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Company
ORDER BY TotalCustomers DESC
LIMIT 10;

-- 9. Latest Customer from Each Country
SELECT c.*
FROM Customers c
JOIN (
    SELECT Country, MAX(SubscriptionDate) AS LatestDate
    FROM Customers
    GROUP BY Country
) latest
ON c.Country = latest.Country AND c.SubscriptionDate = latest.LatestDate;

-- 10. Customers by Email Domain
SELECT SUBSTRING_INDEX(Email, '@', -1) AS EmailDomain, COUNT(*) AS Count
FROM Customers
GROUP BY EmailDomain
ORDER BY Count DESC;




