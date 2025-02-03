//
//  ContentView3.swift
//  Animations
//
//  Created by Андрей Завадский on 03.02.2025.
//

import SwiftUI

struct ContentView3: View {
    @State private var animationAmount = 1.0

        var body: some View {
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
            .animation(
                .easeInOut(duration: 2), value: animationAmount)
        }
    }

#Preview {
    ContentView3()
}
