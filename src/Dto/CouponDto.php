<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\Coupons\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Bez logiky; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class CouponDto {
    public function __construct(
        public readonly ?int $id,
        public readonly string $code,
        public readonly string $type,
        public readonly string $value,
        public readonly ?string $currency,
        public readonly \DateTimeImmutable $startsAt,
        public readonly ?\DateTimeImmutable $endsAt,
        public readonly int $maxRedemptions,
        public readonly ?string $minOrderAmount,
        public readonly array|null $appliesTo,
        public readonly bool $isActive,
        public readonly \DateTimeImmutable $createdAt,
        public readonly \DateTimeImmutable $updatedAt
    ) {}

    /** Vhodné pro serializaci/logování (bez velkých blobů). */
    public function toArray(): array {
        return get_object_vars($this);
    }
}
