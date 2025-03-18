import Foundation

struct NumberFormatterUtil {
    static let shared: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.groupingSize = 3
        formatter.decimalSeparator = ","
        return formatter
    }()

    // Function to format number with "Rp" prefix
    static func formatToRupiah(_ value: String) -> String {
        guard let number = shared.number(from: value) else {
            return "Rp \(value)" // Return as is if invalid input
        }
        return "Rp \(shared.string(from: number) ?? value)"
    }
}
