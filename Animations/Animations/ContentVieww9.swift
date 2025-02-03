//
//  ContentVieww9.swift
//  Animations
//
//  Created by Андрей Завадский on 03.02.2025.
//

import SwiftUI

struct ContentView9: View {
    @State private var animationAmount = 1.0

       var body: some View {
           print(animationAmount)
           
           return VStack {
               Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)

               Spacer()

               Button("Tap Me") {
                   animationAmount += 1
               }
               .padding(40)
               .background(.red)
               .foregroundStyle(.white)
               .clipShape(.circle)
               .scaleEffect(animationAmount)
           }
       }
   }

#Preview {
    ContentView9()
}
