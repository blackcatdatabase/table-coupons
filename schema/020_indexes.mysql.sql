-- Auto-generated from schema-map-mysql.yaml (map@sha1:B9D3BE28A74392B9B389FDAFB493BD80FA1F6FA4)
-- engine: mysql
-- table:  coupons

CREATE UNIQUE INDEX ux_coupons_tenant_code_ci ON coupons (tenant_id, code_ci);

CREATE INDEX idx_coupons_tenant_active ON coupons (tenant_id, is_active);

CREATE UNIQUE INDEX idx_coupons_tenant_id ON coupons (tenant_id, id);
