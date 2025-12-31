//
//  ContentView.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .adaptiveTintedForeground()
            Text("Hello, world!")
        }
        .padding()
    }
}

// Add compatibility helper for iOS 15+ `.foregroundStyle(.tint)`
private extension View {
    @ViewBuilder
    func adaptiveTintedForeground() -> some View {
        // Use a single compatible API to avoid referencing iOS 15+ symbols at all.
        // This keeps the visual intent (accent color) while remaining compatible
        // with older SDKs.
        self.foregroundColor(.accentColor)
    }
}

#Preview {
    ContentView()
}
