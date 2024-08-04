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
