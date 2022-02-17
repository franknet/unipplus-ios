//
//  HomeCoordinator.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 01/02/22.
//

import UIKit

class HomeCoordinator: Coordinator {
    var navigator: UINavigationController
    
    var children: [Coordinator] = []
    
    init() {
        self.navigator = UINavigationController()
    }
    
    func setUp() {
        guard let authenticationCoordinator = children.first else { return }
        let homeView = HomeViewController()
        let embedNavigationView = EmbedNavigationViewController(rootViewController: homeView, navigator)
        authenticationCoordinator.navigator.pushViewController(embedNavigationView, animated: true)
    }
    
    func finish() {
        
    }
}

extension HomeCoordinator: HomeViewModelDelegate {
    
}
