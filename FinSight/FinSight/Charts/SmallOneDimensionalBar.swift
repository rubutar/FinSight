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
    
    let portionFood: Double = 0.2
    let portionTransport: Double = 0.1
    let portionUtilities: Double = 0.2
    let portionEntertainment: Double = 0.3
    
    let frameLength: CGFloat = 300
    // Variables for each category (defaulting to 0 if no data)
    var totalFood: Double { totalByCategory["Food"] ?? 0 }
    var totalTransport: Double { totalByCategory["Transport"] ?? 0 }
    var totalUtilities: Double { totalByCategory["Utilities"] ?? 0 }
    var totalEntertainment: Double { totalByCategory["Entertainment"] ?? 0 }
    
    var budgetFood: Double { monthlyBudget*portionFood }
    var budgetTransport: Double { monthlyBudget*portionTransport }
    var budgetUtilities: Double { monthlyBudget*portionUtilities }
    var budgetEntertainment: Double { monthlyBudget*portionEntertainment }
    
    
    //    private var categoryTotals: [(category: String, amount: Double)] {
    //        [
    //            ("Food", totalFood),
    //            ("Transport", totalTransport),
    //            ("Utilities", totalUtilities),
    //            ("Entertainment", totalEntertainment)
    //        ]
    //    }
    
    //    private let columns = [
    //        GridItem(.flexible(), spacing: 1),
    //        GridItem(.flexible(), spacing: 1)
    //    ]
    
    //    let spentAmount: Double
    //    let totalBudget: Double
    
    //    var progress: Double {
    //        min((totalByCategory["Food"] ?? 0) / foodBudget , 1.0) // Keeps it within 0-1 range
    //    }
    
    var body: some View {
        var progressFood: Double {
            Double(totalFood) / budgetFood
        }
        var progressTransport: Double {
            totalTransport / budgetTransport
        }
        var progressUtilities: Double {
            totalUtilities / budgetUtilities
        }
        var progressEntertainment: Double {
            totalEntertainment / budgetEntertainment
        }
        
        HStack{
            VStack(alignment: .leading) {
                Text("Food")
                    .font(.headline)
                
                ZStack(alignment: .leading) {
                    // Background Bar (Remaining * 2)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 20)
                    
                    // Background Bar (Remaining)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue.opacity(0.2))
                        .frame(width: CGFloat(portionFood) * frameLength, height: 20)
                    
                    if progressFood >= 1 {
                        // Foreground Bar (Used)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .frame(width: CGFloat(portionFood) * CGFloat(progressFood) * frameLength, height: 20)
                    } else {
                        // Foreground Bar (Used)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: CGFloat(portionFood) * CGFloat(progressFood) * frameLength, height: 20)
                    }

                    
                }
                .frame(width: 300, height: 20, alignment: .leading)
                
                HStack{
                    Circle()
                        .fill(Color.blue) // Set the color to green
                        .frame(width: 10, height: 10) // Set the size of the circle
                    
                    if progressFood >= 1 {
                        Text("\((progressFood * 100), specifier: "%.0f")%  (Rp. \(totalFood, specifier: "%.0f") of Rp. \(budgetFood, specifier: "%.0f")) spent")
                            .font(.caption)
                            .foregroundColor(.red)
                    } else {
                        Text("\((progressFood * 100), specifier: "%.0f")%  (Rp. \(totalFood, specifier: "%.0f") of Rp. \(budgetFood, specifier: "%.0f")) spent")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                }
            }
            
        }
        
        HStack{
            VStack(alignment: .leading) {
                Text("Transport")
                    .font(.headline)
                
                ZStack(alignment: .leading) {
                    // Background Bar (Remaining * 2)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 20)
                    
                    // Background Bar (Remaining)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green.opacity(0.2))
                        .frame(width: CGFloat(portionTransport) * frameLength, height: 20)
                    
                    if progressTransport >= 1 {
                        // Foreground Bar (Used)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .frame(width: CGFloat(portionTransport) * CGFloat(progressTransport) * frameLength, height: 20)
                    } else {
                        // Foreground Bar (Used)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green)
                            .frame(width: CGFloat(portionTransport) * CGFloat(progressTransport) * frameLength, height: 20)
                    }
                    
                    
                }
                .frame(width: 300, height: 20, alignment: .leading)
                
                HStack{
                    Circle()
                        .fill(Color.green) // Set the color to green
                        .frame(width: 10, height: 10) // Set the size of the circle
                    
                    if progressTransport >= 1 {
                        Text("\((progressTransport * 100), specifier: "%.0f")%  (Rp. \(totalTransport, specifier: "%.0f") of Rp. \(budgetTransport, specifier: "%.0f")) spent")
                            .font(.caption)
                            .foregroundColor(.red)
                    } else {
                        Text("\((progressTransport * 100), specifier: "%.0f")%  (Rp. \(totalTransport, specifier: "%.0f") of Rp. \(budgetTransport, specifier: "%.0f")) spent")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                }
            }
            
        }
        
        HStack{
            VStack(alignment: .leading) {
                Text("Utilities")
                    .font(.headline)
                
                ZStack(alignment: .leading) {
                    // Background Bar (Remaining * 2)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 20)
                    
                    // Background Bar (Remaining)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.orange.opacity(0.2))
                        .frame(width: CGFloat(portionUtilities) * frameLength, height: 20)
                    
                    if progressUtilities >= 1 {
                        // Foreground Bar (Used)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .frame(width: CGFloat(portionUtilities) * CGFloat(progressUtilities) * frameLength, height: 20)
                    } else {
                        // Foreground Bar (Used)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.orange)
                            .frame(width: CGFloat(portionUtilities) * CGFloat(progressUtilities) * frameLength, height: 20)
                    }
                    
                    
                }
                .frame(width: frameLength, height: 20, alignment: .leading)
                
                HStack{
                    Circle()
                        .fill(Color.orange) // Set the color to green
                        .frame(width: 10, height: 10) // Set the size of the circle
                    
                    if progressUtilities >= 1 {
                        Text("\((progressUtilities * 100), specifier: "%.0f")%  (Rp. \(totalUtilities, specifier: "%.0f") of Rp. \(budgetUtilities, specifier: "%.0f")) spent")
                            .font(.caption)
                            .foregroundColor(.red)
                    } else {
                        Text("\((progressUtilities * 100), specifier: "%.0f")%  (Rp. \(totalUtilities, specifier: "%.0f") of Rp. \(budgetUtilities, specifier: "%.0f")) spent")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                }
            }
            
            
        }
        
        HStack{
            VStack(alignment: .leading) {
                Text("Entertainment")
                    .font(.headline)
                
                ZStack(alignment: .leading) {
                    // Background Bar (Remaining * 2)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 20)
                    
                    // Background Bar (Remaining)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.purple.opacity(0.2))
                        .frame(width: CGFloat(portionEntertainment) * frameLength, height: 20)
                    
                    if progressEntertainment >= 1 {
                        // Foreground Bar (Used)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .frame(width: CGFloat(portionEntertainment) * CGFloat(progressEntertainment) * frameLength, height: 20)
                    }
                    else {
                        // Foreground Bar (Used)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.purple)
                            .frame(width: CGFloat(portionEntertainment) * CGFloat(progressEntertainment) * frameLength, height: 20)
                    }

                    
                }
                .frame(width: frameLength, height: 20, alignment: .leading)
                
                
                HStack{
                    Circle()
                        .fill(Color.purple) // Set the color to green
                        .frame(width: 10, height: 10) // Set the size of the circle
                    
                    if progressEntertainment >= 1 {
                        Text("\((progressEntertainment * 100), specifier: "%.0f")%  (Rp. \(totalEntertainment, specifier: "%.0f") of Rp. \(budgetEntertainment, specifier: "%.0f")) spent")
                            .font(.caption)
                            .foregroundColor(.red)
                    } else {
                        Text("\((progressEntertainment * 100), specifier: "%.0f")%  (Rp. \(totalEntertainment, specifier: "%.0f") of Rp. \(budgetEntertainment, specifier: "%.0f")) spent")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        
        //        LazyVGrid(columns: columns, spacing: 2) {
        //
        //            VStack(alignment: .leading) {
        //                Text("Food")
        //                    .font(.headline)
        //
        //                ZStack(alignment: .leading) {
        //                    // Background Bar (Remaining)
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .fill(Color.gray.opacity(0.3))
        //                        .frame(height: 20)
        //
        //                    // Foreground Bar (Used)
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .fill(Color.blue)
        //                        .frame(width: CGFloat(progress) * 150, height: 20)
        //
        //                }
        //                .frame(width: 150, height: 20, alignment: .leading)
        //
        //                Text("\(Int(progress * 100))%  (Rp. \(totalFood, specifier: "%.0f") of Rp. \(monthlyBudget*0.2, specifier: "%.0f"))")
        //                    .font(.caption)
        //                    .foregroundColor(.black)
        //            }
        //            .padding()
        //            VStack(alignment: .leading) {
        //                Text("Transport")
        //                    .font(.headline)
        //
        //                ZStack(alignment: .leading) {
        //                    // Background Bar (Remaining)
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .fill(Color.gray.opacity(0.3))
        //                        .frame(height: 20)
        //
        //                    // Foreground Bar (Used)
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .fill(Color.green)
        //                        .frame(width: CGFloat(progress) * 150, height: 20)
        //
        //                    // Foreground Bar (Used)
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .fill(Color.green)
        //                        .frame(width: CGFloat(progress) * 150, height: 20)
        //
        //
        //                }
        //                .frame(width: 150, height: 20, alignment: .leading)
        //
        //                Text("\(Int(progress * 100))%  (Rp. \(totalTransport, specifier: "%.0f") of Rp. \(monthlyBudget*0.1, specifier: "%.0f"))")
        //                    .font(.caption)
        //                    .foregroundColor(.black)
        //            }
        //            .padding()
        //            VStack(alignment: .leading) {
        //                Text("Utilities")
        //                    .font(.headline)
        //
        //                ZStack(alignment: .leading) {
        //                    // Background Bar (Remaining)
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .fill(Color.gray.opacity(0.3))
        //                        .frame(height: 20)
        //
        //                    // Foreground Bar (Used)
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .fill(Color.orange)
        //                        .frame(width: CGFloat(progress) * 150, height: 20) // Prevents zero width
        //
        //                }
        //                .frame(width: 150, height: 20, alignment: .leading)
        //
        //                Text("\(Int(progress * 100))%  (Rp. \(totalUtilities, specifier: "%.0f") of Rp. \(monthlyBudget*0.2, specifier: "%.0f"))")
        //                    .font(.caption)
        //                    .foregroundColor(.black)
        //            }
        //            .padding()
        //            VStack(alignment: .leading) {
        //                Text("Entertainment")
        //                    .font(.headline)
        //
        //                ZStack(alignment: .leading) {
        //                    // Background Bar (Remaining)
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .fill(Color.gray.opacity(0.3))
        //                        .frame(height: 20)
        //
        //                    // Foreground Bar (Used)
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .fill(Color.purple)
        //                        .frame(width: CGFloat(progress) * 150, height: 20)
        //
        //                }
        //                .frame(width: 150, height: 20, alignment: .leading)
        //
        //                Text("\(Int(progress * 100))%  (Rp. \(totalEntertainment, specifier: "%.0f") of Rp. \(monthlyBudget*0.3, specifier: "%.0f"))")
        //                    .font(.caption)
        //                    .foregroundColor(.black)
        //            }
        //            .padding()
        //        }
    }
}



#Preview {
    SmallOneDimensionalBar()
}
