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
        navigation = navigationController
    }
    
    func start() {
        let homeVC = HomeViewController(viewModel: HomeViewModel(coordinator: self))
        navigation.interactivePopGestureRecognizer?.isEnabled = false
        navigation.modalPresentationStyle = .overFullScreen
        navigation.modalTransitionStyle = .coverVertical
        navigation.pushViewController(homeVC, animated: false)
    }
}

extension HomeCoordinator: HomeViewModelCoordinatorDelegate {
    func home(_ viewModel: HomeViewModel, openMenuWithCompletion completion: (() -> Void)?) {
        let menuVC = MenuViewController()
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.modalTransitionStyle = .crossDissolve
        navigation.present(menuVC, animated: true, completion: completion)
    }
    
}
