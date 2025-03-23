//
//  EditExpenseView.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 21/03/25.
//

import SwiftUI
import SwiftData

struct EditExpenseView: View {
    @Bindable var expenseData: ExpenseData
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss  // Allows dismissing the view
    @State var path = [ExpenseData]()

    
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
            Button("Save") {
                addExpenseData(expenseData: expenseData)
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .navigationTitle("Add/Edit Expense")
        .navigationBarTitleDisplayMode(.inline)
    }
    func addExpenseData(expenseData: ExpenseData) {
        modelContext.insert(expenseData)  // Insert into SwiftData
        try? modelContext.save()  // Save the context
//        path = [expenseData]
        dismiss()  // Dismiss the view after saving
    }
}


#Preview {
    let example = ExpenseData(amount: 100.0, note: "Example Note", date: .now, category: "")
    EditExpenseView(expenseData: example)
}
