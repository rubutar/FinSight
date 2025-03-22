import SwiftUI

struct UpdateTransactionView: View {
    let TrxID: String
    @State var selectedCategory: String = "ctg1"
    @State var inputAmount: String = ""
    @State var inputDate: String = ""
    @State var inputNote: String = ""
    @State private var date = Date()
    @State var isSaved: Bool = false
    
    var stringToDate: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }

    func convertStringToDate(inputDate: String) -> Date? {
        let dateFormatter = stringToDate
        return dateFormatter.date(from: inputDate)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(arrayExpensesCategory) { itemCategory in
                            Text("\(itemCategory.label)").tag(itemCategory.id)
                        }
                    }
                    TextFieldWithLabel(label:"Amount",inputPlaceholder: "Input Amount",inputValue: $inputAmount)
                    TextFieldWithLabel(label:"Note",inputPlaceholder: "Input Note",inputValue: $inputNote)
                    TextFieldWithLabelDate(label:"Date",inputDate: $date)
                }
                
                // validate string to date format
//                if let date = convertStringToDate(inputDate: "18/03/2025") {
//                    Text("Converted date: \(date)")
//                } else {
//                    Text("Invalid date format.")
//                }
                
                if isSaved {
                    Text(" Function save belom jadi \n\n Category: \(selectedCategory) \n Amount: \(inputAmount) \n Note: \(inputNote) \n Date: \(date)")
                }
            }
        }.navigationTitle("Update Transaction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        isSaved = true
                    }
                }
            }
    }
}

#Preview {
    TransactionPage(expenseData: ExpenseData())
    //        .modelContainer(for: Item.self, inMemory: true)
}
