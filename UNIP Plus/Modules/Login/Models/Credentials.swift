//
//  Credentials.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 09/03/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

class Credentials: BaseModel {
    let ra: String
    let password: String
    
    required init(withRa: String, andPassword: String) {
        self.ra = withRa
        self.password = andPassword
    }
}
