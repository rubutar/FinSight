import SwiftUI
import SwiftData

struct InsightPage: View {
    @Query private var budgetData: [BudgetData]
    @Query var expensesData: [ExpenseData]
    var totalExpenses: Double {
        expensesData.reduce(0) { $0 + $1.amount }
    }
    var totalByCategory: [String: Double] {
        Dictionary(grouping: expensesData, by: { $0.category })
            .mapValues { $0.reduce(0) { $0 + $1.amount } }
    }
    
    var body: some View {
        // Version 1 - white bacground
        ScrollView{
            OneDimensionalBar(isOverview: true).padding()
            Text("Total Expenses: \(totalExpenses, format: .currency(code: "IDR"))")
                .bold()
            ForEach(totalByCategory.sorted(by: { $0.key < $1.key }), id: \.key) { category, total in
                var percentage: Double { total / totalExpenses * 100 }
                HStack {
                    Text("\(category) \(percentage.rounded(.down), specifier: "%.0f")%")
                    Spacer()
                    Text("\(total, format: .currency(code: "IDR"))")
                }
            }
            
            
            ForEach(0..<1) { number in
                GroupBox(label: Text("Motivation")) {
                    Text("Stay focus on the plan")
                }.padding()
                GroupBox(label: Text("Summary")) {
                    Text("Based on calculation, your other expense budget is Rp 3.500.000/month")
                }.padding()
            }
            Spacer()
            NavigationLink(destination: TransactionPage()) {
                Text("View Transaction")
            }.buttonStyle(.bordered)
            Spacer()
            //                NavigationLink(destination: BudgetPage()) {
            //                    Text("Budget")
            //                }.buttonStyle(.bordered)
            
            
        }.navigationTitle("Insights")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: BudgetView()){
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Back")
                        }
                    }
                }
            }
    }
}

#Preview {
    InsightPage()
}
