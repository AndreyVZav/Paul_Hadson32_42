//
//  ContentVieww11.swift
//  Animations
//
//  Created by Андрей Завадский on 03.02.2025.
//

import SwiftUI

struct ContentView11: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
          Button("Tap Me") {
              withAnimation {
                  animationAmount += 360
              }
          }
          .padding(50)
          .background(.red)
          .foregroundStyle(.white)
          .clipShape(.circle)
          .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
      }
  }

#Preview {
    ContentView11()
}
