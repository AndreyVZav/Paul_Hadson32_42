//
//  ContentVieww13.swift
//  Animations
//
//  Created by Андрей Завадский on 03.02.2025.
//

import SwiftUI

struct ContentView13: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            // do nothing
        }
        .background(.blue)
        .frame(width: 200, height: 200)
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView13()
}
