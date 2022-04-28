//
//  VideoPlayerView.swift
//  HulkTube
//
//  Created by admin on 28.4.22..
//

import AVKit
import UIKit
import SwiftUI

enum PlayerGravity {
    case aspectFill
    case resize
    case resizeAspect
}


enum PlayerAction {
    case play
    case pause
}



// ... Radi 16:9 , player kontrole disabled zbog responsive issue-a sa okretanjem



class PlayerView: UIView {
    

    
    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
    
    let gravity: PlayerGravity
    
    
    
    
    init(player: AVPlayer, gravity: PlayerGravity) {
        self.gravity = gravity
        super.init(frame: .zero)
        self.player = player
        self.backgroundColor = .black
        setupLayer()
    }
    
    func setupLayer() {
        switch gravity {
            
            case .aspectFill:
                playerLayer.contentsGravity = .resizeAspectFill
                playerLayer.videoGravity = .resizeAspectFill
                
            case .resize:
                playerLayer.contentsGravity = .resize
                playerLayer.videoGravity = .resize
                
            case .resizeAspect:
                playerLayer.contentsGravity = .resizeAspect
                playerLayer.videoGravity = .resizeAspect
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}

final class VideoPlayerView: UIViewRepresentable {
    typealias UIViewType = PlayerView
    
    let player: AVPlayer
    let gravity: PlayerGravity
    

    
    init(player: AVPlayer, gravity: PlayerGravity) {
        self.player = player
        self.gravity = gravity
        
    }
    
    func makeUIView(context: Context) -> PlayerView {
        return PlayerView(player: player, gravity: gravity)
    }
    
    func updateUIView(_ uiView: PlayerView, context: Context) {
        
    
        
    }
}



