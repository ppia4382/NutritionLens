//
//  SearchView.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var isScannerOpen = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {

                    // App name
                    Text("NutritionLens")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    // Scan button (scanner appears only when tapped)
                    Button {
                        if isScannerOpen {
                            isScannerOpen = false
                        } else {
                            viewModel.resetItem()
                            isScannerOpen = true
                        }
                    } label: {
                        HStack {
                            Image(systemName: "barcode.viewfinder")
                            Text("scanner.title")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 20)

                    // Scanner appears only when needed
                    if isScannerOpen {
                        ScannerView { scannedCode in
                            isScannerOpen = false
                            viewModel.handleScannedCode(scannedCode)
                        }
                        .frame(height: 260)
                        .cornerRadius(12)
                    }

                    // Guide text
                    Text("scanner.instructions")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    // 検索 label
                    Text("search.title")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // TextField
                    TextField("search.placeholder", text: $viewModel.query)
                        .textFieldStyle(.roundedBorder)
                        .submitLabel(.search)
                        .onSubmit {
                            Task { await viewModel.search() }
                        }

                    // 検索 button
                    Button("search.button") {
                        Task { await viewModel.search() }
                    }
                    .buttonStyle(.borderedProminent)

                    // Status + result section
                    statusSection

                    Spacer()
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }

    // MARK: - Status Section

    private var statusSection: some View {
        VStack(spacing: 12) {
            if viewModel.isLoading {
                ProgressView("search.loading")
            }

            if viewModel.notFound {
                NotFoundView(
                    title: "search.notfound.title",
                    message: "search.notfound.description",
                    retryTitle: "search.notfound.retry"
                ) {
                    viewModel.resetNotFound()
                }
            }

            if let error = viewModel.errorMessage {
                ErrorMessageView(message: error)
            }

            if let item = viewModel.item {
                NavigationLink(destination: ProductDetailView(item: item)) {
                    NutritionResultView(item: item)
                }
                .buttonStyle(.plain)

                // ⭐ Scan Again button
                Button("scan.again") {
                    viewModel.resetItem()
                    isScannerOpen = true
                }
                .buttonStyle(.bordered)
                
                // ⭐ Reset Screen (close scanner + clear everything)
                Button("scan.reset") {
                    viewModel.resetItem()
                    isScannerOpen = false
                }
                .buttonStyle(.bordered)
            }
        }
    }
}
