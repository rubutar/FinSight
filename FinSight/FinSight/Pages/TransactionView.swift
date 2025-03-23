import SwiftUI
import SwiftData

struct TransactionPage: View {
    @Environment(\.modelContext) var modelContext
    @Query var expensesData: [ExpenseData]
    @State private var path: [ExpenseData] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expensesData) { expense in
                    NavigationLink(value: expense) {
                        VStack(alignment: .leading) {
                            Text(expense.category)
                                .font(.headline)
                            Text("\(expense.amount, format: .currency(code: "IDR"))")
                                .font(.headline)
                            Text(expense.note)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("List Expenses")
            .navigationDestination(for: ExpenseData.self) { expense in
                EditExpenseView(expenseData: expense)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Add Sample") {
                        addSample()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        EditExpenseView(expenseData: ExpenseData())
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }

    func addSample() {
        let sample = ExpenseData(amount: 1000, note: "Lunch", category: "Food")
        modelContext.insert(sample)
        try? modelContext.save()
    }
}
