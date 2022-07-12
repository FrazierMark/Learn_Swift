//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    @IBOutlet weak var displayMessage: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTime = ["Soft": 3, "Medium": 420, "Hard": 720]
    
    // var secondsRemaining = 60
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
                
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        
        // reset progress bar when another button is pressed
        progressBar.progress = 0.0
        secondsPassed = 0
        displayMessage.text = hardness
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    // Objector C function
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            
            secondsPassed += 1

            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = percentageProgress
            
            //print("\(secondsRemaining) seconds.")
                    } else {
            //stop timer
            timer.invalidate()
            displayMessage.text = "Done!"
                        
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                        player = try! AVAudioPlayer(contentsOf: url!)
                        player.play()
        }
    }
    
}
