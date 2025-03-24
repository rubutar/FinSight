
import Foundation
import SwiftData


@Model
class BudgetData {
    var id: UUID = UUID()
    var stipen: Double
    var income: Double
    var rent: Double
    var water: Double
    var electricity: Double
    var others: Double
    var savings: Double
    var monthly_budget: Double
    var created_at: Date = Date()
    
//    var created_at: Date = Calendar.current.date(byAdding: .day, value: -27, to: Date()) ?? Date()
//    let date = Date()
//    let sevenDaysLater = Calendar.current.date(byAdding: .day, value: -27, to: date) //2025-02-25 09:38:35 +0000
//    print(sevenDaysLater)
//    print("curr date \(date)") // 2025-03-24 09:38:35 +0000
//    print(isMonthLessThanCurrent(date:firstItem.created_at))
    
    init(stipen: Double = 0.0, income: Double = 0.0, rent: Double = 0.0, water: Double = 0.0, electricity: Double = 0.0, others: Double = 0.0, savings: Double = 0.0, monthly_budget: Double = 0.0) {
        self.stipen = stipen
        self.income = income
        self.rent = rent
        self.water = water
        self.electricity = electricity
        self.others = others
        self.savings = savings
        self.monthly_budget = monthly_budget
        
    }
}

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
