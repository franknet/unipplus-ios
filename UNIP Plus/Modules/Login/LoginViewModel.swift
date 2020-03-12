//
//  LoginViewModel.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit
import FirebaseRemoteConfig

protocol LoginViewModelCoordinatorDelegate: AnyObject {
    func login(_ viewModel: LoginViewModel, didFinishWithError error: String)
    func login(_ viewModel: LoginViewModel, didFinishWithResult result: LoginResponse)
}

protocol LoginViewModelDelegate: AnyObject {
    
}

class LoginViewModel: BaseViewModel {
    weak var delegate: LoginViewModelDelegate!
    fileprivate var coordinator: LoginViewModelCoordinatorDelegate
    
    init(coordinator: LoginViewModelCoordinatorDelegate) {
        self.coordinator = coordinator
    }
    
    func performLogin(ra: String?, password: String?) {
        let credentials = Credentials(withRa: ra!, andPassword: password!)
        UnipPlusApiClient().fetchResource(.authentication(credentials))
        .execute(for: LoginResponse.self) { [weak self] (result, error) in
            guard let self = self else { return }
            if let error = error {
                self.coordinator.login(self, didFinishWithError: error)
            } else {
                self.coordinator.login(self, didFinishWithResult: result!)
            }
        }
    }
}
