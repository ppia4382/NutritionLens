//
//  NetworkClient+Fallback.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/29.
//

import Foundation

extension NetworkClient {
    static func tryMultipleDomains<T: Decodable>(
        endpoint: Endpoint,
        domains: [NetworkConfig]
    ) async throws -> T {

        for domain in domains {
            let client = NetworkClient(config: domain)
            print("DEBUG TRYING DOMAIN:", domain.baseURL)

            do {
                let result: T = try await client.request(endpoint)
                return result
            } catch {
                print(
                    "DEBUG FAILED FOR DOMAIN:",
                    domain.baseURL,
                    "error:",
                    error
                )
                continue
            }
        }

        throw ProductError.notFound
    }
}
