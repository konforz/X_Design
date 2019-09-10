//
//  ViewController.swift
//  AVFoundation
//
//  Created by MCS on 9/9/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       guard let sharkURL = Bundle.main.url(forResource: "shark", withExtension: "mp4")  else { return }
        print(sharkURL)
        let player = AVPlayer(url: sharkURL)
        let playerLayer = AVPlayerLayer(player: player)
        view.layer.addSublayer(playerLayer)
        player.play()
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        guard let sharkURL = Bundle.main.url(forResource: "shark", withExtension: withExtension: <#T##String?#>)
    }

}

