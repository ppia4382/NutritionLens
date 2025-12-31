//
//  NotFoundView.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/30.
//

import SwiftUI

struct NotFoundView: View {
    let title: LocalizedStringKey
    let message: LocalizedStringKey
    let retryTitle: LocalizedStringKey
    let onRetry: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.headline)

            Text(message)
                .font(.subheadline)
                .multilineTextAlignment(.center)

            Button(retryTitle) {
                onRetry()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
