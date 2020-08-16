//
//  ApiEnvironment.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

class Environment {
    static var BASE_URL: String {
        #if DEBUG
            return "https://07xc1cofdj.execute-api.sa-east-1.amazonaws.com/Prod"
        #else
            return ""
        #endif
    }
}
