//
//  SearchView.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var barcode = ""
    @State private var showingScanner = false

    var body: some View {
        VStack(spacing: 20) {

            // Barcode input field
            TextField("バーコードを入力…", text: $barcode)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            // Manual search button
            Button("検索") {
                Task { await viewModel.search(barcode: barcode) }
            }
            .adaptiveProminentButtonStyle()

            // Scanner button
            Button("バーコードをスキャン") {
                showingScanner = true
            }
            .adaptiveBorderedButtonStyle()
            .sheet(isPresented: $showingScanner) {
//                ScannerView { scannedCode in
//                    barcode = scannedCode
//                    Task { await viewModel.search(barcode: scannedCode) }
//                }
            }

            // Loading indicator
            if viewModel.isLoading {
                ProgressView("読み込み中…")
            }

            // Product not found UI
            if viewModel.notFound {
                notFoundView
            }

            // Generic error message
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }

            // Nutrition result UI
            if let item = viewModel.item {
                nutritionView(item)
            }

            Spacer()
        }
        .padding()
    }

    // MARK: - Not Found UI
    private var notFoundView: some View {
        VStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))
                .foregroundColor(.orange)

            Text("商品が見つかりませんでした")
                .font(.title3)
                .bold()

            Text("このバーコードはデータベースに登録されていません。")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Button("もう一度試す") {
                viewModel.notFound = false
                barcode = ""
            }
            .adaptiveBorderedButtonStyle()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
    }

    // MARK: - Nutrition UI
    private func nutritionView(_ item: NutritionItem) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(item.name)
                .font(.title2)
                .bold()

            Text("カロリー: \(item.calories)")
            Text("脂質: \(item.fat)")
            Text("炭水化物: \(item.carbs)")
            Text("タンパク質: \(item.protein)")
        }
        .padding()
    }
}

// Add compatibility helper extensions
extension View {
    @ViewBuilder
    fileprivate func adaptiveProminentButtonStyle() -> some View {
        if #available(iOS 15.0, *) {
            self.buttonStyle(.borderedProminent)
        } else {
            self.buttonStyle(DefaultButtonStyle())
        }
    }

    @ViewBuilder
    fileprivate func adaptiveBorderedButtonStyle() -> some View {
        if #available(iOS 15.0, *) {
            self.buttonStyle(.bordered)
        } else {
            self.buttonStyle(DefaultButtonStyle())
        }
    }
}
