//
//  AuthenticationProvider.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

enum AuthenticationProvider {
    case authenticate(Credentials)
}

extension AuthenticationProvider: ApiProvider {
    var path: String {
        return ApiResources.authentication
    }
    
    var headers: [String : String] {
        let content = ApiContentType.json
        return content.headers
    }
    
    var method: ApiHttpMethod {
        return .post
    }
    
    var body: Data? {
        switch self {
        case .authenticate(let credentials):
            return credentials.serialize()
        }
    }
}
