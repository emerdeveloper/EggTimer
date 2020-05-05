//
//  ViewController.swift
//  EggTimer
//
//  Created by Emerson Javid Gonzalez Morales on 5/05/20.
//  Copyright © 2020 Emerson Javid Gonzalez Morales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let sofTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        switch sender.currentTitle {
        case "Soft":
            print(sofTime)
        case "Meddium":
            print(mediumTime)
        case "Hard":
            print(hardTime)
        default:
            print("sound no exits")
        }
    }
    
}

