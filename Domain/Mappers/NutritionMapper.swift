//
//  NutritionMapper.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/29.
//

struct NutritionMapper {
    static func map(dto: ProductDTO) -> NutritionItem {
        let n = dto.nutriments
        return NutritionItem(
            name: dto.product_name ?? "product.unknown",
            calories: n?.energyKcal100g ?? 0,
            fat: n?.fat100g ?? 0,
            carbs: n?.carbohydrates100g ?? 0,
            protein: n?.proteins100g ?? 0
        )
    }
}
