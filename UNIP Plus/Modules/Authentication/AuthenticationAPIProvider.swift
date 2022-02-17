//
//  AuthenticationAPIProvider.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

enum AuthenticationAPIProvider: APIProvider {
    
    case login(credentials: Credentials)
    
    var path: String  {
        switch self {
        case .login:
            return "/v1/authentication"
        }
    }
    
    var method: RestMethod {
        switch self {
        case .login:
            return .POST
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login:
            return ["Content-Type": "application/json"]
        }
    }
    
    var data: Data? {
        switch self {
        case .login(let credentials):
            return credentials.encode()
        }
    }
    
}
