//
//  BudgetView.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 17/03/25.
//

import SwiftUI
import SwiftData
import Combine

struct BudgetView: View {
    @Environment(\.modelContext) var modelContext
    @FocusState private var keyboardIsFocused: Bool
    
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
    
    @State var isCalculated : Bool = false
        
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var isShowInfoBudget: Bool = false

    var stipendValue: Int {
        let cleanedInput = stipenInput.filter { $0.isNumber }
        return Int(cleanedInput) ?? 0
    }
    var incomeValue: Int {
        let cleanedInput = incomeInput.filter { $0.isNumber }
        return Int(cleanedInput) ?? 0
    }
    var rentValue: Int {
        let cleanedInput = rentInput.filter { $0.isNumber }
        return Int(cleanedInput) ?? 0
    }
    
    
    
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
                        
                        TextField("Rp 5.700.000", value: $stipenAmount, format: .currency(code: "IDR"))
                            .keyboardType(.decimalPad)
//                            .onSubmit {
//                                updateBudget()
//                            }
                            .multilineTextAlignment(.trailing)

                    }
                    
                    HStack {
                        Text("Other Incomes")
                            .frame(width: 70, alignment: .leading)
                            .font(.body)
                        Spacer()
                        TextField("Rp 0", value: $otherIncomeAmount, format: .currency(code: "IDR"))
                            .keyboardType(.decimalPad)
//                            .onSubmit {
//                                updateBudget()
//                            }
                            .multilineTextAlignment(.trailing)
                        
//                        TextField("Rp 0", text: $incomeInput)
//                            .keyboardType(.numberPad)
//                            .onReceive(Just(incomeInput)) { newValue in
//                                let cleanedInput = newValue.filter { $0.isNumber }
//                                if let number = Int(cleanedInput) {
//                                    incomeInput = currencyFormatter.string(from: NSNumber(value: number)) ?? ""
//                                } else {
//                                    incomeInput = ""
//                                }
//                            }
//                            .multilineTextAlignment(.trailing)
//                            .padding()
                        
                        //                        TextField("Rp 0", text: $incomeInput)
                        //                            .keyboardType(.numberPad)
                        //                            .onChange(of: incomeInput) { newValue in
                        //                                // Hapus karakter selain angka
                        //                                let cleanedInput = newValue.filter { $0.isNumber }
                        //                                if let number = Int(cleanedInput) {
                        //                                    // Format angka dengan menggunakan formatter mata uang
                        //                                    incomeInput = currencyFormatter.string(from: NSNumber(value: number)) ?? ""
                        //                                } else {
                        //                                    incomeInput = ""
                        //                                }
                        //                            }
                        //                            .multilineTextAlignment(.trailing)
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
                        TextField("Rp 700.000", value: $rentAmount, format: .currency(code: "IDR"))
                            .keyboardType(.decimalPad)
//                            .onSubmit {
//                                updateBudget()
//                            }
                            .multilineTextAlignment(.trailing)
//                        TextField("Rp 700.000", text: $rentInput)
//                            .keyboardType(.numberPad)
//                            .onReceive(Just(rentInput)) { newValue in
//                                let cleanedInput = newValue.filter { $0.isNumber }
//                                if let number = Int(cleanedInput) {
//                                    rentInput = currencyFormatter.string(from: NSNumber(value: number)) ?? ""
//                                } else {
//                                    rentInput = ""
//                                }
//                            }
//                            .multilineTextAlignment(.trailing)
//                            .padding()

                    }
                }
                .padding()
                .background(Color("bgColor5"))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Spacer()
                Spacer()
                
//                Text("Savings")
//                    .font(.title3)
//                    .fontWeight(.bold)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.horizontal)
//                VStack{
//                    HStack {
//                        Text("Savings (%)")
//                            .frame(width: 70, alignment: .leading)
//                            .font(.body)
//                        Spacer()
//                        
//                        TextField("20%", text: $savingInput)
//                            .keyboardType(.numberPad)
//
//                            .multilineTextAlignment(.trailing)
//                            .padding()
//                    }
//                }
//                .padding()
//                .background(Color("bgColor5"))
//                .cornerRadius(10)
//                .padding(.horizontal)
//                
//                Spacer()
//                Spacer()
                
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
                        HStack{
                            Text("Suggested budget :")
                                .font(.headline)
                                .fontWeight(.bold)
                            Button(action: {
                                isShowInfoBudget.toggle()
                            }) {
                                Image(systemName: "info.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
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
                                    Text("Rp \(Int(monthlyBudget*20/100))")
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
                                Image(systemName: "car.circle")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color(.bgThemeGreen))
                                    .padding(.trailing, 5)
                                
                                VStack(alignment: .leading) {
                                    Text("Transport")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text("Rp \(Int(monthlyBudget*10/100))")
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
                                Image(systemName: "bolt.circle")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color(.bgThemeGreen))
                                    .padding(.trailing, 5)
                                
                                VStack(alignment: .leading) {
                                    Text("Utilities")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text("Rp \(Int(monthlyBudget*20/100))")
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
                                Image(systemName: "theatermasks.circle")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color(.bgThemeGreen))
                                    .padding(.trailing, 5)
                                
                                VStack(alignment: .leading) {
                                    Text("Entertaiment")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text("Rp \(Int(monthlyBudget*30/100))")
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
                                Image(systemName: "creditcard.circle")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color(.bgThemeGreen))
                                    .padding(.trailing, 5)
                                
                                VStack(alignment: .leading) {
                                    Text("Saving")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text("Rp \(Int(monthlyBudget*20/100))")
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
                if let firstItem = budgetData.first {
                    stipenAmount = firstItem.stipen
                    otherIncomeAmount = firstItem.income
                    rentAmount = firstItem.rent
                    waterAmount = firstItem.water
                    electricityAmount = firstItem.electricity
                    otherExpensesAmount = firstItem.others
                    savingAmount = firstItem.savings
                    monthlyBudget = firstItem.monthly_budget
                    if !monthlyBudget.isNaN {
                        isCalculated = true
                    }
                } else {
                    // add initial data
//                    addBudget()
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
        
        .sheet(isPresented: $isShowInfoBudget) {
            print("Sheet dismissed!")
        } content: {
            ContentBudgetView()
        }
    }
    
    
    func validate(){
        if Int(monthlyBudget) < 0 {
            isBudgetNegative = true
        } else {
            print("data positif")
            addBudget()
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
        print("updateBudget")
        isCalculated = false
        if !stipenAmount.isNaN && !otherIncomeAmount.isNaN && !rentAmount.isNaN {
            addBudget()
            isCalculated = true
            keyboardIsFocused=false
        } else {
            isCalculated = false
            isAlertBudget = true
        }
    }
    
    func addBudget(){
        monthlyBudget = stipenAmount + otherIncomeAmount - rentAmount
        let tambahData = BudgetData(
            stipen:Double(stipenAmount),income:Double(otherIncomeAmount), rent:Double(rentAmount), water:waterAmount, electricity:electricityAmount, others:otherExpensesAmount, savings:Double(savingAmount), monthly_budget:Double(monthlyBudget)
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
