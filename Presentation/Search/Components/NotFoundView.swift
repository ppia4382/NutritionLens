//
//  NotFoundView.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/30.
//

import SwiftUI

//struct NotFoundView: View {
//    let title: LocalizedStringKey
//    let message: LocalizedStringKey
//    let retryTitle: LocalizedStringKey
//    let onRetry: () -> Void
//
//    var body: some View {
//        VStack(spacing: 12) {
//            Image(systemName: "exclamationmark.triangle.fill")
//                .font(.system(size: 40))
//                .foregroundColor(.orange)
//
//            Text(title)
//                .font(.title3)
//                .bold()
//
//            Text(message)
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//                .multilineTextAlignment(.center)
//
//            Button(retryTitle) {
//                onRetry()
//            }
//            .adaptiveBorderedButtonStyle()
//        }
//        .padding()
//        .background(Color(.systemGray6))
//        .cornerRadius(12)
//        .padding(.horizontal)
//    }
//}
//
//extension View {
//    @ViewBuilder
//    func adaptiveProminentButtonStyle() -> some View {
//        if #available(iOS 15.0, *) {
//            self.buttonStyle(.borderedProminent)
//        } else {
//            self.buttonStyle(DefaultButtonStyle())
//        }
//    }
//
//    @ViewBuilder
//    func adaptiveBorderedButtonStyle() -> some View {
//        if #available(iOS 15.0, *) {
//            self.buttonStyle(.bordered)
//        } else {
//            self.buttonStyle(DefaultButtonStyle())
//        }
//    }
//}

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
