//
//  BudgetView.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 17/03/25.
//

import SwiftUI

struct BudgetView: View {
    @Bindable var expenseData: ExpenseData
    @Bindable var budgetData: BudgetData
    @State private var showBudget = false // ✅ Controls visibility of Budgets section


    var body: some View {
        Spacer()
        NavigationStack(){
            VStack{
                Image(systemName:"antenna.radiowaves.left.and.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Text("FinSight")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Smart Budgeting, Clear Insights. Track your expenses, manage your budget, and gain valuable financial insights effortlessly!")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            Form{
                Section(header: Text("Incomes")) {
                    HStack{
                        Text("Stipend")
                        TextField("Stipend", value: $budgetData.stipend, format: .currency(code: "IDR"))
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                    HStack{
                        Text("Other Incomes")
                        TextField("Other Incomes", value: $budgetData.otherIncomes, format: .currency(code: "IDR"))
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                }
                Section(header: Text("Fixed Expenses")) {
                    HStack{
                        Text("Rent")
                        TextField("Rent", value: $budgetData.rent, format: .currency(code: "IDR"))
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                    HStack{
                        Text("Water")
                        TextField("Water", value: $budgetData.water, format: .currency(code: "IDR"))
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                    HStack{
                        Text("Electricity")
                        TextField("Electricity", value: $budgetData.electricity, format: .currency(code: "IDR"))
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                    HStack{
                        Text("Others")
                        TextField("Other Fixed Expenses", value: $budgetData.otherFixExpenses, format: .currency(code: "IDR"))
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 1, trailing: 15))

                Section(header: Text("Savings")) {
                    HStack{
                        Text("Savings")
                        TextField("Savings", value: $budgetData.savings, format: .currency(code: "IDR"))
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 1, trailing: 15))
                Button("Calculate Budget") {
                    calculateMonthlyBudget()
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity, alignment: .center)

                if showBudget { // ✅ Show Budgets section after calculation
                    Section(header: Text("Budgets")) {
                        Text("Based on calculation, your monthly budget for other expenses will be:")
                        Text(budgetData.monthlyBudget, format: .currency(code: "IDR"))
                            .bold()
                            .font(.title)
                    }
                }
            }

            
            NavigationLink(destination: InsightPage(expenseData: ExpenseData())) {
                Text("Get the Insights")
                    .font(.title2 .bold())
            }
        }
    }
    func calculateMonthlyBudget() {
        budgetData.monthlyBudget = ((budgetData.stipend + budgetData.otherIncomes) - (budgetData.rent + budgetData.water + budgetData.electricity + budgetData.otherFixExpenses) - (budgetData.savings))
        showBudget = true
    }
}

//#Preview {
//    BudgetView(expenseData: ExpenseData(), budgetData: BudgetData())
//}
