//
//  SectionHeader.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/31.
//

import SwiftUI

struct SectionHeader: View {
    let title: LocalizedStringKey

    var body: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

//import SwiftUI
//
//struct SectionHeader: View {
//    let title: String
//
//    var body: some View {
//        Text(title)
//            .font(.headline)
//            .foregroundColor(.secondary)
//    }
//}
