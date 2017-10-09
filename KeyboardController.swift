//
//  KeyboardController.swift
//  SoundPlayer
//
//  Created by Jianyu ZHU on 9/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

import UIKit
import AVFoundation

class KeyboardController: UIViewController {
    
    let keyColors = [0xE74C3C, 0xE67E22, 0xF1C40F, 0x2ECC71, 0x1ABC9C, 0x3498DB, 0x9B59B6]
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor.white
        setupView()
    }
    
    func setupView() {
        
        var topAnchor = topLayoutGuide.topAnchor
        
        for i in 1...7 {
            
            let key: UIButton = {
                let button = UIButton(type: .system)
                button.translatesAutoresizingMaskIntoConstraints = false
                button.backgroundColor = UIColor(rgb: keyColors[i-1])
                button.tag = i
                button.addTarget(self, action: #selector(handleKeyPress), for: .touchUpInside)
                return button
            }()
            
            view.addSubview(key)
            key.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            key.widthAnchor.constraint(equalTo: view.widthAnchor, constant: CGFloat(-i * 10)).isActive = true
            key.topAnchor.constraint(equalTo: topAnchor, constant: i == 1 ? 24 : 8).isActive = true
            key.heightAnchor.constraint(equalToConstant: 84).isActive = true
            
            topAnchor = key.bottomAnchor
        }
        
    }
    
    func handleKeyPress(sender: UIButton) {
        let soundURL = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav")
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error)
        }
        
        audioPlayer.play()
    }

}
