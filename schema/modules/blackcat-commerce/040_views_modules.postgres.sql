-- Auto-generated from feature-modules-postgres.psd1 (map@mtime:2025-11-27T14:08:26Z)
-- engine: postgres
-- table:  coupon_redemptions_effectiveness
-- Redemptions and total discount per coupon
CREATE OR REPLACE VIEW vw_coupon_redemptions_effectiveness AS
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
