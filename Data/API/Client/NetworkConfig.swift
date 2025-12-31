//
//  NetworkConfig.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import Foundation

struct NetworkConfig {
    let baseURL: URL
    init(region: Region) { self.baseURL = URL(string: region.rawValue)! }
    
    static let world = NetworkConfig(region: .world)
    static let japan = NetworkConfig(region: .japan)
    static let asia = NetworkConfig(region: .asia)
    static let `default` = world
}
