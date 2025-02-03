//
//  ContentView5.swift
//  Animations
//
//  Created by Андрей Завадский on 03.02.2025.
//

import SwiftUI

struct ContentView5: View {
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
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true),
                value: animationAmount
            )
        }
    }

#Preview {
    ContentView5()
}
