//
//  ContentViewww18.swift
//  Animations
//
//  Created by Андрей Завадский on 03.02.2025.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
           // .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView18: View {
    @State private var isShowingRed = false

       var body: some View {
           ZStack {
               Rectangle()
                   .fill(.blue)
                   .frame(width: 200, height: 200)

               if isShowingRed {
                   Rectangle()
                       .fill(.red)
                       .frame(width: 200, height: 200)
                       .transition(.pivot)//Теперь мы можем прикрепить анимацию поворота к любому виду
               }
           }
           .onTapGesture {
               withAnimation {
                   isShowingRed.toggle()
               }
           }
       }
   }

#Preview {
    ContentView18()
}
