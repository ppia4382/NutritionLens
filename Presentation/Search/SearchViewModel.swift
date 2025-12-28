//
//  SearchViewModel.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//


import Foundation
import Combine

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var results: [NutritionItem] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private var cancellables = Set<AnyCancellable>()

    init() {
        // Example: automatically perform a search when the query changes (debounced)
        $query
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] newQuery in
                guard let self = self else { return }
                if newQuery.isEmpty {
                    self.results = []
                } else {
                    self.performSearch()
                }
            }
            .store(in: &cancellables)
    }

    /// Async API the view can call (e.g. `await viewModel.search(query)`)
    func search(_ newQuery: String) async {
        // Update the published query (MainActor) and trigger search logic
        self.query = newQuery
        // Call performSearch which will update `results` on the main actor
        self.performSearch()
    }

    /// Performs a simulated search. Replace with real repository/API call.
    func performSearch() {
        let currentQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !currentQuery.isEmpty else {
            results = []
            return
        }

        isLoading = true
        errorMessage = nil

        // Simulate async work
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.35) { [weak self] in
            guard let self = self else { return }

            // Simulated NutritionItem results
            let simulated = (1...5).map { NutritionItem(name: "\(currentQuery) result \($0)", calories: Int.random(in: 50...400)) }

            DispatchQueue.main.async {
                self.results = simulated
                self.isLoading = false
            }
        }
    }

    func clear() {
        query = ""
        results = []
        errorMessage = nil
    }
}
