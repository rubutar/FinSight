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
    private let categories = ["Food", "Shopping", "Transport", "Others"]
    
    private let columns = [
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4)
        ]
    
    var body: some View {
        // Version 1 - white bacground
        ScrollView{
            OneDimensionalBar()
                .padding()
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(categories, id: \.self) { category in
                    let total = totalByCategory[category] ?? 0
                    let percentage = totalExpenses > 0 ? (total / totalExpenses * 100).rounded() : 0

                    VStack(alignment: .leading, spacing: 2) { // Small spacing inside
                        Text("\(category) \(percentage, specifier: "%.0f")%")
                            .font(.footnote)
                        
                        Text("\(total, format: .currency(code: "IDR"))")
                            .font(.caption2)
                            .bold()
                            .foregroundColor(categoryColor(category))
                    }
                    .padding(6)
                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .background(categoryColor(category))
                    .cornerRadius(6)
                }
            }
            .padding(.horizontal, 8)
            
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
func categoryColor(_ category: String) -> Color {
    switch category {
    case "Food": return Color.blue
    case "Shopping": return Color.green
    case "Transport": return Color.orange
    default: return Color.gray
    }
}

}

#Preview {
    InsightPage()
}
