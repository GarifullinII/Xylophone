//
//  ViewController.swift
//  Xylophone
//
//  Created by Ildar Garifullin on 20/01/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        playSound(soundName: sender)
    }
    
    
    private func playSound(soundName: UIButton) {
        
        let url = Bundle.main.url(forResource: "\(soundName.currentTitle ?? "No title")", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

