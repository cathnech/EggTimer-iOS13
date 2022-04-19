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
    
    
    @IBOutlet weak var progBar: UIProgressView!
    @IBOutlet var titleEgg: UILabel!
    
    var player: AVAudioPlayer!
    let statEgg = ["Soft" :5, "Medium":7, "Hard" :12]
    var totalTimes = 0
    var timer = Timer()
    
    
    @IBAction func eggButton(_ sender: UIButton) {
        timer.invalidate()
        self.titleEgg.text = "Wait"
        totalTimes = statEgg[sender.currentTitle!]!
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            [self] (Timer) in
            self.setBar(scale: self.totalTimes, allTime:statEgg[sender.currentTitle!]!)
            if self.totalTimes > 0 {
                
                self.titleEgg.text = "Wait \(self.totalTimes) seconds"
                self.totalTimes -= 1
            } else {
                self.titleEgg.text = "Done"
                playSound()
                Timer.invalidate()
            }
            
        }
    }
    
    func setBar(scale:Int, allTime:Int){
        progBar.progress = 1-Float(scale)/Float(allTime)
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}
