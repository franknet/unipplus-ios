//
//  DisciplinesAPIProvider.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

struct DisciplinesAPIProvider: APIProvider {
    
    var path: String = "/v1/disciplines"
    
    var method: RestMethod = .GET
    
}
