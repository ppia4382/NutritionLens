//
//  ProductDetailView
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/31.
//

import SwiftUI

struct ProductDetailView: View {
    let item: NutritionItem
    @StateObject private var viewModel: ProductDetailViewModel

    init(item: NutritionItem) {
        self.item = item
        _viewModel = StateObject(wrappedValue: ProductDetailViewModel(item: item))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                SectionHeader(title: "detail.nutrition.section")

                NutritionBreakdownView(
                    calories: viewModel.calories,
                    fat: viewModel.fat,
                    carbs: viewModel.carbs,
                    protein: viewModel.protein
                )
            }
            .padding()
        }
        .navigationTitle("detail.title")
    }
}

//import SwiftUI
//
//struct ProductDetailView: View {
//    @StateObject private var viewModel: ProductDetailViewModel
//
//    init(item: NutritionItem) {
//        _viewModel = StateObject(wrappedValue: ProductDetailViewModel(item: item))
//    }
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 24) {
//
//                // Product name
//                Text(viewModel.name)
//                    .font(.largeTitle)
//                    .bold()
//                    .padding(.top, 16)
//
//                // Nutrition breakdown
//                NutritionBreakdownView(
//                    calories: viewModel.calories,
//                    fat: viewModel.fat,
//                    carbs: viewModel.carbs,
//                    protein: viewModel.protein
//                )
//
//                Spacer()
//            }
//            .padding(.horizontal)
//        }
//        .navigationTitle(ProductDetailStrings.title)
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}

