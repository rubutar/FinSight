import SwiftUI
import SwiftData

struct MainView: View {
    @Query private var budgetData: [BudgetData]
    @State private var isLastUpdateLessThanThisMonth: Bool = true
    
    var body: some View {
        VStack {
            if isLastUpdateLessThanThisMonth {
                BudgetView()
            } else {
                InsightPage()
            }
        }
        .onAppear {
            validateMenu()
        }
    }
    
    func validateMenu() {
        if !budgetData.isEmpty {
            if let firstItem = budgetData.first {
                let currentDate = Date()
                print("date on data: \(firstItem.created_at) , date now: \(currentDate)")
                isLastUpdateLessThanThisMonth = isMonthLessThanCurrent(date: firstItem.created_at)
            } else {
                print("data ada tapi createdAt tidak terbaca")
            }
        } else {
            print("kosong")
        }
    }
}
