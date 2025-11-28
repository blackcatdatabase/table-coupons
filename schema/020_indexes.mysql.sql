-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  coupons

CREATE UNIQUE INDEX ux_coupons_tenant_code_ci ON coupons (tenant_id, code_ci);

CREATE INDEX idx_coupons_tenant_active ON coupons (tenant_id, is_active);

CREATE UNIQUE INDEX idx_coupons_tenant_id ON coupons (tenant_id, id);
