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

-- Your colleague has written this query to collect basic Vendor information.
--  The query does not work, look into the query and find ways to fix it.
--   Can you provide any feedback on how to make this query be easier to debug/read?

-- Query below:

Code:

-- SELECT a.VendorId as Id,vendor_contact.ContactId, b.ContactTypeId, a.Name, a.CreditRating, a.ActiveFlag, c.AddressId,d.City

-- FROM tc-da-1.adwentureworks_db.Vendor as a

-- left join tc-da-1.adwentureworks_db.vendorcontact as vendor_contact on vendor.VendorId = vendor_contact.VendorId left join tc-da1.adwentureworks_db.vendoraddress as c on a.VendorId = c.VendorId

-- left join tc-da-1.adwentureworks_db.address as address on vendor_address.VendorId = d.VendorId

SELECT 
    a.VendorId AS Id,
    vendor_contact.ContactId,
    vendor_contact.ContactTypeId,
    a.Name,
    a.CreditRating,
    a.ActiveFlag,
    c.AddressId,
    address.City
FROM 
    tc-da-1.adwentureworks_db.vendor AS a
LEFT JOIN 
    tc-da-1.adwentureworks_db.vendorcontact AS vendor_contact 
    ON a.VendorId = vendor_contact.VendorId
LEFT JOIN 
    tc-da-1.adwentureworks_db.vendoraddress AS c 
    ON a.VendorId = c.VendorId
LEFT JOIN 
    tc-da-1.adwentureworks_db.address AS address 
    ON c.AddressId = address.AddressId;