//
//  EditExpenseView.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 21/03/25.
//

import SwiftUI
import SwiftData

struct EditExpenseView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Bindable var expenseData: ExpenseData
    
    var body: some View {
        Form {
            TextField("Amount", value: $expenseData.amount, format: .currency(code: "IDR"))
            TextField("Note", text: $expenseData.note)
            DatePicker("Date", selection: $expenseData.date)
            Picker("Category", selection: $expenseData.category) {
                Text("Food").tag("Food")
                Text("Transport").tag("Transport")
                Text("Shopping").tag("Shopping")
                Text("Others").tag("Others")
            }
            .pickerStyle(.menu)
        }
        .navigationTitle("Add Expense")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    saveExpense()
                }
            }
        }
    }
    func saveExpense() {
        modelContext.insert(expenseData)  // Insert into SwiftData
        try? modelContext.save()  // Save changes
        dismiss()  // Dismiss after saving
    }
}


#Preview {
    let example = ExpenseData(amount: 100.0, note: "Example Note", date: .now, category: "")
    EditExpenseView(expenseData: example)
}
