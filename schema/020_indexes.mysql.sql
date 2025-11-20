-- Auto-generated from schema-map-mysql.psd1 (map@734a489)
-- engine: mysql
-- table:  coupons
CREATE UNIQUE INDEX ux_coupons_tenant_code_ci ON coupons (tenant_id, code_ci);

CREATE INDEX idx_coupons_tenant_active ON coupons (tenant_id, is_active);

CREATE INDEX idx_coupons_tenant_id ON coupons (tenant_id, id);
