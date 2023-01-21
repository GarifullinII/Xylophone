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
        
        playSound(soundName: sender.currentTitle ?? "no title")
    }
    
    
    private func playSound(soundName: String) {
        
        let url = Bundle.main.url(forResource: "\(soundName)", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

