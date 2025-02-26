//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Андрей Завадский on 26.02.2025.
//
import SwiftUI
import SwiftData

@Model
class ExpenseItem {
    var name: String
    var type: String
    var amount: Double

    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
