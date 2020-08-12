//
//  AppCoordinator.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    var navigator: UINavigationController?
    
    var children: [BaseCoordinator] = []
    
    var window: UIWindow?
    
    func start() {
        navigator = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = navigator
        window?.makeKeyAndVisible()
    }
    
    func end() {
        
    }
    
    
}

