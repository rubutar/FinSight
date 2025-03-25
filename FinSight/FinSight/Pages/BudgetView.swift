//
//  BudgetView.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 17/03/25.
//

import SwiftUI
import SwiftData

struct BudgetView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var budgetData: [BudgetData]
    @Query private var items: [Item]
    
    @State var stipenAmount: Double = 5_700_000
    @State var otherIncomeAmount: Double = 0.0
    @State var rentAmount: Double = 700_000
    @State var waterAmount: Double = 200_000
    @State var electricityAmount: Double = 200_000
    @State var otherExpensesAmount: Double = 200_000
    @State var savingAmount: Double = 500_000
    @State var monthlyBudget: Double = 3_500_000
    
    @State private var greeting: String = "Hello world!"
    @State private var showInsightView = false
    @State private var isBudgetNegative: Bool = false
    
    // Placeholder
    var stipenPlaceholder: String = "Input Stipen"
    var otherIncomePlaceholder: String = "Input Others Income"
    var rentPlaceholder: String = "Input Rent Budget"
    var waterPlaceholder: String = "Input Water Budget"
    var electricityPlaceholder: String = "Input Electricity Budget"
    var otherExpensesPlaceholder: String = "Input Other Expenses Budget"
    var savingPlaceholder: String = "Input Saving Budget"
    
    
    var body: some View {
        NavigationStack(){
            Spacer()
            VStack{
                HStack{
                    Image("Image")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("FinSight")
                        .foregroundStyle(Color(.white))
                        .font(.title)
                        .fontWeight(.semibold)
                }
                Text("Smart Budgeting, Clear Insights. Track your expenses, manage your budget, and gain valuable financial insights effortlessly!")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding([.bottom])
            }
            .background(Color("bgThemeGreen"))
            .cornerRadius(10)
            .padding(.horizontal)
            ScrollView{
                Spacer()
                //------------- check stored data
                //                ForEach(budgetData) { storedBudgetData in
                //                    Text("monthly_budget at \(storedBudgetData.monthly_budget)")
                //                }
                //                Text("Incomes \(budgetData.count) ")
                //-------------
                Text("Incomes")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                VStack{
                    HStack {
                        Text("Stipend")
                            .frame(width: 70, alignment: .leading)
                            .font(.body)
                        Spacer()
                        TextField(stipenPlaceholder, value: $stipenAmount, format: .currency(code: "IDR"))
                            .keyboardType(.decimalPad)
                            .onSubmit {
                                updateBudget()
                            }
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Text("Income")
                            .frame(width: 70, alignment: .leading)
                            .font(.body)
                        Spacer()
                        TextField(otherIncomePlaceholder, value: $otherIncomeAmount, format: .currency(code: "IDR"))
                            .keyboardType(.decimalPad)
                            .onSubmit {
                                updateBudget()
                            }
                            .multilineTextAlignment(.trailing)
                    }
                    
                }
                .padding()
                .background(Color("bgColor5"))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Spacer()
                Spacer()
                
                Text("Fixed Expenses")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                VStack{
                    HStack {
                        Text("Rent")
                            .frame(width: 70, alignment: .leading)
                            .font(.body)
                        Spacer()
                        TextField(rentPlaceholder, value: $rentAmount, format: .currency(code: "IDR"))
                            .keyboardType(.decimalPad)
                            .onSubmit {
                                updateBudget()
                            }
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Water")
                            .frame(width: 70, alignment: .leading)
                            .font(.body)
                        Spacer()
                        TextField(waterPlaceholder, value: $waterAmount, format: .currency(code: "IDR"))
                            .keyboardType(.decimalPad)
                            .onSubmit {
                                updateBudget()
                            }
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Electric")
                            .frame(width: 70, alignment: .leading)
                            .font(.body)
                        Spacer()
                        TextField(electricityPlaceholder, value: $electricityAmount, format: .currency(code: "IDR"))
                            .keyboardType(.decimalPad)
                            .onSubmit {
                                updateBudget()
                            }
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Others")
                            .frame(width: 70, alignment: .leading)
                            .font(.body)
                        Spacer()
                        TextField(otherExpensesPlaceholder, value: $otherExpensesAmount, format: .currency(code: "IDR"))
                            .keyboardType(.decimalPad)
                            .onSubmit {
                                updateBudget()
                            }
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(Color("bgColor5"))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Spacer()
                Spacer()
                
                Text("Savings")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                VStack{
                    HStack {
                        Text("Savings")
                            .frame(width: 70, alignment: .leading)
                            .font(.body)
                        Spacer()
                        TextField(savingPlaceholder, value: $savingAmount, format: .currency(code: "IDR"))
                            .keyboardType(.decimalPad)
                            .onSubmit {
                                updateBudget()
                            }
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(Color("bgColor5"))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Spacer()
                Spacer()
                
                VStack{
                    Text("Based on calculation, your monthly budget for the other expense will be:")
                    Spacer()
                    Text(monthlyBudget, format: .currency(code: "IDR"))
                        .bold()
                        .font(.title)
                }
                .padding()
                .background(Color("bgColor5"))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Button(action: updateBudget) {
                    Text("Calculate")
                }.foregroundStyle(Color(.white))
                    .font(.title2 .bold())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("bgThemeGreen"))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Spacer()
                Spacer()
                Button(action: validate) {
                    Text("Get the Insights")
                }.foregroundStyle(Color(.white))
                    .font(.title2 .bold())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("bgThemeGreen"))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
            }
            .onAppear {
                //                printBudgetData()
                // Check if there's data in the database when the view appears
                if let firstItem = budgetData.first {
                    // If data exists, set stipenAmount from the database
                    print("tanggal di buat : \(firstItem.created_at)")
                    stipenAmount = firstItem.stipen
                    otherIncomeAmount = firstItem.income
                    rentAmount = firstItem.rent
                    waterAmount = firstItem.water
                    electricityAmount = firstItem.electricity
                    otherExpensesAmount = firstItem.others
                    savingAmount = firstItem.savings
                    monthlyBudget = firstItem.monthly_budget
                } else {
                    // add initial data
                    addBudget()
                }
            }
            .toolbar {
                //                ToolbarItem(placement: .navigationBarTrailing) {
                //                    NavigationLink("Next"){
                //                        InsightPage()
                //                    }.foregroundStyle(Color("bgThemeGreen"))
                //                    HStack{
                //                        Button(action: updateBudget) {
                //                            Label("Add Item", systemImage: "square.and.arrow.down")
                //                        }
                //                        Button(action: deleteAllData) {
                //                            Label("Add Item", systemImage: "minus.circle")
                //                        }
                //                        Button(action: addBudget) {
                //                            Label("Add Item", systemImage: "plus")
                //                        }
                //                    }
                //                }
            }
            .navigationDestination(isPresented: $showInsightView) {
                InsightPage()
            }
            .navigationBarBackButtonHidden(true)
        }.alert("Budget Cannot Be Negative",isPresented: $isBudgetNegative, actions:{
            Button("OK") {}
        },message: {
            Text("To ensure accurate financial tracking, please set your budget to a positive value. Negative budgets can lead to incorrect calculations.")
        })
        
    }
    func validate(){
        if Int(monthlyBudget) < 0 {
            isBudgetNegative = true
        } else {
            print("data positif")
            showInsightView = true
            isBudgetNegative = false
            
        }
    }
    func printBudgetData() {
        if budgetData.isEmpty {
            print("No data found in budgetData")
        } else {
            for (index, data) in budgetData.enumerated() {
                print("BudgetData \(index + 1): \(data)")
            }
        }
    }
    
    func updateBudget(){
        if let firstItem = budgetData.first{
            monthlyBudget = CalculateBudget(stipenAmount: stipenAmount, otherIncomeAmount: otherIncomeAmount, rentAmount: rentAmount, waterAmount: waterAmount, electricityAmount: electricityAmount, otherExpensesAmount: otherExpensesAmount, savingAmount: savingAmount)
            
            firstItem.stipen = stipenAmount
            firstItem.income = otherIncomeAmount
            firstItem.rent = rentAmount
            firstItem.water = waterAmount
            firstItem.electricity = electricityAmount
            firstItem.others = otherExpensesAmount
            firstItem.savings = savingAmount
            firstItem.monthly_budget = monthlyBudget
        } else {
            addBudget()
        }
    }
    
    func addBudget(){
        monthlyBudget = CalculateBudget(stipenAmount: stipenAmount, otherIncomeAmount: otherIncomeAmount, rentAmount: rentAmount, waterAmount: waterAmount, electricityAmount: electricityAmount, otherExpensesAmount: otherExpensesAmount, savingAmount: savingAmount)
        
        let tambahData = BudgetData(
            stipen:stipenAmount,income:otherIncomeAmount, rent:rentAmount, water:waterAmount, electricity:electricityAmount, others:otherExpensesAmount, savings:savingAmount, monthly_budget:monthlyBudget
        )
        modelContext.insert(tambahData)
    }
    
    func deleteAllData() {
        // Menghapus semua data dari `budgetData`
        for item in budgetData {
            modelContext.delete(item)
        }
        
        // Menyimpan perubahan ke dalam model context setelah penghapusan
        do {
            try modelContext.save()
        } catch {
            print("Failed to delete all data: \(error)")
        }
    }
}

#Preview {
    BudgetView()
}
