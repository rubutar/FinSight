//
//  BudgetView.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 17/03/25.
//

import SwiftUI

struct BudgetView: View {
    var body: some View {
        NavigationStack{
            Form{
                HStack {
                    Text("Income")
                    Spacer()
                    TextField("Rp. 5.700.000", text: .constant(""))
                }
            }
            Form{
                Text("Fixed Expenses")
                    .accessibilityHeading(.h2)
                HStack {
                    Text("Rent")
                    Spacer()
                    TextField("Rp. 700.000", text: .constant(""))
                }
                HStack {
                    Text("Electricity")
                    Spacer()
                    TextField("Rp. 200.000", text: .constant(""))
                }
                HStack {
                    Text("Water")
                    Spacer()
                    TextField("Rp. 200.000", text: .constant(""))
                }
                HStack {
                    Text("Others")
                    Spacer()
                    TextField("Rp. 200.000", text: .constant(""))
                }
            }
            Form{
                Text("Savings")
                    .accessibilityHeading(.h2)
                
                HStack {
                    Text("Others")
                    Spacer()
                    TextField("Rp. 200.000", text: .constant(""))
                    
                }
            }
            NavigationLink(destination: ContentView()) {
                Text("Save & Continue")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .cornerRadius(10)
            }
            .padding()
            .navigationTitle("Budget")
        }
    }
}

#Preview {
    BudgetView()
}
