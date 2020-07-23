//
//  HistoryViewController.swift
//  MediMinder
//
//  Created by Prabhakar Patil on 20/07/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import UIKit
import FSCalendar

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var calendar: FSCalendar!
    
    var medicineHistory: [Dictionary<Date, [Medicine]>.Element]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCalendar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        medicineHistory = DefaultManager.sharedInstance.fetchMedicineHistory()
    }
    
    func setupCalendar() {
        
        calendar.scope = .week
        calendar.allowsSelection = true
        calendar.setCurrentPage(Date(), animated: true)
        calendar.scrollDirection = .horizontal
    }
    
    func setupTableView() {
        
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "MedicineHistoryDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: MedicineHistoryDetailsTableViewCell.reuseIdentifier)
    }
    
    
    /// Navigate to the previous week
    /// - Parameter sender: UIButton
    @IBAction func previousWeekAction(_ sender: UIButton) {
        
        if let previousDate = calendar.selectedDate?.addingTimeInterval(-60*60*24*7) {
            calendar.select(previousDate, scrollToDate: true)
        } else {
            calendar.setCurrentPage(Date().addingTimeInterval(-60*60*24*7), animated: true)
        }
    }
    
    
    /// Navigate to the next week
    /// - Parameter sender: UIButton
    @IBAction func nextWeekAction(_ sender: UIButton) {
        
        if let nextDate = calendar.selectedDate?.addingTimeInterval(60*60*24*7) {
            calendar.select(nextDate, scrollToDate: true)
        } else {
            calendar.select(Date().addingTimeInterval(60*60*24*7), scrollToDate: true)
        }
    }
}
