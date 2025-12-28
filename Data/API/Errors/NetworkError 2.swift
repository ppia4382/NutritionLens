//
//  NetworkError 2.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
    case unknown
}
