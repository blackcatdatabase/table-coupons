-- Auto-generated from feature-modules-postgres.yaml (map@sha1:A8D58997CBCD2EEE06670B1C02AD89FA65E66F67)
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
