//
//  ViewController.swift
//  lesson av player
//
//  Created by Karina Kovaleva on 23.11.22.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var videoView: VideoView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var pressButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //    let url = Bundle.main.url(forResource: "test", withExtension: "mp3")!
    let videoUrl = Bundle.main.url(forResource: "IMG_5728", withExtension: "mp4")!
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = AVPlayer(url: URL(string: "https://v.redd.it/f8y8lwibal1a1/DASH_480.mp4?source=fallback")!)
        videoView.player = player!
        nextButton.setTitle("button_Start".l10n, for: .normal)
        backButton.setTitle("button_Stop".l10n, for: .normal)
        pressButton.setTitle("button_Press".l10n, for: .normal)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        player?.pause()
    }
    
    @IBAction func pressButtonPressed(_ sender: UIButton) {
        let vc = AVPlayerViewController()
        vc.player = player
        present(vc, animated: true)
        player?.play()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        player?.play()
    }
}
