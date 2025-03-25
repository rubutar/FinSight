import SwiftUI
import SwiftData

struct InsightPage: View {
    @Query private var budgetData: [BudgetData]
    @Query var expensesData: [ExpenseData]
    @State var messageInsight : String = ""
    
    var savingBudget: Double {
        budgetData.first?.savings ?? 0
    }
    
    var monthlyBudget: Double {
        budgetData.first?.monthly_budget ?? 0
    }
    
    var totalExpenses: Double {
        expensesData.reduce(0) { $0 + $1.amount }
    }
    var totalByCategory: [String: Double] {
        Dictionary(grouping: expensesData, by: { $0.category })
            .mapValues { $0.reduce(0) { $0 + $1.amount } }
    }
    private let categories = ["Food", "Shopping", "Transport", "Others"]
    
    private let columns = [
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4)
        ]
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var totalByWeekOfMonth: [String: Double] {
        let calendar = Calendar.current
        let groupedByWeek = Dictionary(grouping: expensesData) { transaction -> String in
            let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: transaction.date)!.start
            return dateFormatter.string(from: startOfWeek)
        }
        
        // Calculate the total for each week
        let weeklyTotals = groupedByWeek.mapValues { transactionsInWeek -> Double in
            transactionsInWeek.reduce(0) { $0 + $1.amount }
        }
        print("weeklyTotals: \(weeklyTotals)")
        // Print the results
//        for (week, total) in weeklyTotals {
//            print("Week starting \(week): Total = \(total)")
//        }
//        print(Array(weeklyTotals)[2])
        return weeklyTotals
    }
    
    
    
    var body: some View {
        // Version 1 - white bacground
        ScrollView{
            OneDimensionalBar()
                .padding()
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(categories, id: \.self) { category in
                    let total = totalByCategory[category] ?? 0
                    let percentage = totalExpenses > 0 ? (total / totalExpenses * 100).rounded() : 0

                    VStack(alignment: .leading, spacing: 2) { // Small spacing inside
                        Text("\(category) \(percentage, specifier: "%.0f")%")
                            .font(.footnote)
                        
                        Text("\(total, format: .currency(code: "IDR"))")
                            .font(.caption2)
                            .bold()
//                            .foregroundColor(categoryColor(category))
                    }
                    .padding(6)
                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .background(categoryColor(category))
                    .cornerRadius(6)
                }
            }
            .padding(.horizontal, 8)
            
            ForEach(0..<1) { number in
                GroupBox(label: Text("Motivation")) {
                    Text("\(messageInsight)")
                }.padding()
                GroupBox(label: Text("Summary")) {
                    Text("Based on calculation, your other expense budget is Rp 3.500.000/month")
                }.padding()
            }
            Spacer()
            NavigationLink(destination: TransactionPage()) {
                Text("View Transaction")
            }.buttonStyle(.bordered)
            Spacer()
            //                NavigationLink(destination: BudgetPage()) {
            //                    Text("Budget")
            //                }.buttonStyle(.bordered)
            
            
        }.navigationTitle("Insights")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: BudgetView()){
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Back")
                        }
                    }
                }
            }.onAppear(){
                MotivationInsight()
            }
        
    }
    
    func MotivationInsight() -> String{
        let weeklyBudget = monthlyBudget/4
        var totalExpenseWeek1 = 0.0
        var totalExpenseWeek2 = 0.0
        var totalExpenseWeek3 = 0.0
        var totalExpenseWeek4 = 0.0
        let monthlyBudgetandsaving = monthlyBudget - savingBudget
        let totalUntilWeek3 = totalExpenseWeek1 + totalExpenseWeek2 + totalExpenseWeek3
        let totalUntilWeek4 = totalExpenseWeek1 + totalExpenseWeek2 + totalExpenseWeek3 + totalExpenseWeek4
        
        if !totalByWeekOfMonth.isEmpty {
             totalExpenseWeek1 = Array(totalByWeekOfMonth)[0].value
//             totalExpenseWeek2 = Array(totalByWeekOfMonth)[1].value
//             totalExpenseWeek3 = Array(totalByWeekOfMonth)[1].value
//             totalExpenseWeek4 = Array(totalByWeekOfMonth)[1].value
        }
        
        if totalExpenses.isZero {
            // belum ada expense
            messageInsight = "Let's start recording your expenses. Keep up the good habit!"
        } else if totalExpenseWeek1 > weeklyBudget {
            // week 1
            messageInsight = "Wow, in Week 1 you are overspending! Try adjusting your spending habits so you don't run out of budget too soon."
        } else if (totalExpenseWeek1 > weeklyBudget) && (totalExpenseWeek2 > weeklyBudget) {
            // week 2
            messageInsight = "You’ve overspent for two weeks in a row! If this continues, you may run out of money before the month ends. Try cutting down on non-essential expenses."
        } else if ((totalExpenseWeek1 > weeklyBudget) && (totalExpenseWeek2 > weeklyBudget) && (totalExpenseWeek3 > weeklyBudget)){
            // week 3
            if totalUntilWeek3 > monthlyBudget {
                messageInsight = "You’ve overspent for three weeks! Be extra careful in the last week to stay within your budget."
            }
        } else if ((totalExpenseWeek1 > weeklyBudget) && (totalExpenseWeek2 > weeklyBudget) && (totalExpenseWeek3 > weeklyBudget)) {
            // week 4
            if totalUntilWeek4 > monthlyBudget {
                messageInsight = "You’ve exceeded your monthly budget, and there's still one more week before your stipend arrives. Time to be extra frugal!"
            }
        } else if totalExpenses < monthlyBudgetandsaving {
            // surplus
            messageInsight = "Great job! You have leftover budget this month. Consider adding it to your savings or investing for future financial goals."
        } else if totalExpenses == monthlyBudget {
            messageInsight = "Congratulations! You managed to balance your spending perfectly this month. Keep up the great budgeting habits!"
        } else {
            messageInsight = ""
        }
        print("messageInsight \(messageInsight)")
        return messageInsight
    }
    
    


}

#Preview {
    InsightPage()
}
