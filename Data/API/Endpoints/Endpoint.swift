//
//  Endpoint.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

protocol Endpoint {
    var path: String { get }
    var method: String { get }
    var queryItems: [URLQueryItem]? { get }
}

