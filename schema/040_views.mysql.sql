-- Auto-generated from schema-views-mysql.psd1 (map@38d5403)
-- engine: mysql
-- table:  coupons
-- Contract view for [coupons]
-- Adds is_current helper.
CREATE OR REPLACE SQL SECURITY INVOKER VIEW vw_coupons AS
SELECT
  id,
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
  (is_active = 1 AND NOW() >= starts_at AND (ends_at IS NULL OR NOW() <= ends_at)) AS is_current,
  created_at,
  updated_at
FROM coupons;
