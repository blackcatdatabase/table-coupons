-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  coupons
-- Contract view for [coupons]
-- Adds is_current helper.
CREATE OR REPLACE VIEW vw_coupons AS
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
  (is_active AND (starts_at IS NULL OR now() >= starts_at) AND (ends_at IS NULL OR now() <= ends_at)) AS is_current,
  created_at,
  updated_at
FROM coupons;
