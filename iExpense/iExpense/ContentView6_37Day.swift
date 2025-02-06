//
//  ContentView6_37Day.swift
//  iExpense
//
//  Created by Андрей Завадский on 05.02.2025.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let sevedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: sevedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}


struct ContentView6: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var personalExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == "Personal" }
    }
    
    var businessExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == "Business" }
    }
    var body: some View {
        NavigationStack {
            List {
                
                Section(header: Text("Personal Expenses")) {
                    ForEach(personalExpenses) { item in
                        expenseRow(for: item)
                    }
                    .onDelete { offsets in removeItems(at: offsets, from: personalExpenses) }
                }
                
                Section(header: Text("Business Expenses")) {
                    ForEach(businessExpenses) { item in
                        expenseRow(for: item)
                    }
                    .onDelete { offsets in removeItems(at: offsets, from: businessExpenses) }
                }
                
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func expenseRow(for item: ExpenseItem) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name).font(.headline)
                Text(item.type)
            }
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundColor(amountColor(for: item.amount))
        }
    }
    
    // Функция для определения цвета суммы
    func amountColor(for amount: Double) -> Color {
        if amount <= 100 {
            return .gray // До 100 рублей
        } else if amount <= 1000 {
            return .blue // До 1000 рублей
        } else {
            return .red // Свыше 1000 рублей
        }
    }
    
    func removeItems(at offsets: IndexSet, from list: [ExpenseItem]) {
        for index in offsets {
            if let originalIndex = expenses.items.firstIndex(where: { $0.id == list[index].id }) {
                expenses.items.remove(at: originalIndex)
            }
        }
    }
    
}

#Preview {
    ContentView6()
}
