//
//  ContentVieww8.swift
//  Animations
//
//  Created by Андрей Завадский on 03.02.2025.
//

import SwiftUI

struct ContentView8: View {
    @State private var animationAmount = 1.0

       var body: some View {
           VStack {
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
    ContentView8()
}
