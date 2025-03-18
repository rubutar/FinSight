import SwiftUI

struct TextFieldWithLabel: View {
    var label : String
    var inputPlaceholder : String
    @Binding var inputValue : String // pake binding supaya statenya bisa dikelola di parent
    
    var body : some View {
        HStack {
            Text(label)
                .frame(width: 70, alignment: .leading)
                .font(.body)
            Spacer()
            TextField(inputPlaceholder, text: $inputValue)
                .multilineTextAlignment(.trailing)
        }
    }
}
