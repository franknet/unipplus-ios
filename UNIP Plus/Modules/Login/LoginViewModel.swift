//
//  LoginViewModel.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit
import FirebaseRemoteConfig

protocol LoginViewModelDelegate {
    func showAlert(message: String)
    func userLogged(_ userInfo: UserInfo?)
}

class LoginViewModel: BaseViewModel {
    var delegate: LoginViewModelDelegate?
    
    func viewDidLoad() {
        loadRemoteConfig()
    }
    
    func loadRemoteConfig() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        
        let remote = RemoteConfig.remoteConfig()
        remote.configSettings = settings
        
        remote.fetch { (status, error) in
            switch status {
            case .success:
                remote.activate { (error) in
                    guard error != nil else { return }
                    print(status)
                }
            case .failure:
                break
            default:
                break
            }
        }
        
    }
    
    func performLoginWithCredentials(_ credentials: [String:String]) {
        
        
    }
}
