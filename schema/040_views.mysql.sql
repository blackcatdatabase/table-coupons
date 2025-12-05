-- Auto-generated from schema-views-mysql.yaml (map@sha1:A4E10261DACB7519F6FEA44ED77A92163429CA5E)
-- engine: mysql
-- table:  coupons

-- Contract view for [coupons]
-- Adds is_current helper.
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_coupons AS
SELECT
  id,
  tenant_id,
  code,
  `type`,
  value,
  currency,
  starts_at,
  ends_at,
  max_redemptions,
  min_order_amount,
  applies_to,
  is_active,
  (is_active = 1 AND (starts_at IS NULL OR NOW() >= starts_at) AND (ends_at IS NULL OR NOW() <= ends_at)) AS is_current,
  created_at,
  updated_at
FROM coupons;
