//
//  ContentView2.swift
//  iExpense
//
//  Created by Андрей Завадский on 04.02.2025.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String

    var body: some View {
        Text("Hello, \(name)!")
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView2: View {
    @State private var showingSheet = false
    
    var body: some View {
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "Андрей")
            }
        }
    }

#Preview {
    ContentView2()
}
