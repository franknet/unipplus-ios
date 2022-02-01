//
//  AuthenticationAPIProvider.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

struct AuthenticationAPIProvider: APIProvider {
    
    let credentials: Credentials
    
    var path: String = "/v1/authentication"
    
    var method: RestMethod = .POST
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
    
    var data: Data? {
        credentials.encode()
    }
    
}
