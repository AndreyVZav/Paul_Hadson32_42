//
//  ContentView4.swift
//  iExpense
//
//  Created by Андрей Завадский on 04.02.2025.
//

import SwiftUI

struct ContentView4: View {
    @AppStorage("tapCount") private var tapCount = 0

        var body: some View {
            Button("Tap count: \(tapCount)") {
                tapCount += 1
            }
        }
    }

#Preview {
    ContentView4()
}
