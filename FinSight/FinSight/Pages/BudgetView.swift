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
    @State private var isAlertBudget : Bool = false
    
    // Placeholder
    var stipenPlaceholder: String = "Input Stipen"
    var otherIncomePlaceholder: String = "Input Others Income"
    var rentPlaceholder: String = "Input Rent Budget"
    var waterPlaceholder: String = "Input Water Budget"
    var electricityPlaceholder: String = "Input Electricity Budget"
    var otherExpensesPlaceholder: String = "Input Other Expenses Budget"
    var savingPlaceholder: String = "Input Saving Budget"
    
    @State var test: Int = 0
    @State private var input: String = ""
    
    private var currencyFormatter: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencyCode = "IDR" // Kode mata uang IDR
            formatter.currencySymbol = "Rp" // Mengatur simbol rupiah
            formatter.groupingSeparator = "."
            formatter.groupingSize = 3
            formatter.minimumFractionDigits = 0 // Menentukan jumlah angka desimal (opsional)
            formatter.maximumFractionDigits = 0
            return formatter
        }
    
    @State var stipenInput : String = ""
    @State var incomeInput : String = ""
    @State var rentInput : String = ""
    @State var savingInput : String = ""
    
    @State var foodSuggested : Int = 0
    @State var transportSuggested : Int = 0
    @State var utilitiesSuggested : Int = 0
    @State var entertaimentSuggested : Int = 0
    @State var savingSuggested : Int = 0
    @State var isCalculated : Bool = false
    
    let columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        NavigationStack(){
            ScrollView{
                //------------- check stored data
                //                ForEach(budgetData) { storedBudgetData in
                //                    Text("monthly_budget at \(storedBudgetData.monthly_budget)")
                //                }
                //                Text("Incomes \(budgetData.count) ")
                //-------------
                Text("Incomes")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                VStack{
                    HStack {
                        
                        Text("Stipend")
                            .frame(width: 70, alignment: .leading)
                            .font(.body)
                        Spacer()
                        TextField("Rp 5.700.000", text: $stipenInput)
                            .keyboardType(.numberPad)
                            .onChange(of: stipenInput) { newValue in
                                // Hapus karakter selain angka
                                let cleanedInput = newValue.filter { $0.isNumber }
                                if let number = Int(cleanedInput) {
                                    // Format angka dengan menggunakan formatter mata uang
                                    stipenInput = currencyFormatter.string(from: NSNumber(value: number)) ?? ""
                                } else {
                                    stipenInput = ""
                                }
                            }
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Text("Income")
                            .frame(width: 70, alignment: .leading)
                            .font(.body)
                        Spacer()
                        TextField("Rp 0", text: $incomeInput)
                            .keyboardType(.numberPad)
                            .onChange(of: incomeInput) { newValue in
                                // Hapus karakter selain angka
                                let cleanedInput = newValue.filter { $0.isNumber }
                                if let number = Int(cleanedInput) {
                                    // Format angka dengan menggunakan formatter mata uang
                                    incomeInput = currencyFormatter.string(from: NSNumber(value: number)) ?? ""
                                } else {
                                    incomeInput = ""
                                }
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
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                VStack{
                    HStack {
                        Text("Rent")
                            .frame(width: 70, alignment: .leading)
                            .font(.body)
                        Spacer()
                        TextField("Rp 700.000", text: $rentInput)
                            .keyboardType(.numberPad)
                            .onChange(of: rentInput) { newValue in
                                // Hapus karakter selain angka
                                let cleanedInput = newValue.filter { $0.isNumber }
                                if let number = Int(cleanedInput) {
                                    // Format angka dengan menggunakan formatter mata uang
                                    rentInput = currencyFormatter.string(from: NSNumber(value: number)) ?? ""
                                } else {
                                    rentInput = ""
                                }
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
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                VStack{
                    HStack {
                        Text("Savings")
                            .frame(width: 70, alignment: .leading)
                            .font(.body)
                        Spacer()
                        
                        TextField("Rp 500.000", text: $savingInput)
                            .keyboardType(.numberPad)
                            .onChange(of: savingInput) { newValue in
                                // Hapus karakter selain angka
                                let cleanedInput = newValue.filter { $0.isNumber }
                                if let number = Int(cleanedInput) {
                                    // Format angka dengan menggunakan formatter mata uang
                                    savingInput = currencyFormatter.string(from: NSNumber(value: number)) ?? ""
                                } else {
                                    savingInput = ""
                                }
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
                
                Button(action: updateBudget) {
                    Text("Calculate")
                }.foregroundStyle(Color("bgThemeGreen"))
                    .font(.subheadline .bold())
                    .padding()
                    .background(Color("bgColor5"))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                
                Spacer()
                Spacer()
                
                if isCalculated {
                    VStack{
                        Text("Based on calculation, your monthly budget for the other expense will be:")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Text(monthlyBudget, format: .currency(code: "IDR"))
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(Color(.bgThemeGreen))
                        Spacer()
                        Spacer()
                        Text("Suggested budget :")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        VStack {
                            HStack(alignment: .center) {
                                Image(systemName: "fork.knife.circle")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color(.bgThemeGreen))
                                    .padding(.trailing, 5)
                                
                                VStack(alignment: .leading) {
                                    Text("Food")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text("Rp \(foodSuggested)")
                                        .font(.title3)
                                }
                                
                                VStack(alignment: .trailing) {
                                    Text("20%")
                                        .font(.headline)
                                }.frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            Spacer()
                            Spacer()
                            HStack(alignment: .top) {
                                Image(systemName: "fork.knife.circle")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color(.bgThemeGreen))
                                    .padding(.trailing, 5)
                                
                                VStack(alignment: .leading) {
                                    Text("Transport")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text("Rp \(transportSuggested)")
                                        .font(.title3)
                                }
                                
                                VStack(alignment: .trailing) {
                                    Text("10%")
                                        .font(.headline)
                                }.frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            Spacer()
                            Spacer()
                            HStack(alignment: .top) {
                                Image(systemName: "fork.knife.circle")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color(.bgThemeGreen))
                                    .padding(.trailing, 5)
                                
                                VStack(alignment: .leading) {
                                    Text("Utilities")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text("Rp \(utilitiesSuggested)")
                                        .font(.title3)
                                }
                                
                                VStack(alignment: .trailing) {
                                    Text("20%")
                                        .font(.headline)
                                }.frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            Spacer()
                            Spacer()
                            HStack(alignment: .top) {
                                Image(systemName: "fork.knife.circle")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color(.bgThemeGreen))
                                    .padding(.trailing, 5)
                                
                                VStack(alignment: .leading) {
                                    Text("Entertaiment")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text("Rp \(entertaimentSuggested)")
                                        .font(.title3)
                                }
                                
                                VStack(alignment: .trailing) {
                                    Text("30%")
                                        .font(.headline)
                                }.frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            Spacer()
                            Spacer()
                            HStack(alignment: .top) {
                                Image(systemName: "fork.knife.circle")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color(.bgThemeGreen))
                                    .padding(.trailing, 5)
                                
                                VStack(alignment: .leading) {
                                    Text("Saving")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text("Rp \(savingSuggested)")
                                        .font(.title3)
                                }
                                
                                VStack(alignment: .trailing) {
                                    Text("20%")
                                        .font(.headline)
                                }.frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            
                            
                            
                        }
                        .padding(.vertical)
                    }
                    .padding()
                    .background(Color("bgColor5"))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    
                    
                    Spacer()
                    Spacer()
                    Button(action: validate) {
                        Text("Get the Insights")
                            .font(.title2 .bold())
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("bgThemeGreen"))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }.foregroundStyle(Color(.white))
                    
                }
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
            .navigationTitle("Budget")
        }.alert("Budget Cannot Be Negative",isPresented: $isBudgetNegative, actions:{
            Button("OK") {}
        },message: {
            Text("To ensure accurate financial tracking, please set your budget to a positive value. Negative budgets can lead to incorrect calculations.")
        })
        
        .alert("Budget Cannot Be Empty",isPresented: $isAlertBudget, actions:{
            Button("OK") {}
        },message: {
            Text("Please fill out all the fields in the form to receive the calculated budget.")
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
        if !stipenInput.isEmpty && !incomeInput.isEmpty && !rentInput.isEmpty && !savingInput.isEmpty {
            if let firstItem = budgetData.first{
                monthlyBudget = CalculateBudget(stipenAmount: Double(stipenInput) ?? 0.0, otherIncomeAmount: Double(incomeInput) ?? 0.0, rentAmount: Double(incomeInput) ?? 0.0,savingAmount: Double(savingInput) ?? 0.0)
                print("monthlyBudget \(monthlyBudget)")
                firstItem.stipen = Double(stipenInput) ?? 0.0
                firstItem.income = Double(incomeInput) ?? 0.0
                firstItem.rent = Double(incomeInput) ?? 0.0
                firstItem.water = waterAmount
                firstItem.electricity = electricityAmount
                firstItem.others = otherExpensesAmount
                firstItem.savings = Double(savingInput) ?? 0.0
                firstItem.monthly_budget = monthlyBudget
                
                foodSuggested = Int(monthlyBudget * 0.2)
                transportSuggested = Int(monthlyBudget * 0.1)
                utilitiesSuggested = Int(monthlyBudget * 0.2)
                entertaimentSuggested = Int(monthlyBudget * 0.3)
                savingSuggested = Int(monthlyBudget * 0.2)
            } else {
                addBudget()
            }
            isCalculated = true
        } else {
            isCalculated = false
            isAlertBudget = true
        }
    }
    
    func addBudget(){
        monthlyBudget = CalculateBudget(stipenAmount: stipenAmount, otherIncomeAmount: otherIncomeAmount, rentAmount: rentAmount,savingAmount: savingAmount)
        
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
