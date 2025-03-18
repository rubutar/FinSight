import SwiftUI

struct TransactionRow: View {
    var listTransaction : TransactionModel
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(getLabelById(id: listTransaction.ctgId) ?? "Label tidak ditemukan")
                Text(listTransaction.label).font(.headline)
                Text(DateFormatterUtil.formatDateFromString(listTransaction.date)).font(.footnote)
            }
            Spacer()
            Text("\(listTransaction.amount)")
        }
        
        
    }
}
