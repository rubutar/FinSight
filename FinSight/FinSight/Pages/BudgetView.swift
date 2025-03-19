//
//  BudgetView.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 17/03/25.
//

import SwiftUI

struct BudgetView: View {
    @State private var rentAmount: String = ""

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
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .background(Color("bgColor3"))
            .cornerRadius(10)
            
            Form{
                Section(header: Text("Incomes")) {
                    HStack{
                        Text("Stipend")
                        TextField("Rp. 5.700.000", text: $rentAmount)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                    HStack{
                        Text("Others")
                        TextField("Rp. 0", text: $rentAmount)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                }
                Section(header: Text("Fixed Expenses")) {
                    HStack{
                        Text("Rent")
                        TextField("Rp. 700.000", text: $rentAmount)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                    HStack{
                        Text("Water")
                        TextField("Rp. 200.000", text: $rentAmount)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                    HStack{
                        Text("Electricity")
                        TextField("Rp. 200.000", text: $rentAmount)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                    HStack{
                        Text("Others")
                        TextField("Rp. 0", text: $rentAmount)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 1, trailing: 15))

                Section(header: Text("Savings")) {
                    HStack{
                        Text("Savings")
                        TextField("Rp. 500.000", text: $rentAmount)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 1, trailing: 15))

                Section(header: Text("Budgets")) {
                    Text("Based on calculation, your monthly budget for the other expense will be:")
                    Text("Rp. 3.500.000")
                        .bold()
                        .font(.title)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 1, trailing: 15))
            }

            
            NavigationLink(destination: InsightPage()) {
                Text("Get the Insights")
                    .font(.title2 .bold())
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(Color("bgColor3"))
            .cornerRadius(20)
        }
    }
}

#Preview {
    BudgetView()
}
