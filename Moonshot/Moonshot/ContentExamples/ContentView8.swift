//
//  ContentView8.swift
//  Moonshot
//
//  Created by Андрей Завадский on 07.02.2025.
//

import SwiftUI

struct ContentView8: View {
//    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
//    ]
    
//    let layout = [
//        GridItem(.adaptive(minimum: 80)),
//    ]
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
            
    }
}

#Preview {
    ContentView8()
}
