//
//  ApiContentType.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 12/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

enum ApiContentType {
    case json
    case pdf
    case jpeg
}

extension ApiContentType {
    var headers: [String:String] {
        switch self {
        case .json:
            return ["Content-Type": "application/json; charset-utf8;"]
        case .jpeg:
            return ["Content-Type": "image/jpeg"]
        case .pdf:
            return ["Content-Type": "application/pdf"]
        }
    }
}
