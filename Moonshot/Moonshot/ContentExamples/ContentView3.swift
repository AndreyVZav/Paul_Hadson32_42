//
//  ContentView3.swift
//  Moonshot
//
//  Created by Андрей Завадский on 06.02.2025.
//

import SwiftUI

struct ContentView3: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
            
    }
}

#Preview {
    ContentView3()
}
