//
//  DateFormatterUtil.swift
//  personalbudgetplan
//
//  Created by Patricia Gilberta Fritzie Devina on 13/03/25.
//
import Foundation

struct DateFormatterUtil {
    
    // Fungsi untuk memformat tanggal dari string dengan format "YYYYMMDD" ke format "dd MMMM yyyy"
    static func formatDateFromString(_ dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyyMMdd" // Format input YYYYMMDD
        
        // Memastikan input valid
        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd MMMM yyyy" // Format output seperti "12 Maret 2025"
            return outputFormatter.string(from: date)
        } else {
            return "Tanggal tidak valid"
        }
    }
}

func GetCurrentMonthUtil() -> String {
    return Date.now.formatted(.dateTime.month(.wide))
}

func isMonthLessThanCurrent(date: Date) -> Bool {
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: Date()) // Bulan saat ini
        let dateMonth = calendar.component(.month, from: date) // Bulan dari tanggal yang diberikan
        
        return dateMonth < currentMonth
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

func countDaysInRange(startOfMonth: Date, endOfMonth: Date) -> Int {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.day], from: startOfMonth, to: endOfMonth)
    return components.day ?? 0
}
