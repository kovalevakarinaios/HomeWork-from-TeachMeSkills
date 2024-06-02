//
//  VideoView.swift
//  lesson av player
//
//  Created by Karina Kovaleva on 23.11.22.
//

import UIKit
import AVFoundation

class VideoView: UIView {
    
    override class var layerClass: AnyClass { AVPlayerLayer.self }
    
    var player: AVPlayer {
        get {
            return playerLayer.player!
        }
        set {
            playerLayer.player = newValue
        }
    }
    var playerLayer: AVPlayerLayer { layer as! AVPlayerLayer }
    
    
}
