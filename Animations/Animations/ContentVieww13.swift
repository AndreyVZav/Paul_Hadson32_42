//
//  ContentVieww13.swift
//  Animations
//
//  Created by Андрей Завадский on 03.02.2025.
//

import SwiftUI

struct ContentView13: View {
    @State private var enabled = false
    
    var body: some View {
        HStack {
            Button("Tap Me") {
                enabled.toggle()
            }
            .background(enabled ? .blue : .red)
            .frame(width: 200, height: 200)
            .foregroundStyle(.white)
            
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.default, value: enabled)
        }
    }
}

#Preview {
    ContentView13()
}
