//
//  ErrorMessageView.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/30.
//
import SwiftUI

struct ErrorMessageView: View {
    let message: String

    var body: some View {
        Text(LocalizedStringKey(message))
            .foregroundColor(.red)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }
}
