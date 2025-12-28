//
//  FetchNutritionUseCase.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

protocol FetchNutritionUseCase {
    func execute(query: String) async throws -> [NutritionItem]
}

final class FetchNutritionUseCaseImpl: FetchNutritionUseCase {
    private let client: NetworkClient

    init(client: NetworkClient = NetworkClient()) {
        self.client = client
    }

    func execute(query: String) async throws -> [NutritionItem] {
        // Placeholder until real API is implemented
        return response.items.map {
            NutritionItem(name: $0.name, calories: $0.calories)
        }
    }
}
