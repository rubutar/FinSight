import SwiftUI
import SwiftData

struct TransactionPage: View {
    @Environment(\.modelContext) var modelContext
    @Query var expensesData: [ExpenseData]
    @State private var showAddExpenseView = false  // State to control AddExpenseView presentation
    
    var body: some View {
        List {
            ForEach(expensesData) { expenseData in
                NavigationLink {
                    EditExpenseView(expenseData: expenseData)
                } label: {
                    VStack(alignment: .leading) {
                        Text(expenseData.category)
                            .font(.headline)
                        Text("\(expenseData.amount, format: .currency(code: "IDR"))")
                            .font(.headline)
                        Text(expenseData.note)
                            .font(.subheadline)
                    }
                }
            }
            .onDelete(perform: deleteExpensesData) // Ensure delete works properly
        }
        .navigationTitle("List Expenses")  // Updated for a cleaner title syntax
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showAddExpenseView = true  // Open AddExpenseView
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
            }
        }
        .sheet(isPresented: $showAddExpenseView) {
            AddExpenseView(expenseData: ExpenseData())  // Present as a modal
        }
    }
    
    func deleteExpensesData(at offsets: IndexSet) {
        for index in offsets {
            let expense = expensesData[index]
            modelContext.delete(expense)
        }
        try? modelContext.save()
    }
}
