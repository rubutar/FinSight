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
                        HStack{
                            Text(expenseData.category)
                                .font(.footnote)
                            Spacer()
                            Text("\(expenseData.amount, format: .currency(code: "IDR"))")
                                .font(.caption2)
                        }
                        Text(expenseData.note)
                            .font(.caption2)
                        Text(expenseData.date, format: .dateTime.day().month().year())
                            .font(.caption)
                    }
                }
            }
            .onDelete(perform: deleteExpensesData) // Ensure delete works properly
        }
        .navigationTitle("List Expenses")  // Updated for a cleaner title syntax
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddExpenseView(expenseData: ExpenseData(amount: 0, note: "", date: Date(), category: "Food"))
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
            }
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

#Preview {
    TransactionPage()
}
