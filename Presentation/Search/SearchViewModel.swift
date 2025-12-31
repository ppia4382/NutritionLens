//
//  SearchViewModel.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import Foundation

@MainActor
final class SearchViewModel: ObservableObject {

    // MARK: - UI State

    @Published var query: String = ""
    @Published var item: NutritionItem?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var notFound: Bool = false

    // MARK: - Dependencies

    private let useCase: FetchNutritionUseCase

    init(useCase: FetchNutritionUseCase = FetchNutritionUseCaseImpl()) {
        self.useCase = useCase
    }

    // MARK: - Public API

    func search() async {
        let barcode = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !barcode.isEmpty else { return }

        isLoading = true
        errorMessage = nil
        notFound = false
        item = nil

        do {
            let result = try await useCase.execute(barcode: barcode)
            item = result
        } catch {
            handle(error)
        }

        isLoading = false
    }

    func handleScannedCode(_ code: String) {
        query = code
        Task { await search() }
    }

    func resetNotFound() {
        notFound = false
        item = nil
        query = ""
    }
    
    func resetItem() {
        item = nil
        query = ""
        errorMessage = nil
        notFound = false
    }

    // MARK: - Private

    private func handle(_ error: Error) {
        if let productError = error as? ProductError,
           productError == .notFound {
            notFound = true
        } else {
            errorMessage = NSLocalizedString("error.generic", comment: "")
            print("DEBUG ERROR:", error)
        }
    }
}
