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
                Text("Incomes")
                    .accessibilityHeading(.h2)
                    .bold()
                HStack {
                    Text("Stipend")
                    Spacer()
                    TextField("Rp. 5.700.000", text: .constant(""))
                }
                HStack {
                    Text("Other Income")
                    Spacer()
                    TextField("Rp. 0", text: .constant(""))
                }
            }
            .frame(minHeight: 100, maxHeight: 150)
            Form{
                Text("Fixed Expenses")
                    .accessibilityHeading(.h2)
                    .bold()
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
            .frame(minHeight: 100, maxHeight: .infinity)

            Form{
                Text("Savings")
                    .accessibilityHeading(.h2)
                    .bold()
                
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
