import SwiftUI
import SwiftData

struct MainView: View {
    @Query private var budgetData: [BudgetData]
    @State private var isLastUpdateLessThanThisMonth: Bool = false
    
    var body: some View {
        NavigationStack{
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
    }
    
    func validateMenu() {
        if !budgetData.isEmpty {
            if let firstItem = budgetData.first {
                let currentDate = Date()
                isLastUpdateLessThanThisMonth = isMonthLessThanCurrent(date: firstItem.created_at)
                print("date on data: \(firstItem.created_at) , date now: \(currentDate) , isLastUpdateLessThanThisMonth \(isLastUpdateLessThanThisMonth)")
            } else {
                print("data ada tapi createdAt tidak terbaca")
            }
        } else {
            isLastUpdateLessThanThisMonth = true
            print("kosong, \(isLastUpdateLessThanThisMonth)")
        }
    }
}
