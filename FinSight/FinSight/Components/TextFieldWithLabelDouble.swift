import SwiftUI

struct TextFieldWithLabelDouble: View {
    var label: String
    var inputPlaceholder: String
    @Binding var inputValue: Double
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        HStack {
            Text(label)
                .frame(width: 70, alignment: .leading)
                .font(.body)
            Spacer()
            TextField(inputPlaceholder, value: $inputValue, format: .currency(code: "IDR"))
                .multilineTextAlignment(.trailing)
                .keyboardType(keyboardType)
        }
    }
}

