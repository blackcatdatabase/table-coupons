-- Auto-generated from schema-views-postgres.psd1 (map@mtime:2025-10-24T09:45:40Z)
-- engine: postgres
-- table:  coupons
-- Contract view for [coupons]
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
  created_at,
  updated_at
FROM coupons;
