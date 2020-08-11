//
//  ApiError.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

enum ApiError {
    case malFormedUrl
    case noInternetConnection
    case parserError
}

extension ApiError: BaseError {
    var localizedDescription: String {
        switch self {
        case .malFormedUrl:
            return "Wrong url format"
        case .noInternetConnection:
            return "Verifique sua conexão e tente novamente"
        case .parserError:
            return "Não foi possível obter as informações"
        }
    }
}
