-- Auto-generated from schema-map-mysql.yaml (map@sha1:7AAC4013A2623AC60C658C9BF8458EFE0C7AB741)
-- engine: mysql
-- table:  coupons

CREATE TABLE IF NOT EXISTS coupons (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  tenant_id BIGINT UNSIGNED NOT NULL,
  code VARCHAR(100) NOT NULL,
  code_ci VARCHAR(100) GENERATED ALWAYS AS (LOWER(code)) STORED,
  `type` ENUM('percent','fixed') NOT NULL,
  value DECIMAL(12,2) NOT NULL,
  currency CHAR(3) NULL,
  starts_at DATE NOT NULL,
  ends_at DATE NULL,
  max_redemptions INT NOT NULL DEFAULT 0,
  min_order_amount DECIMAL(12,2) NULL,
  applies_to JSON NULL,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  updated_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  CONSTRAINT chk_coupon_percent_fixed CHECK (
    (`type`='percent' AND value BETWEEN 0 AND 100 AND currency IS NULL)
    OR (`type`='fixed' AND value >= 0 AND (currency REGEXP '^[A-Z]{3}$')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
