//
//  ModelView.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 15/03/25.
//

import Foundation

class BudgetViewModel: ObservableObject {
    @Published var budgets: [Budget] = []

    init() {
        loadBudgets()
    }

    func loadBudgets() {
        budgets = [
            Budget(income: 5700000.0, rent: 600000.0, water: 200000.0, electricity: 200000.0, others: 200000.0, savings: 500000.0, weekly_budget: 1000000.0, created_at: Date())
        ]
    }
    
    var monthlyBudget: Double {
        4000000.0
    }
}

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = []

    init() {
        loadExpenses()
    }

    func loadExpenses() {
        // Dummy data for now, replace with real storage later
        expenses = [
            Expense(title: "Makan", amount: 12000.0, category: "Food", date: Date()),
            Expense(title: "Netflix", amount: 160000.0, category: "Others", date: Date()),
            Expense(title: "Groceries", amount: 200000.0, category: "Shopping", date: Date()),
            Expense(title: "Baju", amount: 50000.0, category: "Shopping", date: Date()),
            Expense(title: "Makan", amount: 12000, category: "Food", date: Date()),
            Expense(title: "Makan", amount: 15000.0, category: "Others", date: Date()),
            Expense(title: "Celana", amount: 70000.0, category: "Shopping", date: Date()),
            Expense(title: "Groceries", amount: 50000.0, category: "Shopping", date: Date())

        ]
    }
    // Calculate total amount for each category
    var categoryTotals: [String: Double] {
        Dictionary(grouping: expenses, by: { $0.category })
            .mapValues { $0.reduce(0) { $0 + $1.amount } }
    }
    
    // Calculate total amount
    var totalExpenses: Double {
        expenses.reduce(0) { $0 + $1.amount }
    }
}

