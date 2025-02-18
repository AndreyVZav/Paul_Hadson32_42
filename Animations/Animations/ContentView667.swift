//
//  ContentView667.swift
//  Animations
//
//  Created by Андрей Завадский on 12.02.2025.
//
import SwiftUI

struct ContentView667: View {
    @State private var animationAmount = 1.0
    @State private var isAnimating = false // Состояние для управления анимацией
    @State private var repeatCount = 0 // Счетчик повторений
    @State private var timer: Timer? = nil // Таймер для управления анимацией

    var body: some View {
        VStack {
            Button("Tap Me") {
                if !isAnimating {
                    startAnimation()
                }
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
            .animation(
                isAnimating ? // Условие для включения/отключения анимации
                    .easeInOut(duration: 1) : .none, // Если isAnimating == false, анимация отключается
                value: animationAmount
            )

            // Кнопка для остановки анимации
            Button(action: {
                stopAnimation()
            }) {
                Text("Остановить анимацию")
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
            .padding(.top, 20)
        }
        .onDisappear {
            stopAnimation() // Останавливаем анимацию при закрытии View
        }
    }

    // Функция для запуска анимации
    private func startAnimation() {
        isAnimating = true
        repeatCount = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            withAnimation(.easeInOut(duration: 1)) {
                animationAmount = animationAmount == 1.0 ? 1.5 : 1.0
            }
            repeatCount += 1

            // Останавливаем анимацию после 10 повторений
            if repeatCount >= 10 {
                stopAnimation()
            }
        }
    }

    // Функция для остановки анимации
    private func stopAnimation() {
        timer?.invalidate() // Останавливаем таймер
        timer = nil
        isAnimating = false
        animationAmount = 1.0 // Сбрасываем масштаб
    }
}

struct ContentView667_Previews: PreviewProvider {
    static var previews: some View {
        ContentView667()
    }
}
