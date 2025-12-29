//
//  NutritionEndpoint.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import Foundation

enum NutritionEndpoint: Endpoint {
    case product(barcode: String)

    var path: String {
        switch self {
        case .product(let barcode):
            return "/api/v0/product/\(barcode).json"
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var queryItems: [URLQueryItem]? {
        return nil
    }
}
