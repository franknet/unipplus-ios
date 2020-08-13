//
//  ApiError.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

enum ApiError {
    case none(Error)
    case malFormedUrl
    case noInternetConnection
    case parserError
    case serviceError(ApiResponse)
}

extension ApiError: Error {
    var localizedDescription: String {
        switch self {
        case .none(let error):
            return error.localizedDescription
        case .malFormedUrl:
            return "Wrong url format"
        case .noInternetConnection:
            return "Verifique sua conexão e tente novamente"
        case .parserError:
            return "Não foi possível obter as informações"
        case .serviceError(let response):
            return response.message
        }
    }

    var _code: Int {
        switch self {
        case .none: return 999
        case .malFormedUrl: return 001
        case .noInternetConnection: return 002
        case .parserError: return 003
        case .serviceError:  return 004
        }
    }
    
    func nsError() -> NSError {
        return NSError(domain: "", code: _code, userInfo: [NSLocalizedDescriptionKey : localizedDescription])
    }
}
