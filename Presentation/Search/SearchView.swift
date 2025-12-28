//
//  SearchView.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/28.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var query = ""

    var body: some View {
        VStack {
            TextField("Search food...", text: $query)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button("Search") {
                Task {
                    await viewModel.search(query)
                }
            }

            if viewModel.isLoading {
                ProgressView()
            }

            List(viewModel.results) { item in
                VStack(alignment: .leading) {
                    Text(item.name)
                    Text("\(item.calories) calories")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
    }
}
