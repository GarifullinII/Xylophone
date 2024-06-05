//
//  ViewController.swift
//  Xylophone
//
//  Created by Ildar Garifullin on 04/06/2024.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    // MARK: - Property
    var player: AVAudioPlayer?
    
    private let cButton:  UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.tintColor = .black
        button.setTitle("C", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(32)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let dButton:  UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.tintColor = .black
        button.setTitle("D", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(32)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let eButton:  UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 10
        button.tintColor = .black
        button.setTitle("E", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(32)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let fButton:  UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.tintColor = .black
        button.setTitle("F", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(32)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let gButton:  UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 10
        button.tintColor = .black
        button.setTitle("G", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(32)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let aButton:  UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.tintColor = .black
        button.setTitle("A", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(32)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let bButton:  UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 10
        button.tintColor = .black
        button.setTitle("B", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(32)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var buttonsStackView = UIStackView()
    
    // MARK: - Life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .lightGray
        buttonsStackView = UIStackView(arrangedSubviews: [
            cButton,
            dButton,
            eButton,
            fButton,
            gButton,
            aButton,
            bButton,
        ], axis: .vertical, spacing: 4)
        view.addSubview(buttonsStackView)
    }
    
    @objc private func  buttonTapped(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
    }
    
    private func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: "\(soundName)", withExtension: "wav") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

// MARK: - SetConstraints
extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonsStackView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

