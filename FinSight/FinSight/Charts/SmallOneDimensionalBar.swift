//
//  SmallOneDimensionalBar.swift
//  FinSight
//
//  Created by Rudi Butarbutar on 25/03/25.
//

import SwiftUI

struct SmallOneDimensionalBar: View {
    let spentAmount: Double
    let totalBudget: Double
    
    var progress: Double {
        min(spentAmount / totalBudget, 1.0) // Keeps it within 0-1 range
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Food")
                .font(.headline)
            
            ZStack(alignment: .leading) {
                // Background Bar (Remaining)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 20)
                
                // Foreground Bar (Used)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width: CGFloat(progress) * 150, height: 20)
                
            }
            .frame(width: 150, height: 20, alignment: .leading)
            
            Text("\(Int(progress * 100))%  (Rp. 500.000 of Rp. 1.000.000)")
                    .font(.caption)
                    .foregroundColor(.black)
            }
        .padding()
    }
}



// Example Usage
struct ContentView: View {
    var body: some View {
        SmallOneDimensionalBar(spentAmount: 900_000, totalBudget: 1_000_000)
    }
}

#Preview {
    ContentView()
}
