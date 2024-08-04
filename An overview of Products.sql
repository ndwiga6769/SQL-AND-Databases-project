-- -- You’ve been asked to extract the data on products from the 
-- Product table where there exists a product subcategory. 
-- And also include the name of the ProductSubcategory.

-- -- Columns needed: ProductId, Name, ProductNumber, 
-- size, color, ProductSubcategoryId, Subcategory name.
-- -- Order results by SubCategory name.

SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.ProductNumber,
    p.Size,
    p.Color,
    p.ProductSubcategoryID,
    ps.Name AS SubCategory
FROM 
    tc-da-1.adwentureworks_db.product p
JOIN 
    tc-da-1.adwentureworks_db.productsubcategory ps
ON 
    p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE 
    p.ProductSubcategoryID IS NOT NULL
ORDER BY 
    SubCategory;

-- 1.2 In 1.1 query you have a product subcategory 
-- but see that you could use the category name.

-- Find and add the product category name.
-- Afterwards order the results by Category name.
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.ProductNumber,
    p.Size,
    p.Color,
    p.ProductSubcategoryID,
    ps.Name AS Subcategory,
    pc.Name AS Category,
FROM 
    tc-da-1.adwentureworks_db.product p
JOIN 
    tc-da-1.adwentureworks_db.productsubcategory ps
ON 
    p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN 
    tc-da-1.adwentureworks_db.productcategory pc
ON 
    ps.ProductCategoryID = pc.ProductCategoryID
WHERE 
    p.ProductSubcategoryID IS NOT NULL
ORDER BY 
Category;
