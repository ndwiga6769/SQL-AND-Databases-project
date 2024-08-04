-- 2.1 Create an aggregated query to select the:

-- Number of unique work orders.
-- Number of unique products.
-- Total actual cost.
-- For each location Id from the 'workoderrouting' table
-- for orders in January 2004.

SELECT																									
w.LocationID,																									
COUNT(DISTINCT w.WorkOrderID) AS no_work_orders,																									
COUNT(DISTINCT w.ProductID) AS no_unique_product,																									
SUM(w.ActualCost) AS actual_cost,																									
FROM																									
tc-da-1.adwentureworks_db.workorderrouting w																									
WHERE																									
w.ActualStartDate >= '2004-01-01'																									
AND w.ActualStartDate <= '2004-01-31'	
AND w.LocationID >= 50																								
GROUP BY w.LocationID;																									

-- 2.2 Update your 2.1 query by adding the name of the location and
--  also add the average days amount between actual start date and 
--  actual end date per each location.

SELECT 
    w.LocationID,
    l.Name AS Location,
    COUNT(DISTINCT w.WorkOrderID) AS no_work_orders,
    COUNT(DISTINCT w.ProductID) AS no_unique_products,
    SUM(w.ActualCost) AS actual_cost,
    ROUND(AVG(DATE_DIFF(w.ActualEndDate, w.ActualStartDate, day)), 2) AS avg_day_diff


    FROM 
    
    tc-da-1.adwentureworks_db.workorderrouting w
JOIN 
    tc-da-1.adwentureworks_db.location l ON w.LocationID = l.LocationID
WHERE 
    w.locationID >= 50 AND
    (w.ActualStartDate >= '2004-01-01' AND w.ActualStartDate < '2004-02-01')
GROUP BY 
    w.LocationID, l.Name;