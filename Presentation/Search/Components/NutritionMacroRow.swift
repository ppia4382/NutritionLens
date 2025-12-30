//
//  Untitled.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/31.
//

import SwiftUI

struct NutritionMacroRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .font(.body)
            Spacer()
            Text(value)
                .font(.body)
                .bold()
        }
    }
}
