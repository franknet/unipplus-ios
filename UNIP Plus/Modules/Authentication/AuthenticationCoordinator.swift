//
//  AuthenticationCoordinator.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 01/02/22.
//

import UIKit

class AuthenticationCoordinator: Coordinator {
    var navigator: UINavigationController
    
    var children: [Coordinator] = []
    
    private let window: UIWindow?
    
    required init(withWindow window: UIWindow?) {
        self.window = window
        self.navigator = UINavigationController()
    }
    
    func setUp() {
        navigator.navigationBar.isHidden = true
        window?.rootViewController = navigator
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        pushAuthenticationViewCOntroller()
        Session.shared.delegate = self
    }
    
    func finish() {
        exit(0)
    }
    
    func pushAuthenticationViewCOntroller() {
        let authViewModel = AuthenticationViewModel()
        authViewModel.delegate = self
        let authView = AuthenticationViewController(withViewModel: authViewModel)
        navigator.pushViewController(authView, animated: false)
    }
}

extension AuthenticationCoordinator: AuthenticationViewModelDelegate {
    func pushHomeViewController(_ viewModel: AuthenticationViewModel) {
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.children.append(self)
        homeCoordinator.setUp()
    }
}

extension AuthenticationCoordinator: SessionDelegate {
    func logOut(_ session: Session) {
        navigator.popToRootViewController(animated: true)
    }
}
