//
//  AddExpenseView.swift
//  personalbudgetplan
//
//  Created by Patricia Gilberta Fritzie Devina on 16/03/25.
//

import SwiftUI

struct AddExpenseView: View {
    let destinationNumber: Int
    @State var inputCategory: String = ""
    @State var inputAmount: String = ""
    @State var inputDate: String = ""
    @State var inputNote: String = ""
    
    var body: some View {
        VStack {
            Text("Add Expenses: \(destinationNumber)")
                .font(.system(size: 24, weight: .black))
                .padding(.vertical, 10)
            //                    NavigationLink(destination: DetailsView(destinationNumber: destinationNumber + 1)) {
            //                        MenuButton(label: "Go to detail view no: \(destinationNumber + 1)")
            //                    }
            VStack(alignment: .leading, spacing: 15) {
                TextFieldWithLabel(label:"Category",inputPlaceholder: "Choose Category",inputValue: $inputCategory)
                TextFieldWithLabel(label:"Amount",inputPlaceholder: "Input Amount",inputValue: $inputAmount)
                TextFieldWithLabel(label:"Date",inputPlaceholder: "Choose Date",inputValue: $inputDate)
                TextFieldWithLabel(label:"Note",inputPlaceholder: "Input Note",inputValue: $inputNote)
                
                Spacer()
            }
            .padding()
            
            
        }.padding()
            .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Save") {
                            }
                        }
                    }
    }
}

#Preview {
    AddExpenseView(destinationNumber: 1)
//        .modelContainer(for: Item.self, inMemory: true)
}
