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
            BudgetView(expenseData: ExpenseData(), budgetData: BudgetData(stipend: 5_700_000, otherIncomes: 0, rent: 700_000, water: 100_000, electricity: 200_000, otherFixExpenses: 0, savings: 500_000, monthlyBudget: 0, createdAt: .now))
//            TransactionPage(expenseData: ExpenseData())
                .modelContainer(for: ExpenseData.self)
                .modelContainer(for: BudgetData.self)
        }
    }
}
