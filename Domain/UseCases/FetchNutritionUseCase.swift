//
//  FetchNutritionUseCase.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import Foundation

protocol FetchNutritionUseCase {
    func execute(barcode: String) async throws -> NutritionItem
}

final class FetchNutritionUseCaseImpl: FetchNutritionUseCase {
    private let client: NetworkClient
    
    nonisolated init(client: NetworkClient = NetworkClient()) {
        self.client = client
    }
    
    func execute(barcode: String) async throws -> NutritionItem {
        let response: NutritionResponse =
        try await NetworkClient.tryMultipleDomains(
            endpoint: NutritionEndpoint.product(barcode: barcode),
            domains: [.world, .japan, .asia]
        )
        print("DEBUG STATUS:", response.status)
        print("DEBUG PRODUCT:", response.product?.product_name ?? "nil")
        
        guard response.status == 1,
              let product = response.product
        else {
            throw ProductError.notFound
        }
        return NutritionMapper.map(dto: product)
    }
}
