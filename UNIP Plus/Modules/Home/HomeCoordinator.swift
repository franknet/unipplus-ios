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
        let pageNavigation = UINavigationController()
        pageNavigation.interactivePopGestureRecognizer?.isEnabled = false
        
        let pagerCoordinator = PagerCoordinator(navigation: pageNavigation)
        pagerCoordinator.homeCoordinator = self
        pagerCoordinator.start()
        
        homeVC.coordinator = self
        homeVC.viewModel = HomeViewModel()
        homeVC.pager = pageNavigation
        
        navigation.pushViewController(homeVC, animated: true)
    }
    
    func logout() {
        navigation.popToRootViewController(animated: true)
    }
    
    func showMenu() {
        let menuVC = MenuViewController()
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.modalTransitionStyle = .crossDissolve
        menuVC.coordinator = self
        
        self.homeVC.present(menuVC, animated: true) {
            
        }
    }
}
