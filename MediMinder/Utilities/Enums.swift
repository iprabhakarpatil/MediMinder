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
    case afternoon
    case evening
    
    var label: String {
        switch self {
        case .morning:
            return "Good Morning 🌅"
        case .afternoon:
            return "Good Afternoon ☀️"
        case .evening :
            return "Good Evening 🌄"
        }
    }
    
    var score: Int {
        switch self {
        case .morning:
            return 30
        case .afternoon:
            return 30
        case .evening:
            return 40
        }
    }
    
    var medicineTime: DateComponents {
        var date = DateComponents()
        date.minute = 0
        date.second = 0
        switch self {
        case .morning:
            date.hour = 8
        case .afternoon:
            date.hour = 13
        case .evening:
            date.hour = 20
        }
        return date
    }
    
    var notificationText: String {
        switch  self {
        case .morning:
            return "Time for morning medicine."
        case .afternoon:
            return "Time for afternoon medicine"
        case .evening:
            return "Time for evening medicine"
        }
    }
    
    var notificationId: String {
        switch self {
        case .morning:
            return "1"
        case .afternoon:
            return "2"
        case .evening:
            return "3"
        }
    }
    
}

public enum SortOrder {
    case ascending
    case descending
}


// MARK: - Greetings: Codabale
extension Greetings: Codable {
    
    enum Key: CodingKey {
        case rawValue
    }
    
    enum CodingError: Error {
        case unknownValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0:
            self = .morning
        case 1:
            self = .afternoon
        case 2:
            self = .evening
        default:
            throw CodingError.unknownValue
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .morning:
            try container.encode(0, forKey: .rawValue)
        case .afternoon:
            try container.encode(1, forKey: .rawValue)
        case .evening:
            try container.encode(2, forKey: .rawValue)
        }
    }
    
    
}
