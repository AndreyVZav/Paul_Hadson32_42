//
//  ContentView66.swift
//  Animations
//
//  Created by Андрей Завадский on 12.02.2025.
//

import SwiftUI

struct ContentView66: View {
    @State private var animationAmount = 1.0
    @State private var isAnimating = true // Состояние для управления анимацией

    var body: some View {
        VStack {
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
            .animation(
                isAnimating ? // Условие для включения/отключения анимации
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: true) : .none, // Если isAnimating == false, анимация отключается
                value: animationAmount
            )

            // Кнопка для остановки анимации
            Button(action: {
                isAnimating = false // Останавливаем анимацию
                animationAmount = 1.0 // Сбрасываем масштаб
            }) {
                Text("Остановить анимацию")
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
            .padding(.top, 20)
        }
    }
}

#Preview {
    ContentView66()
}