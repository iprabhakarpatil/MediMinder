//
//  HomeViewController+UITableViewDataSource.swift
//  MediMinder
//
//  Created by Prabhakar Patil on 21/07/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation
import UIKit

extension HistoryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        medicineHistory?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MedicineHistoryDetailsTableViewCell.reuseIdentifier, for: indexPath) as? MedicineHistoryDetailsTableViewCell, let medicineHistory = medicineHistory else {
            assert(false, "Failed to initialise the cell.")
            return UITableViewCell()
        }
        let medicine = medicineHistory[indexPath.row]
        cell.medicineHistoryDateLabel.text = medicine.key.dateToString()
        cell.scoreLabel.text = "\(medicine.value.reduce(0) { $0 + $1.score })"
        medicineHistory[indexPath.row].value.forEach { (medicine) in
            switch medicine.medicineDayTime {
            case .morning:
                cell.morningMedicineConsumedTime.text = medicine.medicineConsumedTime
            case .afternoon:
                cell.afternoonMedicineConsumedTime.text = medicine.medicineConsumedTime
            case .evening:
                cell.eveningMedicineConsumedTime.text = medicine.medicineConsumedTime
            }
        }
        return cell
    }
}


extension HistoryViewController: UITableViewDelegate {
    
}
