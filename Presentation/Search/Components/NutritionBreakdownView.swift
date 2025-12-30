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
        VStack(alignment: .leading, spacing: 16) {

            SectionHeader(title: ProductDetailStrings.nutritionSection)

            VStack(spacing: 12) {
                NutritionMacroRow(label: ProductDetailStrings.calories, value: calories)
                NutritionMacroRow(label: ProductDetailStrings.fat, value: fat)
                NutritionMacroRow(label: ProductDetailStrings.carbs, value: carbs)
                NutritionMacroRow(label: ProductDetailStrings.protein, value: protein)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
}
