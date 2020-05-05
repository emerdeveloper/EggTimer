//
//  ViewController.swift
//  EggTimer
//
//  Created by Emerson Javid Gonzalez Morales on 5/05/20.
//  Copyright © 2020 Emerson Javid Gonzalez Morales. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var doneSoundEffect: AVAudioPlayer?
    let eggTime = ["Soft" : 300, "Meddium": 480, "Hard": 720]
    var titleButtom: String = ""
    var timer: Timer?
    var timeLeft = 0
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var LabelInstructions: UILabel!
    @IBOutlet weak var LabelTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressView.progress = 0.0
        LabelTime.text = "Time"
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        titleButtom = sender.currentTitle!
        LabelInstructions.text = titleButtom
        timeLeft = eggTime[titleButtom]!
        LabelTime.text = "\(Int(timeLeft) / 60 % 60):\(Int(timeLeft) % 60)"
        startTimer()
    }
 
    func startTimer() {
        progressView.progress = 1.0
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            self.timeLeft -= 1
            self.progressView.progress = Float(self.timeLeft)/Float(self.eggTime[self.titleButtom]!)
            
                let minutesLeft = Int(self.timeLeft) / 60 % 60
                let secondsLeft = Int(self.timeLeft) % 60
                self.LabelTime.text = "\(minutesLeft):\(secondsLeft)"
            if self.timeLeft <= 0 {
                self.finishTimer()
                self.LabelInstructions.text = "DONE!"
                self.playSound(soundName: "alarm_sound")
            }
        }
    }
    
    func finishTimer() {
        timer?.invalidate()
    }
    
    func playSound(soundName: String) {
        let path = Bundle.main.path(forResource: soundName, ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            doneSoundEffect = try AVAudioPlayer(contentsOf: url)
            doneSoundEffect?.play()
        } catch {
            print("error play the sound:: \(error)")
        }
    }
}

