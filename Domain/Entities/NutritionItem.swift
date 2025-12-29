//
//  NutritionItem.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import Foundation

struct NutritionItem: Identifiable {
    let id = UUID()
    let name: String
    let calories: Double
    let fat: Double
    let carbs: Double
    let protein: Double
}
