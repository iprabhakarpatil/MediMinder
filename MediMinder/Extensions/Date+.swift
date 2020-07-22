//
//  Date+.swift
//  MediMinder
//
//  Created by Prabhakar Patil on 21/07/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation

extension Date {
    
    func timestamp() -> Int {
        return Int(self.timeIntervalSince1970)
    }
    
    func currentTime() -> Date {
        return Date()
    }
    
    func isToday() -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: self) == formatter.string(from: Date())
    }
    
    func dateToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: self)
    }
    
    func getHoursMinutes() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a" // "a" prints "pm" or "am"
        let hourString = formatter.string(from: self)
        return hourString
    }
    
    static func getDateFrom(timestamp time: Int) -> String {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: Date(timeIntervalSince1970: TimeInterval(time)))
        if let day = components.day, let month = components.month, let year = components.year {
            return "\(day)/\(month)/\(year)"
        }
        return ""
    }
    
}
