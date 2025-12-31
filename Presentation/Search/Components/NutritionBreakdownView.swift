//
//  NutritionBreakdownView.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/31.
//

import SwiftUI

struct NutritionBreakdownView: View {
    let calories: String
    let fat: String
    let carbs: String
    let protein: String

    var body: some View {
        VStack(spacing: 12) {
            NutritionMacroRow(label: "detail.calories", value: calories)
            NutritionMacroRow(label: "detail.fat", value: fat)
            NutritionMacroRow(label: "detail.carbs", value: carbs)
            NutritionMacroRow(label: "detail.protein", value: protein)
        }
    }
}
