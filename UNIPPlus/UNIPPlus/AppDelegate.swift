//
//  AppDelegate.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 09/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        coordinator = AppCoordinator()
        coordinator?.start()
        window = coordinator?.window
        
        return true
    }

}

