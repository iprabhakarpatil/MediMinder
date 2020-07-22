//
//  DefaultsManager.swift
//  MediMinder
//
//  Created by Prabhakar Patil on 21/07/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation

class DefaultManager {
    
    static let sharedInstance: DefaultManager = DefaultManager()
    static let consumedKey: String = "consumed"
    
    private let userdefaults = UserDefaults.standard
    private init() { }
    
    func fetchMedicineHistory(by sortOrder: SortOrder? = nil) -> [Dictionary<Date, [Medicine]>.Element]? {
        if let savedData = userdefaults.object(forKey: DefaultManager.consumedKey) as? Data {
            let decoder = JSONDecoder()
            if let medicines = try? decoder.decode([Medicine].self, from: savedData) {
                print("Medicines:\(medicines)")
                if let sorting = sortOrder {
                    switch sorting {
                    case .ascending:
                        return groupDataByDate(for: medicines, with: .ascending)
                    case .descending:
                        return groupDataByDate(for: medicines, with: .descending)
                    }
                }
                return groupDataByDate(for: medicines, with: .ascending)
            }
        }
        return nil
    }
    
    private func groupDataByDate(for medicines: [Medicine], with sorting: SortOrder) -> [Dictionary<Date, [Medicine]>.Element]   {
        
        let empty: [Date: [Medicine]] = [:]
        
        let data = medicines.reduce(into: empty) { (acc, medicine) in
            let components = Calendar.current.dateComponents([.year, .month, .day], from: Date(timeIntervalSince1970: TimeInterval(medicine.id)))
            let date = Calendar.current.date(from: components)!
            let existing = acc[date] ?? []
            acc[date] = existing + [medicine]
        }
        
        switch sorting {
        case .ascending:
            
            let sortedData = data.sorted(by: {$0.key < $1.key})
            return sortedData
        case .descending:
            
            let sortedData = data.sorted(by: { $0.key > $1.key })
            return sortedData
        }
    }
    
    func saveAsConsumed(medicine: Medicine) {
        
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        
        if let savedData = userdefaults.object(forKey: DefaultManager.consumedKey) as? Data {
            if var medicines = try? decoder.decode([Medicine].self, from: savedData) {
                medicines.append(medicine)
                if let encoded = try? encoder.encode(medicines) {
                    userdefaults.set(encoded, forKey: DefaultManager.consumedKey)
                }
            }
        } else {
            if let encoded = try? encoder.encode([medicine]) {
                userdefaults.set(encoded, forKey: DefaultManager.consumedKey)
            }
        }
    }
    
}
