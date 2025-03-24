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
            ScrollView{
                VStack{
                    Text("FinSight")
                        .foregroundStyle(Color(.white))
                        .font(.title)
                        .fontWeight(.semibold)
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
                
                Spacer()
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
                    // v1
//                    TextFieldWithLabelDouble(label:"Stipend",inputPlaceholder: stipenPlaceholder,inputValue:$stipenAmount,keyboardType: .decimalPad)
//                    TextFieldWithLabelDouble(label:"Income",inputPlaceholder: otherIncomePlaceholder,inputValue:$otherIncomeAmount,keyboardType: .decimalPad)
                    
                    // v2
//                    TextFieldWithLabel2(label:"Stipend",inputPlaceholder: stipenPlaceholder,inputValue:$stipenAmount,keyboardType: .decimalPad, onEditingChanged: { _ in
//                        updateBudget()
//                    })
//                    TextFieldWithLabel2(label:"Income",inputPlaceholder: otherIncomePlaceholder,inputValue:$otherIncomeAmount,keyboardType: .decimalPad, onEditingChanged: { _ in
//                        updateBudget()
//                    })
                    
                    // v3
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
//                    TextFieldWithLabelDouble(label:"Rent",inputPlaceholder: rentPlaceholder,inputValue: $rentAmount,keyboardType: .decimalPad)
//                    TextFieldWithLabelDouble(label:"Water",inputPlaceholder: waterPlaceholder,inputValue: $waterAmount,keyboardType: .decimalPad)
//                    TextFieldWithLabelDouble(label:"Electric",inputPlaceholder: electricityPlaceholder,inputValue: $electricityAmount,keyboardType: .decimalPad)
//                    TextFieldWithLabelDouble(label:"Others",inputPlaceholder: otherExpensesPlaceholder,inputValue: $otherExpensesAmount,keyboardType: .decimalPad)
                    
                    // v2
//                    TextFieldWithLabel2(label:"Rent",inputPlaceholder: rentPlaceholder,inputValue:$rentAmount,keyboardType: .decimalPad, onEditingChanged: { _ in
//                        updateBudget()
//                    })
//                    TextFieldWithLabel2(label:"Water",inputPlaceholder: waterPlaceholder,inputValue:$waterAmount,keyboardType: .decimalPad, onEditingChanged: { _ in
//                        updateBudget()
//                    })
//                    TextFieldWithLabel2(label:"Electric",inputPlaceholder: electricityPlaceholder,inputValue:$electricityAmount,keyboardType: .decimalPad, onEditingChanged: { _ in
//                        updateBudget()
//                    })
//                    TextFieldWithLabel2(label:"Others",inputPlaceholder: otherExpensesPlaceholder,inputValue:$otherExpensesAmount,keyboardType: .decimalPad, onEditingChanged: { _ in
//                        updateBudget()
//                    })
                    
                    // v3
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
                    // v1
//                    TextFieldWithLabelDouble(label:"Saving",inputPlaceholder: "Input Amount",inputValue: $savingAmount,keyboardType: .decimalPad)
                    
                    // v2
//                    TextFieldWithLabel2(label:"Saving",inputPlaceholder: savingPlaceholder,inputValue:$savingAmount,keyboardType: .decimalPad, onEditingChanged: { _ in
//                        updateBudget()
//                    })
                    
                    // v3
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
                
                
                Spacer()
                Spacer()
                Button(action: { showInsightView = true }) {
                    Text("Get the Insights")
                }
                .foregroundStyle(Color(.white))
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
