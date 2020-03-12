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
    
    var loginVM: LoginViewModel!
    var loginVC: LoginViewController!

    init(navigationController: UINavigationController) {
        self.navigation = navigationController
    }
    
    func start() {
        loginVM = LoginViewModel(coordinator: self)
        loginVC = LoginViewController(viewModel: loginVM)
        
        navigation.interactivePopGestureRecognizer?.isEnabled = false
        navigation.navigationBar.isHidden = true
        navigation.pushViewController(loginVC, animated: false)
    }
}

extension LoginCoordinator: LoginViewModelCoordinatorDelegate {
    func login(_ viewModel: LoginViewModel, didFinishWithError error: String) {
        showAlertWithMessage(error)
    }
    func login(_ viewModel: LoginViewModel, didFinishWithResult result: LoginResponse) {
        let coordinator = HomeCoordinator(navigationController: UINavigationController())
        coordinator.start()
        navigation.present(coordinator.navigation, animated: true, completion: nil)
    }
}
