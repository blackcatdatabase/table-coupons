-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  coupons
-- Contract view for [coupons]
-- Adds is_current helper.
CREATE OR REPLACE VIEW vw_coupons AS
SELECT
  id,
  tenant_id,
  code,
  type,
  value,
  currency,
  starts_at,
  ends_at,
  max_redemptions,
  min_order_amount,
  applies_to,
  is_active,
  (is_active AND (starts_at IS NULL OR now() >= starts_at) AND (ends_at IS NULL OR now() <= ends_at)) AS is_current,
  created_at,
  updated_at
FROM coupons;

-- Auto-generated from schema-views-feature-postgres.psd1 (map@mtime:2025-11-20T14:33:32Z)
-- engine: postgres
-- table:  coupons_effectiveness
-- Redemptions and total discount per coupon
CREATE OR REPLACE VIEW vw_coupon_effectiveness AS
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
ORDER BY redemptions DESC NULLS LAST;

