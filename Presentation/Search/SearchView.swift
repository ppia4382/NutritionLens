//
//  SearchView.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var showingScanner = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                searchInputSection
                statusSection
                resultSection

                Spacer()
            }
            .padding()
            .navigationTitle("search.title")
            .sheet(isPresented: $showingScanner) {
                ScannerView { scannedCode in
                    viewModel.handleScannedCode(scannedCode)
                    showingScanner = false
                }
            }
        }
    }

    // MARK: - Sections

    private var searchInputSection: some View {
        HStack(spacing: 12) {
            TextField("search.placeholder", text: $viewModel.query)
                .textFieldStyle(.roundedBorder)
                .submitLabel(.search)
                .onSubmit {
                    Task { await viewModel.search() }
                }

            Button("search.button") {
                Task { await viewModel.search() }
            }
            .buttonStyle(.borderedProminent)

            Button {
                showingScanner = true
            } label: {
                Image(systemName: "barcode.viewfinder")
            }
            .buttonStyle(.borderedProminent)
        }
    }

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
        }
        .frame(maxWidth: .infinity)
    }

    private var resultSection: some View {
        Group {
            if let item = viewModel.item {
                NavigationLink(destination: ProductDetailView(item: item)) { NutritionResultView(item: item)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain) }
        }
    }
}
