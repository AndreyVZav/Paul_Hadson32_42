//
//  ContentView_46Day.swift
//  iExpense
//
//  Created by Андрей Завадский on 18.02.2025.
//
import SwiftUI
import SwiftData

struct ContentView46: View {
    //@State private var expenses = Expenses()
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\ExpenseItem.amount, order: .reverse)]) var expenses: [ExpenseItem]
    
    
    var personalExpenses: [ExpenseItem] {
        expenses.filter { $0.type == "Personal" }
    }
    
    var businessExpenses: [ExpenseItem] {
        expenses.filter { $0.type == "Business" }
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
                NavigationLink("+", destination: AddView())
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
            let item = list[index]
            modelContext.delete(item)
        }
        
    }
    
}

#Preview {
    ContentView46()
        .modelContainer(for: ExpenseItem.self, inMemory: true) // Для превью
}
