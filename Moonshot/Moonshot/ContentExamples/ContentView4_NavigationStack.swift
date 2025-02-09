//
//  ContentView4.swift
//  Moonshot
//
//  Created by Андрей Завадский on 06.02.2025.
//

import SwiftUI

struct ContentView4: View {
    var body: some View {
           NavigationStack {
               NavigationLink("Tap Me") {
                   Text("Detail View")
               }
                   .navigationTitle("SwiftUI")
           }
       }
   }

#Preview {
    ContentView4()
}
