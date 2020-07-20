//
//  Enums.swift
//  MediMinder
//
//  Created by Prabhakar Patil on 20/07/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation

public enum Greetings {
    
    case morning
    case noon
    case afternoon
    case evening
    
    var label: String {
        switch self {
        case .morning:
            return "Good Morning !!!"
        case .noon:
            return "Good noon !!!"
        case .afternoon:
            return "Good Afternoon !!!"
        case .evening:
            return "Good Evening !!!"
        }
    }
    
}
