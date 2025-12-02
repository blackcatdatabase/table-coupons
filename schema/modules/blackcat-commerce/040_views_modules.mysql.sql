-- Auto-generated from feature-modules-mysql.yaml (map@94ebe6c)
-- engine: mysql
-- table:  coupon_redemptions_effectiveness

-- Redemptions and total discount per coupon
CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_coupon_redemptions_effectiveness AS
SELECT
  c.id,
  c.code,
  c.is_active,
  c.starts_at,
  c.ends_at,
  COUNT(cr.id)      AS redemptions,
  SUM(cr.amount_applied) AS total_applied
FROM coupons c
LEFT JOIN coupon_redemptions cr ON cr.coupon_id = c.id
GROUP BY c.id, c.code, c.is_active, c.starts_at, c.ends_at
ORDER BY redemptions DESC;
