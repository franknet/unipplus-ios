//
//  UserRepository.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 07/10/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import Foundation

class UserRepository {
    
    static var userConfiguration: UserConfiguration {
        get {
            let defaults = UserDefaults.standard
            guard let user_data = defaults.data(forKey: "user_config") else {
                return UserConfiguration()
            }
            return JSONHelper.Deserialize(type: UserConfiguration.self, jsonData: user_data)!
        }
        set {
            let user_data = JSONHelper.SerializeToData(obj: newValue)
            let defaults = UserDefaults.standard
            defaults.set(user_data, forKey: "user_config")
        }
    }
    
}
