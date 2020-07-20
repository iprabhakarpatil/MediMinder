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
        case 12:
            return Greetings.noon
        case 13...16:
            return Greetings.afternoon
        default:
            return Greetings.evening
        }
    }
    
}
