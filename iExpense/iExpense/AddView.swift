//
//  AddView.swift
//  iExpense
//
//  Created by Андрей Завадский on 05.02.2025.
//
import SwiftData
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var name = "Name new expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
  //  var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                //TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
            
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))//new code Challenge 1
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                  //  expenses.items.append(item)
                    modelContext.insert(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView()
        .modelContainer(for: ExpenseItem.self, inMemory: true)
}
