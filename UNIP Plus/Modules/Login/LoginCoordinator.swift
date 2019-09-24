//
//  LoginCoordinator.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class LoginCoordinator: BaseCoordinator {
    
    var navigation: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigation = navigationController
    }
    
    func start() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        loginVC.viewModel = LoginViewModel()
        
        navigation.interactivePopGestureRecognizer?.isEnabled = false
        navigation.navigationBar.isHidden = true
        navigation.pushViewController(loginVC, animated: false)
    }
    
    func pushHome() {
        let homeVC = HomeCoordinator(navigationController: navigation)
        homeVC.start()
    }
}
