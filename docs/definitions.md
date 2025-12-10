# coupons

Discount coupons configuration.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| applies_to | mysql: JSON / postgres: JSONB | YES |  | JSON targeting (SKUs, categories, users). |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| code | VARCHAR(100) | NO |  | Unique coupon code (case-sensitive). |
| ends_at | DATE | YES |  | Validity end (date), nullable. |
| starts_at | DATE | NO |  | Validity start (date). |
| min_order_amount | mysql: DECIMAL(12,2) / postgres: NUMERIC(12,2) | YES |  | Minimum order subtotal to apply (optional). |
| is_active | BOOLEAN | NO | TRUE | Whether coupon is currently active. |
| updated_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |
| max_redemptions | mysql: INT / postgres: INTEGER | NO | 0 | Max total redemptions across users (0 = unlimited). |
| type | mysql: ENUM('percent','fixed') / postgres: TEXT | NO |  | Discount type. (enum: percent, fixed) |
| id | BIGINT | NO |  | Surrogate primary key. |
| value | mysql: DECIMAL(12,2) / postgres: NUMERIC(12,2) | NO |  | Discount value (percent or fixed). |
| currency | CHAR(3) | YES |  | ISO 4217 currency for fixed discounts; NULL for percent. |

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
| vw_coupons | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_coupons | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
