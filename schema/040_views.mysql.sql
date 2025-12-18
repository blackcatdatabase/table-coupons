-- Auto-generated from schema-views-mysql.yaml (map@sha1:B3C579FF17AC186C47D2C4AC86B0738DB2308BF2)
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
