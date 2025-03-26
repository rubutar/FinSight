//
//  ExpenseData.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 21/03/25.
//

import Foundation
import SwiftData


@Model
class ExpenseData {
    var id: UUID = UUID()
    var amount: Double
    var note: String
    var date: Date
    var category: String
    
    init(amount: Double = 0.0, note: String = "", date: Date = .now, category: String = "Food") {
        self.amount = amount
        self.note = note
        self.date = date
        self.category = category
    }
}
