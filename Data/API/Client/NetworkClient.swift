//
//  NetworkClient.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import Foundation

final class NetworkClient {
    private let config: NetworkConfig

    init(config: NetworkConfig = .world) {
        self.config = config
    }

    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        // Build URL
        guard
            var components = URLComponents(
                url: config.baseURL.appendingPathComponent(endpoint.path),
                resolvingAgainstBaseURL: false
            )
        else {
            throw NetworkError.invalidURL
        }

        components.queryItems = endpoint.queryItems

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }

        // Create request
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue

        // Execute request
        let (data, response) = try await URLSession.shared.data(for: request)

        // Validate response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(httpResponse.statusCode)
        }

        // Decode JSON
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}
