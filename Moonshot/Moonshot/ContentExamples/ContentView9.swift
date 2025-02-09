//
//  ContentView9.swift
//  Moonshot
//
//  Created by Андрей Завадский on 07.02.2025.
//

import SwiftUI

struct ContentView9: View {

    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
            
    }
}

#Preview {
    ContentView9()
}
