# coupons

Discount coupons configuration.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| applies_to | JSONB | YES |  | JSON targeting (SKUs, categories, users). |
| code | VARCHAR(100) | NO |  | Unique coupon code (case-sensitive). |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| currency | CHAR(3) | YES |  | ISO 4217 currency for fixed discounts; NULL for percent. |
| ends_at | DATE | YES |  | Validity end (date), nullable. |
| id | BIGINT | NO |  | Surrogate primary key. |
| is_active | BOOLEAN | NO | TRUE | Whether coupon is currently active. |
| max_redemptions | INTEGER | NO | 0 | Max total redemptions across users (0 = unlimited). |
| min_order_amount | NUMERIC(12,2) | YES |  | Minimum order subtotal to apply (optional). |
| starts_at | DATE | NO |  | Validity start (date). |
| type | TEXT | NO |  | Discount type. (enum: percent, fixed) |
| updated_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |
| value | NUMERIC(12,2) | NO |  | Discount value (percent or fixed). |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| idx_coupons_tenant_id | tenant_id, id |
| ux_coupons_tenant_code_ci | tenant_id, code_ci |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_coupons_tenant_active | tenant_id,is_active | CREATE INDEX idx_coupons_tenant_active ON coupons (tenant_id, is_active) |
| idx_coupons_tenant_id | tenant_id,id | CREATE UNIQUE INDEX idx_coupons_tenant_id ON coupons (tenant_id, id) |
| ux_coupons_tenant_code_ci | tenant_id,code_ci | CREATE UNIQUE INDEX ux_coupons_tenant_code_ci ON coupons (tenant_id, code_ci) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_coupons_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| idx_coupons_tenant_id | tenant_id, id |
| ux_coupons_tenant_code_ci | tenant_id, code_ci |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_coupons_tenant_active | tenant_id,is_active | CREATE INDEX IF NOT EXISTS idx_coupons_tenant_active ON coupons (tenant_id, is_active) |
| idx_coupons_tenant_id | tenant_id,id | CREATE UNIQUE INDEX IF NOT EXISTS idx_coupons_tenant_id ON coupons (tenant_id, id) |
| ux_coupons_tenant_code_ci | tenant_id,code_ci | CREATE UNIQUE INDEX IF NOT EXISTS ux_coupons_tenant_code_ci ON coupons (tenant_id, code_ci) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_coupons_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_coupons | mysql | algorithm=MERGE, security=INVOKER | [packages\coupons\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/coupons/schema/040_views.mysql.sql) |
| vw_coupons | postgres |  | [packages\coupons\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/coupons/schema/040_views.postgres.sql) |
