//
//  ContentView_46Day.swift
//  iExpense
//
//  Created by Андрей Завадский on 18.02.2025.
//
import SwiftUI
import SwiftData

struct ContentView46: View {
    @Environment(\.modelContext) var modelContext
    @State private var sortOrder: SortOption = .byAmount
    
    // Фильтрация по категориям
    @State private var fetchDescriptor: FetchDescriptor<ExpenseItem>
    
    init() {
        _fetchDescriptor = State(initialValue: FetchDescriptor(
            sortBy: [SortDescriptor(\ExpenseItem.amount, order: .reverse)]
        ))
    }
    
    var allExpenses: [ExpenseItem] {
            do {
                return try modelContext.fetch(fetchDescriptor)
            } catch {
                print("Ошибка загрузки данных: \(error.localizedDescription)")
                return []
            }
        }
    
    var personalExpenses: [ExpenseItem] {
        allExpenses.filter { $0.type == "Personal" }
    }
    
    var businessExpenses: [ExpenseItem] {
        allExpenses.filter { $0.type == "Business" }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // Выбор сортировки
                Picker("Sort by", selection: $sortOrder) {
                    Text("By Amount").tag(SortOption.byAmount)
                    Text("By Name").tag(SortOption.byName)
                }
                .pickerStyle(.segmented)
                .padding()
                .onChange(of: sortOrder) { updateSorting() }
                
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
    }
    
    private func updateSorting() {
            switch sortOrder {
            case .byAmount:
                fetchDescriptor.sortBy = [SortDescriptor(\ExpenseItem.amount, order: .reverse)]
            case .byName:
                fetchDescriptor.sortBy = [SortDescriptor(\ExpenseItem.name, order: .forward)]
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
            if let originalIndex = allExpenses.firstIndex(where: { $0.id == list[index].id }) {
                modelContext.delete(allExpenses[originalIndex])
            }
        }
    }
    
    
}


#Preview {
    ContentView46()
        .modelContainer(for: ExpenseItem.self, inMemory: true)
}
