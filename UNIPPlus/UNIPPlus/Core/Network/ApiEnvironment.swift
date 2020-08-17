//
//  ApiEnvironment.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 16/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

struct ApiEnvironment {
    static let version = "/api/v1"
    static var host: String {
        #if DEBUG
            return "https://07xc1cofdj.execute-api.sa-east-1.amazonaws.com/Prod" + version
        #else
            return ""
        #endif
    }
}
