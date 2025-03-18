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
