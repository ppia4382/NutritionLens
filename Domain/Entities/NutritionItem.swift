//
//  NutritionItem.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//


import Foundation

struct NutritionItem: Identifiable {
    let id: UUID = UUID()
    let name: String
    let calories: Int
}
