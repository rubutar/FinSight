//
//  SmallOneDimensionalBar.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 25/03/25.
//

import SwiftUI
import SwiftData

struct SmallOneDimensionalBar: View {
    
    @Query var expensesData: [ExpenseData]
    @Query var budgetData: [BudgetData]
    var totalExpenses: Double {
        expensesData.reduce(0) { $0 + $1.amount }
    }
    var totalByCategory: [String: Double] {
        Dictionary(grouping: expensesData, by: { $0.category })
            .mapValues { $0.reduce(0) { $0 + $1.amount } }
    }
    var monthlyBudget: Double {
        budgetData.first?.monthly_budget ?? 0
    }
    var foodBudget: Double {
        budgetData.first?.monthly_budget ?? 0
    }
    
    @State private var showLegend = true
    
    
    // Variables for each category (defaulting to 0 if no data)
    var totalFood: Double { totalByCategory["Food"] ?? 0 }
    var totalTransport: Double { totalByCategory["Transport"] ?? 0 }
    var totalUtilities: Double { totalByCategory["Utilities"] ?? 0 }
    var totalEntertainment: Double { totalByCategory["Entertainment"] ?? 0 }
    
    private var categoryTotals: [(category: String, amount: Double)] {
        [
            ("Food", totalFood),
            ("Transport", totalTransport),
            ("Utilities", totalUtilities),
            ("Entertainment", totalEntertainment)
        ]
    }
    
    private let columns = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    
    //    let spentAmount: Double
    //    let totalBudget: Double
    
    //    var progress: Double {
    //        min((totalByCategory["Food"] ?? 0) / foodBudget , 1.0) // Keeps it within 0-1 range
    //    }
    var progress: Double = 0.3
    
    var body: some View {
        
                
        LazyVGrid(columns: columns, spacing: 2) {
            var progressFood: Double {
                min((totalByCategory["Food"] ?? 0) / foodBudget , 1.0) // Keeps it within 0-1 range
            }
            var progressTransport: Double {
                min((totalByCategory["Transport"] ?? 0) / foodBudget , 1.0) // Keeps it within 0-1 range
            }
            var progressUtilities: Double {
                min((totalByCategory["Utilities"] ?? 0) / foodBudget , 1.0) // Keeps it within 0-1 range
            }
            var progressEntertainment: Double {
                min((totalByCategory["Entertainment"] ?? 0) / foodBudget , 1.0) // Keeps it within 0-1 range
            }
            
            VStack(alignment: .leading) {
                Text("Food")
                    .font(.headline)
                
                ZStack(alignment: .leading) {
                    // Background Bar (Remaining)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 20)
                    
                    // Foreground Bar (Used)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: CGFloat(progress) * 150, height: 20)
                    
                }
                .frame(width: 150, height: 20, alignment: .leading)
                
                Text("\(Int(progress * 100))%  (Rp. 500.000 of Rp. 1.000.000)")
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding()
            VStack(alignment: .leading) {
                Text("Food")
                    .font(.headline)
                
                ZStack(alignment: .leading) {
                    // Background Bar (Remaining)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 20)
                    
                    // Foreground Bar (Used)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green)
                        .frame(width: CGFloat(progress) * 150, height: 20)
                    
                }
                .frame(width: 150, height: 20, alignment: .leading)
                
                Text("\(Int(progress * 100))%  (Rp. 500.000 of Rp. 1.000.000)")
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding()
            VStack(alignment: .leading) {
                Text("Food")
                    .font(.headline)
                
                ZStack(alignment: .leading) {
                    // Background Bar (Remaining)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 20)
                    
                    // Foreground Bar (Used)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.orange)
                        .frame(width: CGFloat(progress) * 150, height: 20) // Prevents zero width

                }
                .frame(width: 150, height: 20, alignment: .leading)
                
                Text("\(Int(progress * 100))%  (Rp. \(totalFood) of Rp. 1.000.000)")
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding()
            VStack(alignment: .leading) {
                Text("Food")
                    .font(.headline)
                
                ZStack(alignment: .leading) {
                    // Background Bar (Remaining)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 20)
                    
                    // Foreground Bar (Used)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.purple)
                        .frame(width: CGFloat(progress) * 150, height: 20)
                    
                }
                .frame(width: 150, height: 20, alignment: .leading)
                
                Text("\(Int(progress * 100))%  (Rp. 500.000 of Rp. 1.000.000)")
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding()
        }
    }
}



//#Preview {
//    SmallOneDimensionalBar()
//}
