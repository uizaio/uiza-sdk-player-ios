//
//  ViewController.swift
//  UizaSDKExample
//
//  Created by Nam Kennic on 7/22/18.
//  Copyright © 2018 Uiza. All rights reserved.
//

import UIKit
import UizaSDK

class ViewController: UIViewController {
	let playerViewController = UZPlayerViewController()
	let themeButton = UIButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		themeButton.setImage(UIImage(icon: .googleMaterialDesign(.colorLens), size: CGSize(width: 32, height: 32), textColor: .black, backgroundColor: .clear), for: .normal)
		themeButton.addTarget(self, action: #selector(switchTheme), for: .touchUpInside)
		playerViewController.player.controlView.theme = UZTheme1()
		
		self.view.addSubview(playerViewController.view)
		self.view.addSubview(themeButton)
		
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
		
		let viewSize = self.view.bounds.size
		let playerSize = CGSize(width: viewSize.width, height: viewSize.width * (9/16))
		playerViewController.view.frame = CGRect(x: 0, y: (viewSize.height - playerSize.height)/2, width: playerSize.width, height: playerSize.height)
		
		var buttonSize = themeButton.sizeThatFits(viewSize)
		buttonSize.width += 20
		themeButton.frame = CGRect(x: (viewSize.width - buttonSize.width/2)/2, y: viewSize.height - buttonSize.height - 50, width: buttonSize.width, height: buttonSize.height)
	}
	
	override public var shouldAutorotate: Bool {
		return true
	}
	//
	//	override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
	//		return UIDevice.current.userInterfaceIdiom == .phone ? .portrait : UIApplication.shared.statusBarOrientation
	//	}
	//
	//	override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
	//		return UIDevice.current.userInterfaceIdiom == .phone ? .portrait : .all
	//	}
	
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
	
}
