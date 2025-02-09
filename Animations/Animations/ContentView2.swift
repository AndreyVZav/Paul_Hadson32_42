//
//  ContentView2.swift
//  Animations
//
//  Created by Андрей Завадский on 03.02.2025.
//

import SwiftUI

struct ContentView2: View {
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
        //.blur(radius: (animationAmount - 1) * 3)
        //.animation(.linear, value: animationAmount)
        .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
    }
}

#Preview {
    ContentView2()
}
