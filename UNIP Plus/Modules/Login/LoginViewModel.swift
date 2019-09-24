//
//  LoginViewModel.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit
import FirebaseRemoteConfig
import SwiftyJSON

protocol LoginViewModelDelegate {
    func showAlert(message: String)
    func userLogged(_ userInfo: JSON)
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
        let json = credentials.toJSON()
        let encrypted = Encryptor.encrypt(text: json!, key: "3s6v9y4B1E3H8McQ")
        
        APIService()
        .requestModule(.Login).post(params: ["authentication": encrypted!])
        .execute(onSuccess: { (data) in
            self.delegate?.userLogged(JSON(parseJSON: data))
        }) { (error) in
            self.delegate?.showAlert(message: error)
        }
        
    }
}
