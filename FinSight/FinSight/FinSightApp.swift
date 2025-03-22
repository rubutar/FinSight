//
//  FinSightApp.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 17/03/25.
//

import SwiftUI

@main
struct FinSightApp: App {
    var body: some Scene {
        WindowGroup {
            BudgetView(expenseData: ExpenseData())
//            TransactionPage()
        }
        .modelContainer(for: ExpenseData.self)
    }
}
