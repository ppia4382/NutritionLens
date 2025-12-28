//
//  NutritionEndpoint.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

enum NutritionEndpoint: Endpoint {
    case search(query: String)

    var path: String {
        switch self {
        case .search:
            return "/nutrition/search"
        }
    }

    var method: String { "GET" }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .search(let query):
            return [URLQueryItem(name: "q", value: query)]
        }
    }
}

