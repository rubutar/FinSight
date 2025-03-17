//
//  BudgetView.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 17/03/25.
//

import SwiftUI

struct BudgetView: View {
    var body: some View {
        NavigationView {
            HStack {
                Text("Income")
                Spacer()
                TextField("Rp. 5.700.000", text: .constant(""))
            }
            
            
                .navigationTitle("Budget")
        }
    }
}

#Preview {
    BudgetView()
}
