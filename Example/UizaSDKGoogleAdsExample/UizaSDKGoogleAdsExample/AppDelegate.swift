//
//  AppDelegate.swift
//  UizaSDKGoogleAdsExample
//
//  Created by phan.huynh.thien.an on 6/12/19.
//  Copyright © 2019 uiza. All rights reserved.
//

import UIKit
import UizaSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UizaSDK.initWith(appId: "9816792bb84642f09d843af4f93fb748", token: "uap-9816792bb84642f09d843af4f93fb748-b94fcbd1", api: "loctbprod01.uiza.co", enviroment: .production)
        UizaSDK.showRestfulInfo = true
        return true
    }
    
}
