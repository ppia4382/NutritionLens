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
            .navigationTitle(SearchStrings.screenTitle)
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
            TextField(SearchStrings.barcodePlaceholder, text: $viewModel.query)
                .textFieldStyle(.roundedBorder)
                .submitLabel(.search)
                .onSubmit {
                    Task { await viewModel.search() }
                }

            Button(SearchStrings.searchButtonTitle) {
                Task { await viewModel.search() }
            }
            .adaptiveProminentButtonStyle()

            Button {
                showingScanner = true
            } label: {
                Image(systemName: "barcode.viewfinder")
            }
            .adaptiveBorderedButtonStyle()
        }
    }

    private var statusSection: some View {
        VStack(spacing: 12) {
            if viewModel.isLoading {
                ProgressView(SearchStrings.loadingMessage)
            }

            if viewModel.notFound {
                NotFoundView(
                    title: SearchStrings.notFoundTitle,
                    message: SearchStrings.notFoundDescription,
                    retryTitle: SearchStrings.retryButtonTitle
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
                NutritionResultView(item: item)
            } else if !viewModel.isLoading,
                      !viewModel.notFound,
                      viewModel.errorMessage == nil,
                      viewModel.query.isEmpty {
                Text(SearchStrings.noResultHint)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 24)
            }
        }
    }
}
