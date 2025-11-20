<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – coupons

Discount coupons configuration.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| tenant_id | BIGINT | NO | — |  |  |
| code | VARCHAR(100) | NO | — | Unique coupon code (case-sensitive). |  |
| code_ci | TEXT | — | — |  |  |
| type | TEXT | NO | — | Discount type. | enum: percent, fixed |
| value | NUMERIC(12,2) | NO | — | Discount value (percent or fixed). |  |
| currency | CHAR(3) | YES | — | ISO 4217 currency for fixed discounts; NULL for percent. |  |
| starts_at | DATE | NO | — | Validity start (date). |  |
| ends_at | DATE | YES | — | Validity end (date), nullable. |  |
| max_redemptions | INTEGER | NO | 0 | Max total redemptions across users (0 = unlimited). |  |
| min_order_amount | NUMERIC(12,2) | YES | — | Minimum order subtotal to apply (optional). |  |
| applies_to | JSONB | YES | — | JSON targeting (SKUs, categories, users). |  |
| is_active | BOOLEAN | NO | TRUE | Whether coupon is currently active. |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| updated_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |  |