//
//  HomeViewController.swift
//  MediMinder
//
//  Created by Prabhakar Patil on 20/07/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var scoreTitleLabel: UILabel!
    @IBOutlet weak var todaysScoreLabel: UILabel!
    var todaysMedicineData: [Medicine]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todaysMedicineData = DefaultManager.sharedInstance.fetchMedicineHistory(by: .descending)?.first(where: {$0.key.isToday()})?.value
        setupUI()
        
    }
    
    func setupUI() {
        greetingLabel.text = Utils.greetingNow(for: Date()).label
        scoreTitleLabel.text = "Score"
        let score = todaysMedicineData?.reduce(0) { $0 + $1.score } ?? 0
        todaysScoreLabel.text = "\(score)"
    }
    
    @IBAction func medicineTakenAction(_ sender: UIButton) {
        
        let date = Date()
        let timeStamp = date.timestamp()
        let dayTime = Utils.greetingNow(for: date)
        let consumedTime = date.getHoursMinutes()
        
        let medicine = Medicine(id: timeStamp, dayTime: dayTime, consumedTime: consumedTime)
        DefaultManager.sharedInstance.saveAsConsumed(medicine: medicine)
    }
    
}
