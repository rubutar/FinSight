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
