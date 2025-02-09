//
//  ContentView.swift
//  Moonshot
//
//  Created by Андрей Завадский on 06.02.2025.
//

import SwiftUI

struct ContentView1: View {
    var body: some View {
        Image(.example)
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.9
            }
            
    }
}

#Preview {
    ContentView1()
}
