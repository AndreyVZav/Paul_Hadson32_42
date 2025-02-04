//
//  ContentVieww14.swift
//  Animations
//
//  Created by Андрей Завадский on 03.02.2025.
//

import SwiftUI

struct ContentView14: View {
    @State private var enabled = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .animation(.default, value: enabled)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.9), value: enabled)
            
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .animation(nil, value: enabled)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.9), value: enabled)
        }
    }
}

#Preview {
    ContentView14()
}
