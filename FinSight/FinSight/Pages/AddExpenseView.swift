import SwiftUI

struct AddExpenseView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Bindable var expenseData: ExpenseData
    
    var body: some View {
        Form {
            TextField("Amount", value: $expenseData.amount, format: .currency(code: "IDR")).keyboardType(.decimalPad)
            TextField("Note", text: $expenseData.note)
            DatePicker("Date", selection: $expenseData.date, displayedComponents: .date)
                .datePickerStyle(.compact)
            Picker("Category", selection: $expenseData.category) {
                Text("Food").tag("Food")
                Text("Transport").tag("Transport")
                Text("Utilities").tag("Utilities")
                Text("Entertainment").tag("Entertainment")
            }
            .pickerStyle(.menu)
        }
        .navigationTitle("Add Expense")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    saveExpense()
                }.foregroundStyle(Color("bgThemeGreen"))
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
    AddExpenseView(expenseData: ExpenseData())
    //        .modelContainer(for: Item.self, inMemory: true)
}
