//
//  ContentView_46Day.swift
//  iExpense
//
//  Created by Андрей Завадский on 18.02.2025.
//
import SwiftUI

struct ContentView46: View {
    @State private var expenses = Expenses()
    
    
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
                NavigationLink("+", destination: AddView(expenses: expenses))
                    .padding()
                    .buttonStyle(.borderedProminent)
                
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
    ContentView46()
}
