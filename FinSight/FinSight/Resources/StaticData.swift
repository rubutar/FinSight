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
struct DataUsageData {
    /// A data series for the bars.
    struct Series: Identifiable {
        /// Data Group.
        let category: String

        /// Size of data in gigabytes?
        let size: Double

        /// The identifier for the series.
        var id: String { category }
    }

    static let example: [Series] = [
        .init(category: "Food", size: 61.6),
        .init(category: "Transport", size: 8.2),
        .init(category: "Shopping", size: 5.7),
        .init(category: "Other", size: 2.6)
    ]
}
