import SwiftUI

struct TextFieldWithLabel: View {
    var label: String
    var inputPlaceholder: String
    @Binding var inputValue: String // Binding ke nilai input
    var keyboardType: UIKeyboardType = .default
    
    // Format mata uang (IDR)
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "IDR" // Sesuaikan dengan IDR
        return formatter
    }()
    
    
    var body: some View {
        HStack {
            Text(label)
                .frame(width: 70, alignment: .leading)
                .font(.body)
            Spacer()
            TextField(inputPlaceholder, text: $inputValue)
                .multilineTextAlignment(.trailing)
                .keyboardType(keyboardType) // Memastikan hanya angka yang bisa dimasukkan
        }
    }
}

