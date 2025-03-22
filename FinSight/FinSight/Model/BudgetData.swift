//
//  BudgetData.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 22/03/25.
//

import Foundation
import SwiftData

@Model
class BudgetData {
    var stipend: Int
    var otherIncomes: Int
    var rent: Int
    var water: Int
    var electricity: Int
    var otherFixExpenses: Int
    var savings: Int
    var monthlyBudget: Int
    var createdAt: Date
    

    init(stipend: Int = 5_700_000, otherIncomes: Int = 0, rent: Int = 700_000, water: Int = 100_000, electricity: Int = 200_000, otherFixExpenses: Int = 0, savings: Int = 500_000, monthlyBudget: Int, createdAt: Date) {
        self.stipend = stipend
        self.otherIncomes = otherIncomes
        self.rent = rent
        self.water = water
        self.electricity = electricity
        self.otherFixExpenses = otherFixExpenses
        self.savings = savings
        self.monthlyBudget = ((stipend + otherIncomes) - (rent + water + electricity + otherFixExpenses) - savings )
        self.createdAt = Date()
    }
    
}
