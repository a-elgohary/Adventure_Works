/*
 Select the promotion attributes
 from the promotion table
*/
SELECT
PromotionKey AS promotion_key,
EnglishPromotionName AS promotion_name,
DiscountPct AS discount_percentage,
EnglishPromotionType AS promotion_type,
EnglishPromotionCategory AS promotion_category,
StartDate AS start_date,
EndDate AS end_date,
MinQty AS min_quantity,
MaxQty AS max_quantity
FROM 
    dbo.DimPromotion