//
//  ViewController.swift
//  UizaSDKExample
//
//  Created by Nam Kennic on 7/22/18.
//  Copyright © 2018 Uiza. All rights reserved.
//

import UIKit
import UizaSDK
import NKButton
import FrameLayoutKit

class ViewController: UIViewController {
//	let playerViewController = UZPlayerViewController()
	let themeButton = UIButton()
	let textField = UITextField()
	let loadButton = NKButton()
	var frameLayout : StackFrameLayout!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		playerViewController.autoFullscreenWhenRotateDevice = false
//		playerViewController.player.controlView.theme = UZTheme1()
		
		textField.backgroundColor = .lightGray
		textField.placeholder = "Enter videoID then tap Load Video"
		textField.textColor = .black
		textField.borderStyle = .line
		textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
		textField.delegate = self
		
		loadButton.addTarget(self, action: #selector(loadVideo), for: .touchUpInside)
		loadButton.title = "Load Video"
		loadButton.extendSize = CGSize(width: 20, height: 20)
		loadButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
		loadButton.setBackgroundColor(.black, for: .normal)
		loadButton.setTitleColor(.white, for: .normal)
		loadButton.isRoundedButton = true
		loadButton.showsTouchWhenHighlighted = true
		
		themeButton.setImage(UIImage(icon: .googleMaterialDesign(.colorLens), size: CGSize(width: 32, height: 32), textColor: .black, backgroundColor: .clear), for: .normal)
		themeButton.addTarget(self, action: #selector(switchTheme), for: .touchUpInside)
		themeButton.showsTouchWhenHighlighted = true
		
//		self.view.addSubview(playerViewController.view)
//		self.view.addSubview(textField)
		self.view.addSubview(loadButton)
//		self.view.addSubview(themeButton)
		
		frameLayout = StackFrameLayout(direction: .vertical)
//		frameLayout.append(view: playerViewController.view).heightRatio = 9/16
		frameLayout.append(view: textField).configurationBlock = { layout in
			layout.edgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
			layout.minSize = CGSize(width: 0, height: 40)
		}
		frameLayout.append(view: loadButton).configurationBlock = { layout in
			layout.contentAlignment = (.center, .center)
			layout.minSize = CGSize(width: 0, height: 40)
		}
		frameLayout.append(view: themeButton).contentAlignment = (.center, .center)
		frameLayout.spacing = 20
		frameLayout.layoutAlignment = .center
		self.view.addSubview(frameLayout)
		
//		UZContentServices().loadLiveVideo(page: 0, limit: 10) { (videos, pagination, error) in
//			if let videoItem = videos?.first {
//				self.playerViewController.player.loadVideo(videoItem)
//			}
//		}
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		frameLayout.frame = self.view.bounds
	}
	
	override public var shouldAutorotate: Bool {
		return true
	}
	
	var themeIndex: Int = 0
	let themeClasses: [UZPlayerTheme] = [UZTheme1(), UZTheme2(), UZTheme3(), UZTheme4(), UZTheme5(), UZTheme6(), UZTheme7()]
	@objc func switchTheme() {
		if themeIndex == themeClasses.count {
			themeIndex = 0
		}
		
		print("Theme index: \(themeIndex)")
//		playerViewController.player.controlView.theme = themeClasses[themeIndex]
		
		themeIndex += 1
	}
	
	@objc func loadVideo() {
		_ = textField.resignFirstResponder()
		
//		if let videoId = textField.text, !videoId.isEmpty {
//			self.playerViewController.player.loadVideo(entityId: videoId)
//		}
		
		loadButton.isLoading = true
		
		UZContentServices().loadEntity(metadataId: nil, publishStatus: .success, page: 0, limit: 20) { (results, error) in
			self.loadButton.isLoading = false
			
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


extension ViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		_ = textField.resignFirstResponder()
		loadVideo()
		return true
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
