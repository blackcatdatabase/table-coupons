<!-- Auto-generated from schema-map.psd1 @ 6cefe8e (2025-10-22T20:27:41+02:00) -->
# Definition – coupons

Discount coupons configuration.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| code | VARCHAR(100) | NO | — | Unique coupon code (case-sensitive). |  |
| type | ENUM('percent','fixed') | NO | — | Discount type. | enum: percent, fixed |
| value | DECIMAL(12,2) | NO | — | Discount value (percent or fixed). |  |
| currency | CHAR(3) | YES | — | ISO 4217 currency for fixed discounts; NULL for percent. |  |
| starts_at | DATE | NO | — | Validity start (date). |  |
| ends_at | DATE | YES | — | Validity end (date), nullable. |  |
| max_redemptions | INT | NO | 0 | Max total redemptions across users (0 = unlimited). |  |
| min_order_amount | DECIMAL(12,2) | YES | — | Minimum order subtotal to apply (optional). |  |
| applies_to | JSON | YES | — | JSON targeting (SKUs, categories, users). |  |
| is_active | BOOLEAN | NO | TRUE | Whether coupon is currently active. |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| updated_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |  |