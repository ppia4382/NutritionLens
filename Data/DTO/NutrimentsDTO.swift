//
//  NutrimentsDTO.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/31.
//

struct NutrimentsDTO: Decodable {
    let energyKcal100g: Double?
    let fat100g: Double?
    let carbohydrates100g: Double?
    let proteins100g: Double?
    
    enum CodingKeys: String, CodingKey {
        case energyKcal100g = "energy-kcal_100g"
        case fat100g = "fat_100g"
        case carbohydrates100g = "carbohydrates_100g"
        case proteins100g = "proteins_100g"
    }
}
