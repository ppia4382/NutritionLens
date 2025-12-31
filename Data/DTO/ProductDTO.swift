//
//  ProductDTO.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import Foundation

struct ProductDTO: Decodable {
    let product_name: String?
    let nutriments: NutrimentsDTO?
}
