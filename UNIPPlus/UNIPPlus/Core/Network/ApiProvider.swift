//
//  ApiProvider.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

protocol ApiProvider {
    var path: String { get }
    var headers: [String:String] { get }
    var method: ApiHttpMethod { get }
}

extension ApiProvider {
    
    var endpoint: URL? {
        return URL(string: ApiEnvironment.host + path)
    }
    
    var body: Data? { get { return nil } set {} }
}
