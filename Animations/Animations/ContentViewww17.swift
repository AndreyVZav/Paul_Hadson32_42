//
//  ContentViewww17.swift
//  Animations
//
//  Created by Андрей Завадский on 03.02.2025.
//

import SwiftUI

struct ContentView17: View {
    @State private var isShowingRed = false
    
    var body: some View {
            VStack {
                Button("Tap Me") {
                    withAnimation {
                        isShowingRed.toggle()
                    }
                }

                if isShowingRed {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
 //                       .transition(.scale)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
            }
        }
    }

#Preview {
    ContentView17()
}
