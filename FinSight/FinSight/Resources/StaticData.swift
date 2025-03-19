import SwiftUI

struct TransactionModel : Identifiable {
    var id = UUID()
    var label: String
    var amount: Int
    var date: String
    var ctgId: String
}

var arrayTransaction = [
    TransactionModel(label:"Makan nasi padang di rm sederhana", amount:100000, date:"20250122",ctgId:"ctg1"),
    TransactionModel(label:"Bayar rusun bulan maret", amount:100000, date:"20250328",ctgId: "ctg4")
]

struct ExpenseCategoryModel : Identifiable {
    var id: String
    var label: String
}

var arrayExpensesCategory = [
    ExpenseCategoryModel(id: "ctg1", label: "Food"),
    ExpenseCategoryModel(id: "ctg2", label: "Transport"),
    ExpenseCategoryModel(id: "ctg3", label: "Shopping"),
    ExpenseCategoryModel(id: "ctg4", label: "Other")
]

// Chart

struct Expense: Identifiable {
    let id = UUID()
    let title: String
    let amount: Double
    let category: String
    let date: Date
}

struct Budget: Identifiable {
    let id = UUID()
    let income: Double
    let rent: Double
    let water: Double
    let electricity: Double
    let others: Double
    let savings: Double
    let weekly_budget: Double
    let created_at: Date
}

struct DataUsageData {
    struct Series: Identifiable {
        let category: String
        let amount: Double
        var id: String { category }
    }

    static let example: [Series] = [
        .init(category: "Food", amount: 900000.0),
        .init(category: "Transport", amount: 300000.0),
        .init(category: "Shopping", amount: 1500000.0),
        .init(category: "Others", amount: 600000.0)
    ]
}
