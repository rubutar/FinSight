//
//  EditDestinationView.swift
//  iTour
//
//  Created by Rudi Butarbutar on 19/03/25.
//

import SwiftUI
import SwiftData

struct EditExpenseView: View {
    @Bindable var expense: Expense
    
    var body: some View {
        Form {
            TextField("Amount", value: $expense.amount, format: .currency(code: "IDR"))
            TextField("Note", text: $expense.note)
            DatePicker("Date", selection: $expense.date)
            }
        .navigationTitle("Edit Expense")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    do {
//        let config = ModelConfiguration(ModelConfiguration(isStoredInMemoryOnly: true))
//        let container = try ModelContainer(for: Destination.self, configurations: config)
//        let example = Destination(name: "Example Destination", details: "Example details go here and will automatically expand vertically as they are edited.")
//        EditDestinationView(destination: example)
//    } catch {
//        fatalError("Failed to create model container")
//    }
//}


#Preview {
    let example = Expense(amount: 100.0, note: "Example Note", date: .now)
    EditExpenseView(expense: example)
}
