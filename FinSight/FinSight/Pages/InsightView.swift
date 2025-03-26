import SwiftUI
import SwiftData

struct InsightPage: View {
    @Environment(\.modelContext) var modelContext
    @Query private var budgetData: [BudgetData]
    @Query var expensesData: [ExpenseData]
    @State var messageInsight : String = ""
    @State private var showAddExpenseView = false  // State to control AddExpenseView presentation
    
    
    var savingBudget: Double {
        budgetData.first?.savings ?? 0
    }
    
    var monthlyBudget: Double {
        budgetData.first?.monthly_budget ?? 0
    }
    
    var totalExpenses: Double {
        expensesData.reduce(0) { $0 + $1.amount }
    }
    var totalByCategory: [String: Double] {
        Dictionary(grouping: expensesData, by: { $0.category })
            .mapValues { $0.reduce(0) { $0 + $1.amount } }
    }
    //    private let categories = ["Food", "Shopping", "Transport", "Others"]
    
    private let columns = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var totalByWeekOfMonth: [String: Double] {
        let calendar = Calendar.current
        let groupedByWeek = Dictionary(grouping: expensesData) { transaction -> String in
            let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: transaction.date)!.start
            return dateFormatter.string(from: startOfWeek)
        }
        
        // Calculate the total for each week
        let weeklyTotals = groupedByWeek.mapValues { transactionsInWeek -> Double in
            transactionsInWeek.reduce(0) { $0 + $1.amount }
        }
        print("weeklyTotals: \(weeklyTotals)")
        // Print the results
        //        for (week, total) in weeklyTotals {
        //            print("Week starting \(week): Total = \(total)")
        //        }
        //        print(Array(weeklyTotals)[2])
        return weeklyTotals
    }
    
    
    
    var body: some View {
        GeometryReader { g in
            ScrollView{
                // Version 1 - white bacground
                //        ScrollView{
                OneDimensionalBar()
                    .padding()
                HStack() {
                    Text("    Details")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                VStack(alignment: .center) {
                    SmallOneDimensionalBar()
                    //            LazyVGrid(columns: columns, spacing: 2) {
                    //                ForEach(categories, id: \.self) { category in
                    //                    let total = totalByCategory[category] ?? 0
                    //                    let percentage = totalExpenses > 0 ? (total / totalExpenses * 100).rounded() : 0
                    //                    SmallOneDimensionalBar(spentAmount: 900_000, totalBudget: 1_000_000)
                    //                }
                    //            }
                    
                }.navigationTitle("Insights")
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            NavigationLink(destination: BudgetView()){
                                HStack {
                                    Image(systemName: "chevron.backward")
                                    Text("Budget")
                                }.foregroundStyle(Color("bgThemeGreen"))
                            }
                        }
                        //            }.onAppear(){
                        //                MotivationInsight()
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink {
                                AddExpenseView(expenseData: ExpenseData(amount: 0, note: "", date: Date(), category: "Food"))
                            } label: {
                                Text("Add Expense")
                                    .foregroundColor(.bgThemeGreen)
                            }
                        }
                    }
                VStack(alignment: .leading) {
                    Text("Expenses History")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top, 8)
                    List {
                        ForEach(expensesData) { expenseData in
                            NavigationLink(destination: EditExpenseView(expenseData: expenseData)) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(expenseData.category)
                                            .font(.headline)
                                            .foregroundStyle(Color("bgThemeGreen"))
                                        Spacer()
                                        Text("\(expenseData.amount, format: .currency(code: "IDR"))")
                                            .font(.headline)
                                    }
                                    Text(expenseData.note)
                                        .font(.body)
                                    Text(expenseData.date, format: .dateTime.day().month().year())
                                        .font(.body)
                                }
                                .padding(8)
                                .background(Color("bgColor5"))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .listStyle(.plain)
                    
                    Spacer()
                }
                .frame(width: g.size.width - 5, height: g.size.height - 50, alignment: .center)
            }
        }
    }
    // Function to give each category a fixed color
    func categoryColor(_ category: String) -> Color {
        switch category {
        case "Food": return Color.blue
        case "Shopping": return Color.green
        case "Transport": return Color.orange
        default: return Color.purple
        }
    }
}

#Preview {
    InsightPage()
}
