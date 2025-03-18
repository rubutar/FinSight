import SwiftUI

struct TransactionPage: View {
    var body: some View {
        NavigationStack {
            List(arrayTransaction, id: \.id){ listTransaction in
                //                TransactionRow(listTransaction: listTransaction)
                NavigationLink(destination: UpdateTransactionView(TrxID: "\(listTransaction.id)",selectedCategory:"\(listTransaction.ctgId)",inputAmount:"\(listTransaction.amount)", inputDate:"\(listTransaction.date)",inputNote:"\(listTransaction.label)")) {
                    TransactionRow(listTransaction: listTransaction)
                }
            }
        }.navigationTitle("Transaction")
        
    }
}

