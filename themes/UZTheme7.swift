//
//  UZTheme7.swift
//  UizaSDK
//
//  Created by Nam Kennic on 5/16/18.
//  Copyright © 2018 Nam Kennic. All rights reserved.
//

import UIKit
import AVKit
//import SwiftIcons
import FrameLayoutKit
import NVActivityIndicatorView

open class UZTheme7: UZPlayerTheme {
	public weak var controlView: UZPlayerControlView? = nil
	
	let topGradientLayer = CAGradientLayer()
	
	internal var topFrameLayout 	: DoubleFrameLayout?
	internal var bottomFrameLayout 	: StackFrameLayout?
	internal var mainFrameLayout 	: StackFrameLayout?
	internal let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
	
	internal var iconColor = UIColor.white
	internal var iconSize = CGSize(width: 24, height: 24)
	internal var centerIconSize = CGSize(width: 50, height: 50)
	internal var seekThumbSize = CGSize(width: 24, height: 24)
	internal var buttonMinSize = CGSize(width: 32, height: 32)
	
	public convenience init(iconSize: CGSize = CGSize(width: 24, height: 24), centerIconSize: CGSize = CGSize(width: 60, height: 60), seekThumbSize: CGSize = CGSize(width: 24, height: 24), iconColor: UIColor = .white) {
		self.init()
		
		self.iconSize = iconSize
		self.centerIconSize = centerIconSize
		self.iconColor = iconColor
		self.seekThumbSize = seekThumbSize
	}
	
	public init() {
		
	}
	
	open func updateUI() {
		setupSkin()
		setupLayout()
	}
	
	func setupSkin() {
		guard let controlView = controlView else { return }
		
		let backIcon = UIImage(icon: .icofont(.close), size: iconSize, textColor: .white, backgroundColor: .clear)
		let playlistIcon = UIImage(icon: .icofont(.listineDots), size: iconSize, textColor: iconColor, backgroundColor: .clear)
		let helpIcon = UIImage(icon: .icofont(.questionCircle), size: iconSize, textColor: iconColor, backgroundColor: .clear)
		let ccIcon = UIImage(icon: .icofont(.cc), size: iconSize, textColor: iconColor, backgroundColor: .clear)
		let settingsIcon = UIImage(icon: .icofont(.gear), size: iconSize, textColor: iconColor, backgroundColor: .clear)
		let volumeIcon = UIImage(icon: .icofont(.volumeUp), size: iconSize, textColor: iconColor, backgroundColor: .clear)
		let muteIcon = UIImage(icon: .icofont(.volumeMute), size: iconSize, textColor: iconColor, backgroundColor: .clear)
//		let playBigIcon = UIImage(icon: .googleMaterialDesign(.playCircleOutline), size: centerIconSize, textColor: iconColor, backgroundColor: .clear)
//		let pauseBigIcon = UIImage(icon: .googleMaterialDesign(.pauseCircleOutline), size: centerIconSize, textColor: iconColor, backgroundColor: .clear)
		let playIcon = UIImage(icon: .openIconic(.playCircle), size: centerIconSize, textColor: iconColor, backgroundColor: .clear)
		let pauseIcon = UIImage(icon: .openIconic(.mediaPause), size: centerIconSize, textColor: iconColor, backgroundColor: .clear)
		let fullscreenIcon = UIImage(icon: .googleMaterialDesign(.fullscreen), size: iconSize, textColor: iconColor, backgroundColor: .clear)
		let collapseIcon = UIImage(icon: .googleMaterialDesign(.fullscreenExit), size: iconSize, textColor: iconColor, backgroundColor: .clear)
		let forwardIcon = UIImage(icon: .googleMaterialDesign(.fastForward), size: CGSize(width: 32, height: 32), textColor: iconColor, backgroundColor: .clear)
		let backwardIcon = UIImage(icon: .googleMaterialDesign(.fastRewind), size: CGSize(width: 32, height: 32), textColor: iconColor, backgroundColor: .clear)
		let nextIcon = UIImage(icon: .googleMaterialDesign(.skipNext), size: iconSize, textColor: iconColor, backgroundColor: .clear)
		let previousIcon = UIImage(icon: .googleMaterialDesign(.skipPrevious), size: iconSize, textColor: iconColor, backgroundColor: .clear)
		let thumbIcon = UIImage(icon: .fontAwesomeSolid(.circle), size: seekThumbSize, textColor: .white, backgroundColor: .clear)
		
		controlView.backButton.setImage(backIcon, for: .normal)
		controlView.playlistButton.setImage(playlistIcon, for: .normal)
		controlView.helpButton.setImage(helpIcon, for: .normal)
		controlView.ccButton.setImage(ccIcon, for: .normal)
		controlView.settingsButton.setImage(settingsIcon, for: .normal)
		controlView.volumeButton.setImage(volumeIcon, for: .normal)
		controlView.volumeButton.setImage(muteIcon, for: .selected)
//		controlView.playpauseCenterButton.setImage(playBigIcon, for: .normal)
//		controlView.playpauseCenterButton.setImage(pauseBigIcon, for: .selected)
		controlView.playpauseButton.setImage(playIcon, for: .normal)
		controlView.playpauseButton.setImage(pauseIcon, for: .selected)
		controlView.forwardButton.setImage(forwardIcon, for: .normal)
		controlView.backwardButton.setImage(backwardIcon, for: .normal)
		controlView.nextButton.setImage(nextIcon, for: .normal)
		controlView.previousButton.setImage(previousIcon, for: .normal)
		controlView.fullscreenButton.setImage(fullscreenIcon, for: .normal)
		controlView.fullscreenButton.setImage(collapseIcon, for: .selected)
		controlView.timeSlider.setThumbImage(thumbIcon, for: .normal)
		
		if #available(iOS 9.0, *) {
			let pipStartIcon = AVPictureInPictureController.pictureInPictureButtonStartImage(compatibleWith: nil).colorize(with: iconColor)
			let pipStopIcon = AVPictureInPictureController.pictureInPictureButtonStopImage(compatibleWith: nil).colorize(with: iconColor)
			controlView.pipButton.setImage(pipStartIcon, for: .normal)
			controlView.pipButton.setImage(pipStopIcon, for: .selected)
			controlView.pipButton.imageView?.contentMode = .scaleAspectFit
			controlView.pipButton.isHidden = !AVPictureInPictureController.isPictureInPictureSupported()
		} else {
			// Fallback on earlier versions
		}
		
		controlView.castingButton.setupDefaultIcon(iconSize: iconSize, offColor: iconColor)
		
		controlView.titleLabel.textColor = .white
		controlView.titleLabel.font = UIFont.systemFont(ofSize: 14)
		
		let timeLabelFont = UIFont(name: "Arial", size: 12)
		let timeLabelColor = UIColor.white
		let timeLabelShadowColor = UIColor.black
		let timeLabelShadowOffset = CGSize(width: 0, height: 1)
		
		controlView.currentTimeLabel.textColor = timeLabelColor
		controlView.currentTimeLabel.font = timeLabelFont
		controlView.currentTimeLabel.shadowColor = timeLabelShadowColor
		controlView.currentTimeLabel.shadowOffset = timeLabelShadowOffset
		
		controlView.totalTimeLabel.textColor = timeLabelColor
		controlView.totalTimeLabel.font = timeLabelFont
		controlView.totalTimeLabel.shadowColor = timeLabelShadowColor
		controlView.totalTimeLabel.shadowOffset = timeLabelShadowOffset
		
		controlView.remainTimeLabel.textColor = timeLabelColor
		controlView.remainTimeLabel.font = timeLabelFont
		controlView.remainTimeLabel.shadowColor = timeLabelShadowColor
		controlView.remainTimeLabel.shadowOffset = timeLabelShadowOffset
	}
	
	func setupLayout() {
		guard let controlView = controlView else { return }
		
		let topLeftFrameLayout = DoubleFrameLayout(direction: .horizontal, views: [controlView.titleLabel, controlView.backButton])
		topLeftFrameLayout.spacing = 10
		topLeftFrameLayout.layoutAlignment = .right
		topLeftFrameLayout.isUserInteractionEnabled = true
		topLeftFrameLayout.addSubview(controlView.backButton)
		topLeftFrameLayout.addSubview(controlView.titleLabel)
		topLeftFrameLayout.rightFrameLayout.minSize = buttonMinSize
		
		topFrameLayout = DoubleFrameLayout(direction: .horizontal)
		topFrameLayout!.leftFrameLayout.targetView = topLeftFrameLayout
//		topFrameLayout!.rightFrameLayout.targetView = controlFrameLayout
		topFrameLayout!.leftFrameLayout.contentAlignment = (.center, .left)
		topFrameLayout!.rightFrameLayout.contentAlignment = (.center, .right)
		topFrameLayout!.spacing = 5
		topFrameLayout!.addSubview(topLeftFrameLayout)
		topFrameLayout!.isUserInteractionEnabled = true
		topFrameLayout!.layoutAlignment = .right
		topFrameLayout!.edgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5)
//		topFrameLayout!.showFrameDebug = true
		
		let bottomLeftFrameLayout = StackFrameLayout(direction: .horizontal, views: [controlView.volumeButton, controlView.settingsButton, controlView.pipButton])
		bottomLeftFrameLayout.minSize = CGSize(width: (iconSize.width * 3) + 20, height: 0)
		let bottomRightFrameLayout = StackFrameLayout(direction: .horizontal, views: [controlView.castingButton, controlView.playlistButton, controlView.fullscreenButton])
		let bottomCenterFrameLayout = StackFrameLayout(direction: .horizontal)
		bottomCenterFrameLayout.append(view: controlView.backwardButton).contentAlignment = (.center, .center)
		bottomCenterFrameLayout.append(view: controlView.previousButton).contentAlignment = (.center, .center)
		bottomCenterFrameLayout.append(view: controlView.playpauseButton).contentAlignment = (.center, .center)
		bottomCenterFrameLayout.append(view: controlView.nextButton).contentAlignment = (.center, .center)
		bottomCenterFrameLayout.append(view: controlView.forwardButton).contentAlignment = (.center, .center)
		bottomCenterFrameLayout.layoutAlignment = .center
		
		for frameLayout in bottomLeftFrameLayout.frameLayouts {
			frameLayout.minSize = buttonMinSize
		}
		
		for frameLayout in bottomRightFrameLayout.frameLayouts {
			frameLayout.minSize = buttonMinSize
		}
		
		bottomRightFrameLayout.spacing = 10
		bottomLeftFrameLayout.spacing = 10
		bottomCenterFrameLayout.spacing = 10
		
		bottomFrameLayout = StackFrameLayout(direction: .horizontal, views: [bottomLeftFrameLayout, bottomCenterFrameLayout, bottomRightFrameLayout])
		bottomFrameLayout?.frameLayout(at: 1)?.isFlexible = true
		bottomFrameLayout!.addSubview(controlView.castingButton)
		bottomFrameLayout!.addSubview(controlView.settingsButton)
		bottomFrameLayout!.addSubview(controlView.volumeButton)
		bottomFrameLayout!.addSubview(controlView.playlistButton)
		bottomFrameLayout!.addSubview(controlView.pipButton)
		bottomFrameLayout!.addSubview(controlView.fullscreenButton)
		bottomFrameLayout!.addSubview(controlView.backwardButton)
		bottomFrameLayout!.addSubview(controlView.forwardButton)
		bottomFrameLayout!.addSubview(controlView.previousButton)
		bottomFrameLayout!.addSubview(controlView.nextButton)
		bottomFrameLayout!.addSubview(controlView.playpauseButton)
		bottomFrameLayout!.spacing = 10
		bottomFrameLayout!.layoutAlignment = .left
		bottomFrameLayout!.isUserInteractionEnabled = true
		bottomFrameLayout!.edgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//		bottomFrameLayout!.backgroundColor = UIColor(white: 0.0, alpha: 0.8)
		bottomFrameLayout?.minSize = CGSize(width: 0, height: 50)
		
		bottomFrameLayout?.ignoreHiddenView = true
		bottomLeftFrameLayout.ignoreHiddenView = false
		bottomRightFrameLayout.ignoreHiddenView = false
		bottomCenterFrameLayout.ignoreHiddenView = true
		
		mainFrameLayout = StackFrameLayout(direction: .vertical) // views: [topFrameLayout!, playpauseCenterButton, bottomFrameLayout!]
		mainFrameLayout?.layoutAlignment = .top
		mainFrameLayout?.append(view: topFrameLayout!)
		mainFrameLayout?.append(view: controlView.playpauseCenterButton).configurationBlock = { layout in
			layout.isFlexible = true
			layout.ignoreHiddenView = false
			layout.contentAlignment = (.center, .center)
		}
		mainFrameLayout?.append(view: bottomFrameLayout) //.edgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
		
		controlView.playpauseCenterButton.isHidden = true
		
		topGradientLayer.colors = [UIColor(white: 0.0, alpha: 0.8).cgColor, UIColor(white: 0.0, alpha: 0.0).cgColor]
		controlView.containerView.layer.addSublayer(topGradientLayer)
		
		controlView.containerView.addSubview(blurView)
		controlView.containerView.addSubview(mainFrameLayout!)
		controlView.containerView.addSubview(topFrameLayout!)
		controlView.containerView.addSubview(bottomFrameLayout!)
		controlView.containerView.addSubview(controlView.timeSlider)
//		controlView.containerView.addSubview(controlView.playpauseCenterButton)
		
		controlView.addSubview(controlView.enlapseTimeLabel)
		controlView.addSubview(controlView.liveBadgeView)
	}
	
	open func layoutControls(rect: CGRect) {
		mainFrameLayout?.frame = rect
		mainFrameLayout?.layoutIfNeeded()
		
		CATransaction.begin()
		CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
		topGradientLayer.frame = topFrameLayout!.frame
		CATransaction.commit()
		
		blurView.frame = bottomFrameLayout!.frame
		
		if let controlView = controlView {
			let viewSize = rect.size
			controlView.timeSlider.frame = CGRect(x: 0, y: viewSize.height - bottomFrameLayout!.frame.size.height - 8, width: viewSize.width, height: 16)
		}
		
		if let controlView = controlView {
			let viewSize = controlView.bounds.size
			
			let badgeSize = controlView.liveBadgeView.sizeThatFits(viewSize)
			controlView.liveBadgeView.frame = CGRect(x: (viewSize.width - badgeSize.width)/2, y: 10, width: badgeSize.width, height: badgeSize.height)
			
			let labelSize = controlView.enlapseTimeLabel.sizeThatFits(viewSize)
			controlView.enlapseTimeLabel.frame = CGRect(x: (viewSize.width - labelSize.width)/2, y: viewSize.height - labelSize.height - 18, width: labelSize.width, height: labelSize.height)
		}
		
		controlView?.loadingIndicatorView?.center = controlView?.center ?? .zero
	}
	
	open func cleanUI() {
		topGradientLayer.removeFromSuperlayer()
	}
	
	open func allButtons() -> [UIButton] {
		return []
	}
	
	open func showLoader() {
		if let controlView = controlView {
			if controlView.loadingIndicatorView == nil {
				controlView.loadingIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30), type: NVActivityIndicatorType.lineScale, color: .white, padding: 0)
				controlView.addSubview(controlView.loadingIndicatorView!)
			}
			
			controlView.loadingIndicatorView?.isHidden = false
			controlView.loadingIndicatorView?.startAnimating()
		}
	}
	
	open func hideLoader() {
		controlView?.loadingIndicatorView?.isHidden = true
		controlView?.loadingIndicatorView?.stopAnimating()
	}
	
	open func update(withResource: UZPlayerResource?, video: UZVideoItem?, playlist: [UZVideoItem]?) {
		let isEmptyPlaylist = (playlist?.count ?? 0) < 2
		controlView?.nextButton.isHidden = isEmptyPlaylist
		controlView?.previousButton.isHidden = isEmptyPlaylist
		controlView?.forwardButton.isHidden = !isEmptyPlaylist
		controlView?.backwardButton.isHidden = !isEmptyPlaylist
	}
	
	public func alignLogo() {
		// align logo manually here if needed
	}
	
}
