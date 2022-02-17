//
//  AppDelegate.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 02/11/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        AuthenticationCoordinator(withWindow: window).setUp()
        
        return true
    }

}

