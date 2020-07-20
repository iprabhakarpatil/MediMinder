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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        greetingLabel.text = Utils.greetingNow(for: Date()).label
        scoreTitleLabel.text = "Score"
        todaysScoreLabel.text = "30"
    }
    
    @IBAction func medicineTakenAction(_ sender: UIButton) {
        
    }
    

}
