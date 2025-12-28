//
//  NutritionResponse.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

struct NutritionResponse: Decodable {
    let items: [NutritionItemDTO]
}

struct NutritionItemDTO: Decodable {
    let name: String
    let calories: Int
}
