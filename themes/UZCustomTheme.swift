//
//  UZCustomTheme.swift
//  Uiza
//
//  Created by Nam Kennic on 8/17/18.
//  Copyright © 2018 Nam Kennic. All rights reserved.
//

import UIKit
import UizaSDK

open class UZCustomTheme: UZPlayerTheme {
	// player sẽ tự động set giá trị này, bạn sẽ có thể lấy các button control nằm trong view này
	public weak var controlView: UZPlayerControlView? = nil
	
	/*
	Khởi tạo giao diện
	*/
	open func updateUI() {
		
	}
	
	/*
	Sắp xếp giao diện
	*/
	open func layoutControls(rect: CGRect) {
		
	}
	
	/*
	Xóa hết giao diện
	*/
	open func cleanUI() {
		
	}
	
	/*
	Trả về các nút tạo thêm trong giao diện này (nếu có)
	*/
	open func allButtons() -> [UIButton] {
		return []
	}
	
	/*
	Hiện loader
	*/
	open func showLoader() {
		
	}
	
	/*
	Ẩn loader
	*/
	open func hideLoader() {
		controlView?.loadingIndicatorView?.isHidden = true
		controlView?.loadingIndicatorView?.stopAnimating()
	}
	
	/*
	Cập nhật lại giao diện dựa trên video hoặc playlist của player
	*/
	open func update(withResource: UZPlayerResource?, video: UZVideoItem?, playlist: [UZVideoItem]?) {
		let isEmptyPlaylist = (playlist?.count ?? 0) == 0
		
		controlView?.nextButton.isHidden = isEmptyPlaylist
		controlView?.previousButton.isHidden = isEmptyPlaylist
		controlView?.forwardButton.isHidden = !isEmptyPlaylist
		controlView?.backwardButton.isHidden = !isEmptyPlaylist
	}
	
}
