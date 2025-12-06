-- Auto-generated from schema-map-postgres.yaml (map@sha1:F0EE237771FBA8DD7C4E886FF276F91A862C3718)
-- engine: postgres
-- table:  coupons

CREATE UNIQUE INDEX IF NOT EXISTS ux_coupons_tenant_code_ci ON coupons (tenant_id, code_ci);

CREATE INDEX IF NOT EXISTS idx_coupons_tenant_active ON coupons (tenant_id, is_active);

CREATE UNIQUE INDEX IF NOT EXISTS idx_coupons_tenant_id ON coupons (tenant_id, id);
