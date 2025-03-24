import SwiftUI
import SwiftData

struct InsightPage: View {
    @Query private var budgetData: [BudgetData]
    
    var body: some View {
        // Version 1 - white bacground
        ScrollView{
            OneDimensionalBar(isOverview: true).padding()
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
            
            
        }.navigationTitle("Insight")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    //                        Button(action: {
                    //                            // Code for button action goes here
                    //                        }) {
                    //                            Image(systemName: "plus.circle")
                    //                        }
//                    NavigationLink() {
//                        // destination view to navigation to
//                        AddExpenseView(destinationNumber: 1)
//                    } label: {
//                        Image(systemName: "plus")
//                            .foregroundColor(.blue)
//                        
//                    }
                }
            }
        
        // Version 2 - grey backgroud
        //        NavigationStack {
        //            Form{
        //                Section{
        //                    OneDimensionalBar(isOverview: true)
        //                }
        //
        //                Section{
        //                    Text("Stay focus on the plan")
        //                }
        //                Section{
        //                    Text("Based on calculation, your other expense budget is Rp 3.500.000/month")
        //                }
        //                Section{
        //                    NavigationLink(destination: TransactionPage()) {
        //                        Text("View Transaction").foregroundColor(.blue)
        //                    }
        //                }
        //            }
        //        }.navigationTitle("Insight")
        //            .navigationBarTitleDisplayMode(.large)
        //            .toolbar {
        //                ToolbarItem(placement: .navigationBarTrailing) {
        //                    NavigationLink() {
        //                        // destination view to navigation to
        //                        AddExpenseView(destinationNumber: 1)
        //                    } label: {
        //                        Image(systemName: "plus")
        //                            .foregroundColor(.blue)
        //                    }
        //                }
        //            }
    }
}

#Preview {
    InsightPage()
    //        .modelContainer(for: ExpenseData.self, inMemory: true)
}
