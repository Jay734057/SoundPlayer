//
//  ViewController.swift
//  SoundPlayer
//
//  Created by Jianyu ZHU on 6/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

import UIKit
import AVFoundation
//import AudioToolbox

class ViewController: UIViewController{

    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func notePressed(_ sender: UIButton) {
//        if let soundURL = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav"){
//            var mySound: SystemSoundID = 0
//            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
//            //play
//            AudioServicesPlaySystemSound(mySound)
//        }
        
        playSound(tag: sender.tag)
        
    }
    
    func playSound(tag : Int) {
        let soundURL = Bundle.main.url(forResource: "note\(tag)", withExtension: "wav")
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error)
        }
        
        audioPlayer.play()
    }
    
}

