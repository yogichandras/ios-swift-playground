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
    
    @IBOutlet weak var labelTimerResult: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    let time = ["Soft":10, "Medium":420, "Hard":720]
    var count:Float = 0
    var currentTimer:Float = 0
    var timer: Timer? = nil
    var player: AVAudioPlayer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let title = sender.currentTitle!
       
        stopTimer()
        progressView.progress = 0.0
        currentTimer = Float(time[title]!)
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(printTimer), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func printTimer(){
        if(count < currentTimer){
            count+=1
            let percentage:Float = count / currentTimer
            labelTimerResult.text = String(Int(count))
            progressView.progress = Float(percentage)
        }else{
            stopTimer()
        }
        
    }
    
    func stopTimer(){
        if(timer != nil){
            timer?.invalidate()
            if(count >= currentTimer){
                labelTimerResult.text = "Done!"
                playSound()
            }
            currentTimer = 0
            count = 0
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
