//
//  AppDelegate.swift
//  HapticFeedback
//
//  Created by Egor Iskrenkov on 09/23/2020.
//  Copyright (c) 2020 Egor Iskrenkov. All rights reserved.
//

import UIKit
import HapticFeedback

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        initialize()

        return true
    }

}

extension AppDelegate {

    func initialize() {
        HapticGenerator.enabled = UserDefaults.standard.bool(forKey: "haptic_enabled")
    }

}
