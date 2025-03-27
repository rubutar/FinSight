import SwiftUI

struct AddExpenseView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Bindable var expenseData: ExpenseData
    
    @State private var selectedDate = Date()

    // Compute the start and end of the current month
    var currentMonthRange: ClosedRange<Date> {
        let calendar = Calendar.current
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: Date()))!
        let endOfMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)!
        return startOfMonth...endOfMonth
    }
    
    var body: some View {
        Form {
            TextField("Amount", value: $expenseData.amount, format: .currency(code: "IDR")).keyboardType(.decimalPad)
            TextField("Note", text: $expenseData.note)
            DatePicker("Date", selection: $expenseData.date, in: currentMonthRange, displayedComponents: .date)
                .datePickerStyle(.compact) // You can change to .compact or .wheel
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
