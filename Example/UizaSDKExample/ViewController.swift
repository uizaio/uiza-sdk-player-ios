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
import NKFrameLayoutKit

class ViewController: UIViewController {
	let playerViewController = UZPlayerViewController()
	let themeButton = UIButton()
	let textField = UITextField()
	let loadButton = NKButton()
	var frameLayout : NKGridFrameLayout!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		playerViewController.player.controlView.theme = UZTheme1()
		
		themeButton.setImage(UIImage(icon: .googleMaterialDesign(.colorLens), size: CGSize(width: 32, height: 32), textColor: .black, backgroundColor: .clear), for: .normal)
		themeButton.addTarget(self, action: #selector(switchTheme), for: .touchUpInside)
		themeButton.showsTouchWhenHighlighted = true
		
		loadButton.addTarget(self, action: #selector(loadVideo), for: .touchUpInside)
		loadButton.title = "Load Video"
		loadButton.extendSize = CGSize(width: 20, height: 20)
		loadButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
		loadButton.setBackgroundColor(.black, for: .normal)
		loadButton.setTitleColor(.white, for: .normal)
		loadButton.isRoundedButton = true
		loadButton.showsTouchWhenHighlighted = true
		
		textField.backgroundColor = .lightGray
		textField.placeholder = "Enter videoID then tap Load Video"
		textField.textColor = .black
		textField.borderStyle = .line
		textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
		textField.delegate = self
		
		self.view.addSubview(playerViewController.view)
		self.view.addSubview(textField)
		self.view.addSubview(loadButton)
		self.view.addSubview(themeButton)
		
		frameLayout = NKGridFrameLayout(direction: .vertical)
		frameLayout.add(withTargetView: playerViewController.view).heightRatio = 9/16
		frameLayout.add(withTargetView: textField).configurationBlock = { layout in
			layout?.edgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
			layout?.minSize = CGSize(width: 0, height: 40)
		}
		frameLayout.add(withTargetView: loadButton).configurationBlock = { layout in
			layout?.contentAlignment = "cc"
			layout?.minSize = CGSize(width: 0, height: 40)
		}
		frameLayout.add(withTargetView: themeButton).contentAlignment = "cc"
		frameLayout.spacing = 20
		frameLayout.layoutAlignment = .center
//		frameLayout.showFrameDebug = true
		self.view.addSubview(frameLayout)
		
//			UZContentServices().loadHomeData(metadataId: nil, page: 0, limit: 10, completionBlock: { (results, error) in
//				print("OK \(results) - \(error)")
//			})
		
		UZContentServices().loadLiveVideo(page: 0, limit: 10, completionBlock: { (results, pagination, error) in
			if let videoItem = results?.first {
				self.playerViewController.player.loadVideo(videoItem)
			}
		})
		
		present(playerViewController, animated: true, completion: nil)
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
		playerViewController.player.controlView.theme = themeClasses[themeIndex]
		
		themeIndex += 1
	}
	
	@objc func loadVideo() {
		if let videoId = textField.text, !videoId.isEmpty {
			UZContentServices().loadDetail(videoId: videoId) { (video, error) in
				if error != nil {
					print("Error: \(String(describing: error))")
				}
				else {
					self.playerViewController.player.loadVideo(video!)
				}
			}
		}
	}
	
}


extension ViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		return true
	}
	
}
