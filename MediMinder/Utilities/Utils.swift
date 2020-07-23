//
//  Greetings.swift
//  MediMinder
//
//  Created by Prabhakar Patil on 20/07/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation

final class Utils {
    
    static func greetingNow(for date: Date) -> Greetings {
        let hour = Calendar.current.component(.hour, from: date)
        
        switch hour {
        case 5..<12:
            return Greetings.morning
        case 12...16:
            return Greetings.afternoon
        default:
            return Greetings.evening
        }
    }
    
    static func medicineScheduledTime(for dayTime: Greetings) -> String {
        switch  dayTime {
        case .morning:
            return "11:00 AM"
        case .afternoon:
            return "2:00 PM"
        case .evening:
            return "8:00 PM"
        }
    }
    
}
