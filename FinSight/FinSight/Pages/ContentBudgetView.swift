import SwiftUI

struct ContentBudgetView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var title: String = ""
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                Spacer()
                Spacer()

                Text("50/30/20 rule")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.bgThemeGreen))
                Text("Needs: 50%").fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading)
                Text("About half of your budget should go toward needs. These are expenses that must be met no matter what, such as: Food (20%), Transportation (10%), Utility (10%), Rent (10%)")
                    .font(.body)
                Spacer()
                Text("Wants: 30% ").fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading)
                Text("Wants are things you enjoy that you spend money on by choice, such as: Subscriptions, Supplies for hobbies, Restaurant meals, Vacations.").font(.body)
                Spacer()
                Text("Saving: 20%").fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading)
                Text("The remaining 20% of your budget should go toward the future. You may put money in an emergency fund, contribute to a retirement account, or save.").font(.body)
                
//                HStack {
//                    Button("Cancel") {
//                        // Cancel saving and dismiss.
//                        dismiss()
//                    }
//                    Spacer()
//                    Button("Confirm") {
//                        // Save the article and dismiss.
//                        dismiss()
//                    }
//                }
            }
            .padding(20)
        }
    }
}
