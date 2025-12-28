//
//  NetworkConfig.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import Foundation

struct NetworkConfig {
    let baseURL: URL
    
    static let `default` = NetworkConfig(
        baseURL: URL(string: "https://api.nutritionlens.com")!
    )
}
    
