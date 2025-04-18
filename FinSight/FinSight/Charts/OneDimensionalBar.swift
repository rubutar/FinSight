//
// Copyright © 2022 Swift Charts Examples.
// Open Source - MIT License

import SwiftUI
import Charts
import SwiftData

struct OneDimensionalBar: View {
    //    var isOverview: Bool
    var currentMonth: String = GetCurrentMonthUtil()
    @Query var expensesData: [ExpenseData]
    @Query var budgetData: [BudgetData]
    var totalExpenses: Double {
        expensesData.reduce(0) { $0 + $1.amount }
    }
    var totalByCategory: [String: Double] {
        Dictionary(grouping: expensesData, by: { $0.category })
            .mapValues { $0.reduce(0) { $0 + $1.amount } }
    }
    var monthlyBudget: Double {
        budgetData.first?.monthly_budget ?? 0
    }
    @State private var showLegend = true
    
    
    // Variables for each category (defaulting to 0 if no data)
    var totalFood: Double { totalByCategory["Food"] ?? 0 }
    var totalShopping: Double { totalByCategory["Transport"] ?? 0 }
    var totalTransport: Double { totalByCategory["Utilities"] ?? 0 }
    var totalOthers: Double { totalByCategory["Entertainment"] ?? 0 }
    
    private var categoryTotals: [(category: String, amount: Double)] {
        [
            ("Food", totalFood),
            ("Transport", totalShopping),
            ("Utilities", totalTransport),
            ("Entertainment", totalOthers)
        ]
    }
        
    
    var body: some View {
        VStack {
            HStack {
                Text(currentMonth)
                Spacer()
                Text("Rp. \(totalExpenses, specifier: "%.0f") of Rp. \(monthlyBudget, specifier: "%.0f") spent")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            chart
        }
    }
    
    private var chart: some View {
        Chart(categoryTotals, id: \.category) { element in
            Plot {
                BarMark(
                    x: .value("Data Size", element.amount)
                )
                .foregroundStyle(by: .value("Data Category", element.category))
            }
            .accessibilityLabel(element.category)
            .accessibilityValue("Rp. \(element.amount, specifier: "%.1f")")
        }
        .chartPlotStyle { plotArea in
            plotArea
#if os(macOS)
                .background(Color.gray.opacity(0.2))
#else
                .background(Color(.systemFill))
#endif
                .cornerRadius(8)
        }
        .accessibilityChartDescriptor(self)
        .chartXAxis(.hidden)
        .chartXScale(domain: 0...Int(monthlyBudget))
        .chartYScale(range: .plotDimension(endPadding: -8))
        .chartLegend(position: .bottom, spacing: 8)
        .chartLegend(showLegend ? .visible : .hidden)
        .frame(height: 50)
    }
}

// MARK: - Accessibility

extension OneDimensionalBar: AXChartDescriptorRepresentable {
    func makeChartDescriptor() -> AXChartDescriptor {
        let min = expensesData.map(\.amount).min() ?? 0
        let max = expensesData.map(\.amount).max() ?? 0
        
        let xAxis = AXCategoricalDataAxisDescriptor(
            title: "Category",
            categoryOrder: expensesData.map { $0.category }
        )
        
        let yAxis = AXNumericDataAxisDescriptor(
            title: "Size",
            range: Double(min)...Double(max),
            gridlinePositions: []
        ) { value in "\(String(format:"%.2f", value)) GB" }
        
        let series = AXDataSeriesDescriptor(
            name: "Data Usage Example",
            isContinuous: false,
            dataPoints: expensesData.map {
                .init(x: $0.category, y: $0.amount)
            }
        )
        
        return AXChartDescriptor(
            title: "Data Usage by category",
            summary: nil,
            xAxis: xAxis,
            yAxis: yAxis,
            additionalAxes: [],
            series: [series]
        )
    }
}

// MARK: - Preview

struct OneDimensionalBar_Previews: PreviewProvider {
    static var previews: some View {
        OneDimensionalBar()
    }
}
