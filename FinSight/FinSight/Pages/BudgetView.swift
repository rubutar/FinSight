//
//  BudgetView.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 17/03/25.
//

import SwiftUI

struct BudgetView: View {
    var body: some View {
        NavigationStack(){
            Form{
                Text("Incomes")
                    .accessibilityHeading(.h2)
                    .bold()
                HStack{
                    Spacer()
                    Text("Stipend")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Rp. 5.700.000", text: .constant(""))
                        .multilineTextAlignment(.trailing)
                        .frame(width: 150)
                }
                HStack(){
                    Spacer()
                    Text("Others")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Rp. 0", text: .constant(""))
                        .multilineTextAlignment(.trailing)
                        .frame(width: 150)
                }
            }
            .frame(minHeight: 100, maxHeight: 150)
            Form{
                Text("Fixed Expenses")
                    .accessibilityHeading(.h2)
                    .bold()
                HStack {
                    Spacer()
                    Text("Rent")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Rp. 700.000", text: .constant(""))
                        .multilineTextAlignment(.trailing)
                        .frame(width: 150)
                }
                HStack {
                    Spacer()
                    Text("Water")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Rp. 200.000", text: .constant(""))
                        .multilineTextAlignment(.trailing)
                        .frame(width: 150)
                }
                HStack {
                    Spacer()
                    Text("Electricity")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Rp. 200.000", text: .constant(""))
                        .multilineTextAlignment(.trailing)
                        .frame(width: 150)
                }
                HStack {
                    Spacer()
                    Text("Others")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Rp. 0", text: .constant(""))
                        .multilineTextAlignment(.trailing)
                        .frame(width: 150)
                }
            }
            .frame(minHeight: 260)

            Form{
                Text("Savings")
                    .accessibilityHeading(.h2)
                    .bold()
                
                HStack {
                    Spacer()
                    Text("Savings")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Rp. 500.000", text: .constant(""))
                        .multilineTextAlignment(.trailing)
                        .frame(width: 150)
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
