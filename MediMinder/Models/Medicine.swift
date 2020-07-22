//
//  Medicine.swift
//  MediMinder
//
//  Created by Prabhakar Patil on 21/07/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation

class Medicine: Codable {
    
    var id: Int
    //        var medicineTime: String
    var medicineConsumedTime: String
    private (set) var score: Int
    private (set) var medicineDayTime: Greetings
    
    
    init(id: Int, dayTime medicineDayTime: Greetings, consumedTime _time: String) {
        self.id = id
        //        self.medicineTime = time
        self.medicineConsumedTime = _time
        self.medicineDayTime = medicineDayTime
        self.score = medicineDayTime.score
    }
}
