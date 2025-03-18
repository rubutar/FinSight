import SwiftUI

struct TextFieldWithLabelDate: View {
    var label: String
    @Binding var inputDate: Date
    @State private var showDatePicker: Bool = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var startOfMonth: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: Date())
        return calendar.date(from: components) ?? Date()
    }
    
    var endOfMonth: Date {
        let calendar = Calendar.current
        let nextMonth = calendar.date(byAdding: .month, value: 1, to: startOfMonth) ?? Date()
        return calendar.date(byAdding: .day, value: -1, to: nextMonth) ?? Date()
    }
    
    var body: some View {
        //        Text("Tapped: \(showDatePicker ? "Yes" : "No")").padding()
        HStack {
            Text(label)
                .frame(width: 70,alignment: .leading)
                .font(.body)
            Spacer()
            Text(dateFormatter.string(from: inputDate))
                .font(.body)
                .onTapGesture {
                    withAnimation {
                        showDatePicker.toggle()
                    }
                    
                }
        }
        if showDatePicker {
            DatePicker(
                "",
                selection: $inputDate,
                in: startOfMonth...endOfMonth,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .transition(.move(edge: .top))
        }
    }
}
