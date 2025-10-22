<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\Coupons;

final class Definitions {
    // --- základní metadata ---
    public static function table(): string { return 'coupons'; }
    public static function contractView(): string { return 'v_coupons_contract'; }
    /** @return string[] */
    public static function columns(): array { return [ 'id', 'code', 'type', 'value', 'currency', 'starts_at', 'ends_at', 'max_redemptions', 'min_order_amount', 'applies_to', 'is_active', 'created_at', 'updated_at', 'OR' ]; }
    public static function pk(): string { return 'id'; }

    // --- volitelná metadata (mohou být prázdná) ---
    public static function softDeleteColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null;
    }
    public static function updatedAtColumn(): ?string {
        $c = 'updated_at'; return $c !== '' ? $c : null;
    }
    public static function versionColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null; // pro optimistic locking
    }
    /** např. "created_at DESC, id DESC" */
    public static function defaultOrder(): ?string {
        $c = 'created_at DESC, id DESC'; return $c !== '' ? $c : null;
    }
    /** @return array<int,array<int,string>> seznam unikátních klíčů (sloupcových kombinací) */
    public static function uniqueKeys(): array { return []; }
    /** @return string[] JSON sloupce kvůli castům/operacím */
    public static function jsonColumns(): array { return [ 'applies_to' ]; }

    // --- pomocníci ---
    public static function hasColumn(string $col): bool {
        static $set = null;
        if ($set === null) { $set = array_fill_keys(self::columns(), true); }
        return isset($set[$col]);
    }
}
