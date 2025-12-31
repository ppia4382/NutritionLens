//
//  Endpoint.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }
}
