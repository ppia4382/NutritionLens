//
//  NutritionResultView.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/30.
//
import SwiftUI

struct NutritionResultView: View {
    let item: NutritionItem

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(item.name)
                .font(.title2)
                .bold()
            
            VStack(alignment: .leading, spacing: 4) {}
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
