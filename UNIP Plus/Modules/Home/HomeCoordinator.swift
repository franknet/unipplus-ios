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
    
    init(navigationController: UINavigationController) {
        self.navigation = navigationController
    }
    
    func start() {
        let pageNavigation = UINavigationController()
        pageNavigation.interactivePopGestureRecognizer?.isEnabled = false
        
        let pagerCoordinator = PagerCoordinator(navigation: pageNavigation)
        pagerCoordinator.homeCoordinator = self
        pagerCoordinator.start()
        
        let homeVC = HomeViewController()
        homeVC.coordinator = self
        homeVC.viewModel = HomeViewModel()
        homeVC.pager = pageNavigation
        
        navigation.pushViewController(homeVC, animated: true)
    }
    
    func logout() {
        navigation.popToRootViewController(animated: true)
    }
}
