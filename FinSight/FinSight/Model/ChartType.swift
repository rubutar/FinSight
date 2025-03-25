//
// Copyright © 2022 Swift Charts Examples.
// Open Source - MIT License

import SwiftUI

enum ChartCategory: String, CaseIterable, Hashable, Identifiable {
    case apple

	var id: String { self.rawValue }

	var sfSymbolName: String {
		switch self {
        case .apple:
            return "applelogo"
		}
	}
}

enum ChartType: String, Identifiable, CaseIterable {
    // Apple
    case oneDimensionalBar

	var id: String { self.rawValue }

    var title: String {
        switch self {
        case .oneDimensionalBar:
            return "iPhone Storage"
        
        }
    }

    var category: ChartCategory {
        switch self {
        case .oneDimensionalBar:
            return .apple
        }
    }

    var view: some View {
        overviewOrDetailView(isOverview: true)
    }
    
    var chartDescriptor: AXChartDescriptor? {
        // Return the chart descriptor based on the current view type.
            // TODO: Use protocol conformance for chart generation to eliminate the need for manual switch cases.
            if case .oneDimensionalBar = self {
                return OneDimensionalBar().makeChartDescriptor()
            }
            return nil
    }

    var detailView: some View {
        overviewOrDetailView(isOverview: false)
    }

    @ViewBuilder
    private func overviewOrDetailView(isOverview: Bool) -> some View {
        if isOverview {
            // Return the overview version of the view
            Text("Overview View")
        } else {
            if case .oneDimensionalBar = self {
                OneDimensionalBar()
            } else {
                Text("Default Case")
            }
        }
    }
}
