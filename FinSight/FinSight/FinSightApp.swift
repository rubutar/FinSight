//
//  FinSightApp.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 17/03/25.
//

import SwiftUI
import SwiftData

@main
struct FinSightApp: App {
    var sharedModelContainer: ModelContainer = {
            let schema = Schema([
                ExpenseData.self,
                BudgetData.self,
                Item.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
    
    var body: some Scene {
        WindowGroup {
//            BudgetView()
//            TransactionPage()
//                .modelContainer(for: ExpenseData.self, inMemory: true)
            MainView()
                .modelContainer(sharedModelContainer)
        }
    }
}
