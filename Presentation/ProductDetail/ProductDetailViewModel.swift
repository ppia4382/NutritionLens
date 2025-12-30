//
//  ProductDetailViewModel.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/31.
//

import Foundation

@MainActor
final class ProductDetailViewModel: ObservableObject {

    // MARK: - Input
    let item: NutritionItem

    // MARK: - Output (formatted values for UI)
    var name: String { item.name }
    var calories: String { "\(item.calories) kcal" }
    var fat: String { "\(item.fat) g" }
    var carbs: String { "\(item.carbs) g" }
    var protein: String { "\(item.protein) g" }

    init(item: NutritionItem) {
        self.item = item
    }
}
