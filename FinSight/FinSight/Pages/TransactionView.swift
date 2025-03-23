import SwiftUI
import SwiftData

struct TransactionPage: View {
    @Environment(\.modelContext) var modelContext
    @Query var expensesData: [ExpenseData]
    @State var path : [ExpenseData] = []
//    @Bindable var expenseData: ExpenseData

    
    var body: some View {
        //        NavigationStack {
        //            List(arrayTransaction, id: \.id){ listTransaction in
        //                //                TransactionRow(listTransaction: listTransaction)
        //                NavigationLink(destination: UpdateTransactionView(TrxID: "\(listTransaction.id)",selectedCategory:"\(listTransaction.ctgId)",inputAmount:"\(listTransaction.amount)", inputDate:"\(listTransaction.date)",inputNote:"\(listTransaction.label)")) {
        //                    TransactionRow(listTransaction: listTransaction)
        //                }
        //            }
        //        }.navigationTitle("Transaction")
        
        NavigationStack {
            List{
                ForEach(expensesData) { expenseData in
                    NavigationLink(value: expenseData){
                        VStack(alignment: .leading){
                            Text(expenseData.category)
                                .font(.headline)
                            Text("\(expenseData.amount, format: .currency(code: "IDR"))")
                                .font(.headline)
                            Text(expenseData.note)
                                .font(.headline)
                        }
                    }
                }
                .onDelete(perform: deleteExpensesData)
            }
            .navigationTitle("List Expenses")
            .navigationDestination(for: ExpenseData.self) { expense in
                            EditExpenseView(expenseData: expense)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        EditExpenseView(expenseData: ExpenseData())  // ✅ Navigate to new expense entry
                    } label: {
                        Image(systemName: "plus")
                        .foregroundColor(.blue)
                    }
                }
            }
        }
    }


    func deleteExpensesData(_ indexSet: IndexSet) {
        for index in indexSet {
            let expenseData = expensesData[index]
            modelContext.delete(expenseData)
        }
    }
    
    
//    func addSample() {
//        let sample = ExpenseData(amount: 1000)
//        modelContext.insert(sample)
//    }
    
// Delete function
//    func deleteExpensesData(at offsets: IndexSet) {
//        for index in offsets {
//            let expense = expensesData[index]
//            do {
//                try expense.modelContext?.delete(expense)
//            } catch {
//                print("Error deleting expense: \(error)")
//            }
//        }
//    }

}
//
//#Preview {
//    TransactionPage(expenseData: ExpenseData())
//}
