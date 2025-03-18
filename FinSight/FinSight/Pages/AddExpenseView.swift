import SwiftUI

struct AddExpenseView: View {
    let destinationNumber: Int
    @State var inputAmount: String = ""
    @State var inputDate: Date = Date()
    @State var inputNote: String = ""
    @State private var date = Date()
    @State var isSaved: Bool = false
    
    @State private var selectedCategory: String = "ctg1"
    
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
                if isSaved {
                    Text(" Function save belom jadi \n\n Category: \(selectedCategory) \n Amount: \(inputAmount) \n Note: \(inputNote) \n Date: \(date)")
                }
            }
        }.navigationTitle("Add Expenses")
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
    AddExpenseView(destinationNumber: 1)
    //        .modelContainer(for: Item.self, inMemory: true)
}
