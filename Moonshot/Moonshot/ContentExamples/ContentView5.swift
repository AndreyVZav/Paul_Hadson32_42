//
//  ContentView5.swift
//  Moonshot
//
//  Created by Андрей Завадский on 06.02.2025.
//

import SwiftUI

struct ContentView5: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                //Text("Detail View")
                Image(systemName: "rainbow")
                    .symbolRenderingMode(.multicolor)
                    .symbolEffect(
                        .variableColor
                            .iterative
                            .reversing
                            .hideInactiveLayers
                    )
                    .font(.system(size: 400))
            } label: {
                VStack {
                    Text("This is the label")
                    Text("So is this")
                    Image(systemName: "face.smiling")
                }
                .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView5()
}
