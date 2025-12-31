//
//  ProductError.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/29.
//

import Foundation

enum ProductError: LocalizedError {
    case notFound
    
    var errorDescription: String? {
        switch self {
        case .notFound:
            return NSLocalizedString("error.notfound", comment: "")
        }
    }
}
