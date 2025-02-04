//
//  ContentViewww15.swift
//  Animations
//
//  Created by Андрей Завадский on 03.02.2025.
//

import SwiftUI

struct ContentView15: View {
    @State private var dragAmount = CGSize.zero

    
    var body: some View {
           LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
               .frame(width: 300, height: 200)
               .clipShape(.rect(cornerRadius: 10))
               .offset(dragAmount)
               .gesture(
                   DragGesture()
                       .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.bouncy) {
                            dragAmount = .zero
                        }
                    }
               )
              // .animation(.bouncy, value: dragAmount)
       }
   }

#Preview {
    ContentView15()
}
