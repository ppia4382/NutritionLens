//
//  NutritionResponse.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import Foundation

struct NutritionResponse: Decodable {
    let status: Int
    let product: ProductDTO?
}
