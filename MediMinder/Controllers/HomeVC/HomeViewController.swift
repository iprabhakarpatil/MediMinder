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
    @IBOutlet weak var trackMedicineButton: UIButton!
    
    var todaysMedicineData: [Medicine]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            
        setupUI()
    }
    
    
    func setupUI() {
        
        todaysMedicineData = DefaultManager.sharedInstance.fetchMedicineHistory(by: .descending)?.first(where: {$0.key.isToday()})?.value
        
        greetingLabel.text = Utils.greetingNow(for: Date()).label
        scoreTitleLabel.text = "Score"
        
        let score = todaysMedicineData?.reduce(0) { $0 + $1.score } ?? 0
        todaysScoreLabel.text = "\(score)"
        
        trackMedicineButton.isEnabled = shouldTrackMedicineButtonBeActive()
        trackMedicineButton.alpha = trackMedicineButton.isEnabled ? 1.0 : 0.4
    }
    
    
    /// Check if the medicine is consumed for the day time
    /// - Returns: Bool
    func shouldTrackMedicineButtonBeActive() -> Bool {
        let dayTime = Utils.greetingNow(for: Date())
        if todaysMedicineData?.contains(where: {$0.medicineDayTime == dayTime}) ?? false {
            return false
        }
        return true
    }
    
    
    /// Button action for tracking medicine intake
    /// - Parameter sender: UIButton
    @IBAction func medicineTakenAction(_ sender: UIButton) {
        
        let date = Date()
        let timeStamp = date.timestamp()
        let dayTime = Utils.greetingNow(for: date)
        let consumedTime = date.getHoursMinutes()
        
        let medicine = Medicine(id: timeStamp, dayTime: dayTime, consumedTime: consumedTime)
        DefaultManager.sharedInstance.saveAsConsumed(medicine: medicine)
        setupUI()
        LocalNotificationsManager.removeFutureNotification(for: dayTime)
    }
        
}
