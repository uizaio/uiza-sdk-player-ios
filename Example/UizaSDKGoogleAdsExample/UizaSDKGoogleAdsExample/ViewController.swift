//
//  ViewController.swift
//  UizaSDKGoogleAdsExample
//
//  Created by phan.huynh.thien.an on 6/12/19.
//  Copyright © 2019 uiza. All rights reserved.
//

import UIKit
import UizaSDK
import FrameLayoutKit

class ViewController: UIViewController {
    let loadButton = UIButton()
    var frameLayout : StackFrameLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadButton.addTarget(self, action: #selector(loadVideo), for: .touchUpInside)
        loadButton.setTitle("Load Video", for: .normal)
        loadButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        loadButton.setTitleColor(.white, for: .normal)
        loadButton.showsTouchWhenHighlighted = true
        loadButton.backgroundColor = .black
        
        self.view.addSubview(loadButton)
        
        frameLayout = StackFrameLayout(direction: .vertical, alignment: .center, views: [])
        frameLayout.append(view: loadButton).configurationBlock = { layout in
            layout.contentAlignment = (.center, .center)
            layout.minSize = CGSize(width: 0, height: 40)
        }
        self.view.addSubview(frameLayout)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        frameLayout.frame = self.view.bounds
    }
    
    override public var shouldAutorotate: Bool {
        return true
    }
    
    @objc func loadVideo() {
        
        loadButton.isEnabled = false
        
        UZContentServices().loadEntity(metadataId: nil, publishStatus: .success, page: 0, limit: 20) { [weak self] (results, error) in
            self?.loadButton.isEnabled = true
            
            if let videos = results, let video = videos.randomElement() {
                DispatchQueue.main.async {
                    let viewController = FloatingPlayerViewController()
                    viewController.delegate = self
                    viewController.present(with: video).player.controlView.theme = UZTheme1()
                    viewController.floatingHandler?.allowsCornerDocking = true
                }
            }
        }
    }
    
}

extension ViewController: UZPlayerDelegate {
    
    func UZPlayer(player: UZPlayer, playerStateDidChange state: UZPlayerState) {
        // called when player state was changed (buffering, buffered, readyToPlay ...)
    }
    
    func UZPlayer(player: UZPlayer, loadedTimeDidChange loadedDuration: TimeInterval, totalDuration: TimeInterval) {
        // called when loaded duration was changed
    }
    
    func UZPlayer(player: UZPlayer, playTimeDidChange currentTime: TimeInterval, totalTime: TimeInterval) {
        // called when player time was changed
    }
    
    func UZPlayer(player: UZPlayer, playerIsPlaying playing: Bool) {
        // called when playing state was changed
    }
    
}

extension ViewController: UZFloatingPlayerViewProtocol {
    
    func floatingPlayer(_ player: UZFloatingPlayerViewController, didBecomeFloating: Bool) {
        // called when floating player became floating mode or backed to normal mode
    }
    
    func floatingPlayer(_ player: UZFloatingPlayerViewController, onFloatingProgress: CGFloat) {
        // called when user drag the player from normal mode to floating mode
    }
    
    func floatingPlayerDidDismiss(_ player: UZFloatingPlayerViewController) {
        // called when player was dismissed
    }
    
}
