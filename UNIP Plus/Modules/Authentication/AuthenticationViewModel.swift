//
//  AuthenticationViewModel.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

protocol AuthenticationViewModelDelegate: AnyObject {
    func pushHomeViewController(_ viewModel: AuthenticationViewModel)
}

class AuthenticationViewModel {
    
    weak var delegate: AuthenticationViewModelDelegate?
    
    let id = DynamicObject<String>()
    let password = DynamicObject<String>()
    let error = DynamicObject<String>()
    
    func performLoginWithCredentials() {
        AuthenticationAPIProvider.login(credentials: .init(id: id.value, password: password.value))
            .fetch(modelType: User.self).subscribe(event: { [weak self] event in
                guard let self = self else { return }
                
                switch event {
                case .next(let user):
                    Session.shared.user = user
                    self.delegate?.pushHomeViewController(self)
                case .error(let error):
                    self.error.value = error.localizedDescription
                default: break
                }
            })
    }
}
