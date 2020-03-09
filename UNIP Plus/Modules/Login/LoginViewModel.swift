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
    
    func viewDidLoad() {
        
    }
    
    func performLogin(ra: String?, password: String?) {
        let credentials = Credentials()
        credentials!.ra = ra
        credentials!.password = password
        
        let client = UnipPlusApiClient.default()
        client.apiV1AuthenticationPost(payload: credentials!).continueWith { [weak self] task in
            DispatchQueue.main.async {
                guard let self = self else { return }
                guard let result = task.result else { return }
                print(result)
                if task.error != nil {
                    self.coordinator.login(self, didFinishWithError: result.message!)
                } else {
                    self.coordinator.login(self, didFinishWithResult: result)
                }
            }
            return nil
        }
    }
}

fileprivate extension LoginViewModel {
    func fetchRemoteConfig() {
        
    }
}
