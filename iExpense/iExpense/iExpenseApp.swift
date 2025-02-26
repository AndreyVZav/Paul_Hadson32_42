//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Андрей Завадский on 04.02.2025.
//
import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView46()
        }
        .modelContainer(for: ExpenseItem.self) // Подключаем SwiftData
    }
}
