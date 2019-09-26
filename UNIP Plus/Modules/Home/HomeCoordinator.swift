//
//  HomeCoordinator.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class HomeCoordinator: BaseCoordinator {
    var navigation: UINavigationController
    
    private var homeVC: HomeViewController
    
    init(navigationController: UINavigationController) {
        self.homeVC = HomeViewController()
        self.navigation = navigationController
    }
    
    func start() {
        homeVC.coordinator = self
        homeVC.viewModel = HomeViewModel()
        
        navigation.interactivePopGestureRecognizer?.isEnabled = false
        navigation.modalPresentationStyle = .overFullScreen
        navigation.pushViewController(homeVC, animated: false)
    }
    
    func logout() {
        navigation.dismiss(animated: true, completion: nil)
    }
    
    func share() {
        
    }
    
    @objc func showMenu() {
        let menuVC = MenuViewController()
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.modalTransitionStyle = .crossDissolve
        menuVC.delegate = homeVC
        
        self.homeVC.present(menuVC, animated: true, completion: nil)
    }
}
