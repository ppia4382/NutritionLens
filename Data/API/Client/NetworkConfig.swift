//
//  NetworkConfig.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import Foundation

struct NetworkConfig {
    let baseURL: URL

    static let world = NetworkConfig(
        baseURL: URL(string: "https://world.openfoodfacts.org")!
    )

    static let japan = NetworkConfig(
        baseURL: URL(string: "https://jp.openfoodfacts.org")!
    )

    static let asia = NetworkConfig(
        baseURL: URL(string: "https://asia.openfoodfacts.org")!
    )

    static let `default` = world
}
