-- -- Below you will find 2 queries that need to be fixed/updated.

-- -- Doubleclick on the cell of the query and you will see it in 

-- -- the original format, copy it into your Bigquery interface and try to fix it there.
-- -- Once you have it fixed, copy into your spreadsheet of results among previous task results.
-- -- 3.1 Your colleague has written a query to find the list of orders
-- --  connected to special offers. The query works fine but the numbers are off,
-- --   investigate where the potential issue lies.

-- SELECT sales_detail.SalesOrderId
--       ,sales_detail.OrderQty
--       ,sales_detail.UnitPrice
--       ,sales_detail.LineTotal
--       ,sales_detail.ProductId
--       ,sales_detail.SpecialOfferID
--       ,spec_offer_product.ModifiedDate
--       ,spec_offer.Category
--       ,spec_offer.Description

-- FROM `tc-da-1.adwentureworks_db.salesorderdetail`  as sales_detail

-- left join `tc-da-1.adwentureworks_db.specialofferproduct` as spec_offer_product
-- on sales_detail.productId = spec_offer_product.ProductID

-- left join `tc-da-1.adwentureworks_db.specialoffer` as spec_offer
-- on sales_detail.SpecialOfferID = spec_offer.SpecialOfferID

-- order by LineTotal desc;


CORRECT CODE 

SELECT
      sales_detail.SalesOrderId
      ,sales_detail.OrderQty
      ,sales_detail.UnitPrice
      ,sales_detail.LineTotal
      ,sales_detail.ProductId
      ,sales_detail.SpecialOfferID
      ,spec_offer_product.ModifiedDate
      ,spec_offer.Category
      ,spec_offer.Description

FROM `tc-da-1.adwentureworks_db.salesorderdetail`  as sales_detail

left join `tc-da-1.adwentureworks_db.specialofferproduct` as spec_offer_product
on sales_detail.productId = spec_offer_product.ProductID AND  sales_detail.SpecialOfferID = spec_offer_product.SpecialOfferID

left join `tc-da-1.adwentureworks_db.specialoffer` as spec_offer
on sales_detail.SpecialOfferID = spec_offer.SpecialOfferID

order by LineTotal desc;