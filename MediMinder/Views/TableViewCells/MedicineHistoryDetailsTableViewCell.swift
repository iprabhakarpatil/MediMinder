//
//  MedicineHistoryDetailsTableViewCell.swift
//  MediMinder
//
//  Created by Prabhakar Patil on 21/07/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import UIKit

class MedicineHistoryDetailsTableViewCell: UITableViewCell {

    static let reuseIdentifier = "MedicineHistoryDetailsTableViewCell"
    
    @IBOutlet weak var medicineHistoryDateLabel: UILabel!
    
    @IBOutlet weak var morningStackView: UIStackView!
    @IBOutlet weak var afternoonStackView: UIStackView!
    @IBOutlet weak var eveningStackView: UIStackView!
    
    @IBOutlet weak var morningMedicineScheduledTime: UILabel!
    @IBOutlet weak var morningMedicineConsumedTime: UILabel!
    
    @IBOutlet weak var afternoonMedicineScheduledTime: UILabel!
    @IBOutlet weak var afternoonMedicineConsumedTime: UILabel!
    
    @IBOutlet weak var eveningMedicineScheduledTime: UILabel!
    @IBOutlet weak var eveningMedicineConsumedTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    
}
