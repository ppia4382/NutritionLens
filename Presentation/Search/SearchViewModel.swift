//
//  SearchViewModel.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import Combine
import Foundation

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var item: NutritionItem?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var notFound = false

    private let useCase: FetchNutritionUseCase

    init(useCase: FetchNutritionUseCase = FetchNutritionUseCaseImpl()) {
        self.useCase = useCase
    }

    func search(barcode: String) async {
        guard !barcode.isEmpty else { return }

        isLoading = true
        errorMessage = nil
        notFound = false

        do {
            let result = try await useCase.execute(barcode: barcode)
            item = result
        } catch {
            if let productError = error as? ProductError,
                productError == .notFound
            {
                notFound = true
            } else {
                errorMessage = "エラーが発生しました"
                print("DEBUG ERROR:", error)  // for Xcode console errorMessage
                error.localizedDescription
            }

        }

        isLoading = false
    }
}
