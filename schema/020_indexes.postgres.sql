-- Auto-generated from schema-map-postgres.yaml (map@94ebe6c)
-- engine: postgres
-- table:  coupons

CREATE UNIQUE INDEX IF NOT EXISTS ux_coupons_tenant_code_ci ON coupons (tenant_id, code_ci);

CREATE INDEX IF NOT EXISTS idx_coupons_tenant_active ON coupons (tenant_id, is_active);

CREATE UNIQUE INDEX IF NOT EXISTS idx_coupons_tenant_id ON coupons (tenant_id, id);
