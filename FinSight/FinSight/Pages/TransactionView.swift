import SwiftUI
import SwiftData

struct TransactionPage: View {
    @Environment(\.modelContext) var modelContext
    @Query var expensesData: [ExpenseData]
    @State var path = [ExpenseData]()
    
    var body: some View {
//        NavigationStack {
//            List(arrayTransaction, id: \.id){ listTransaction in
//                //                TransactionRow(listTransaction: listTransaction)
//                NavigationLink(destination: UpdateTransactionView(TrxID: "\(listTransaction.id)",selectedCategory:"\(listTransaction.ctgId)",inputAmount:"\(listTransaction.amount)", inputDate:"\(listTransaction.date)",inputNote:"\(listTransaction.label)")) {
//                    TransactionRow(listTransaction: listTransaction)
//                }
//            }
//        }.navigationTitle("Transaction")
        
        NavigationStack(path: $path){
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
                    .navigationBarTitle(Text("List Expenses"))
                    .navigationDestination(for: ExpenseData.self, destination: EditExpenseView.init)
                    .toolbar{
                        Button("Add Expense", systemImage: "plus", action: addExpenseData)
                    }
                }
            }
            func addExpenseData1() {
                let tambahData = ExpenseData(amount: 100000, note: "makan", date: .now, category: "Others")
                modelContext.insert(tambahData)
            }
            func addExpenseData() {
                let expenseData = ExpenseData()
                modelContext.insert(expenseData)
                path = [expenseData]
            }
            func deleteExpensesData(_ indexSet: IndexSet) {
                for index in indexSet {
                    let expenseData = expensesData[index]
                    modelContext.delete(expenseData)
                }
            }

}

#Preview {
    TransactionPage()
}
