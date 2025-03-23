import SwiftUI

struct TextFieldWithLabel2: View {
    var label: String
    var inputPlaceholder: String
    @Binding var inputValue: Double
    var keyboardType: UIKeyboardType = .default
    var onEditingChanged: ((Bool) -> Void)?
    @State private var textFieldValue: String = ""
    
    var body: some View {
        HStack {
            Text(label)
                .frame(width: 70, alignment: .leading)
                .font(.body)
            Spacer()
//            TextField(inputPlaceholder, value: $inputValue, format: .currency(code: "IDR"))
//                .multilineTextAlignment(.trailing)
//                .keyboardType(keyboardType)
            TextField(inputPlaceholder, text: $textFieldValue, onEditingChanged: { editingChanged in
                            onEditingChanged?(editingChanged)
                        })
                        .keyboardType(keyboardType)
                        .onChange(of: textFieldValue) { newValue in
                            if let value = Double(newValue) {
                                inputValue = value
                            }
                        }.multilineTextAlignment(.trailing)
                .keyboardType(keyboardType)
        }.onAppear {
            textFieldValue = "\(inputValue)"
        }
    }
}

