import SwiftUI

struct InsightPage: View {
    @State var currentMonth: String = GetCurrentMonthUtil()
    
    var body: some View {
        NavigationStack{
            ScrollView{
//                OneDimensionalBar(isOverview: true, label: currentMonth).padding()
                ForEach(0..<1) { number in
                    GroupBox(label: Text("Motivation")) {
                        Text("Stay focus on the plan")
                    }.padding()
                    GroupBox(label: Text("Summary")) {
                        Text("Based on calculation, your other expense budget is Rp 3.500.000/month")
                    }.padding()
                }
                NavigationLink(destination: TransactionPage()) {
                    Text("View History")
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
                        NavigationLink() {
                            // destination view to navigation to
                            AddExpenseView(destinationNumber: 1)
                        } label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.gray)
                        }
                    }
                }
        }
    }
}

#Preview {
    InsightPage()
//        .modelContainer(for: Item.self, inMemory: true)
}
