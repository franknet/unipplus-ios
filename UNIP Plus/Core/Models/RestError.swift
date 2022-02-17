//
//  RestError.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 24/01/22.
//

import Foundation

enum RestError: LocalizedError, Equatable {
    static func == (lhs: RestError, rhs: RestError) -> Bool {
        return lhs.localizedDescription == rhs.localizedDescription
    }
    
    case badRequest
    case noData
    case serviceError(String)
    case serviceUnavaliable
    case unknow(Error)
    case decodeError
    case noInternet
    
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Ocorreu um erro na requisição"
        case .noData:
            return "Nenhum dado encotrado"
        case .serviceError(let message):
            return message
        case .serviceUnavaliable:
            return "Serviço indisponível"
        case .unknow(let error):
            return error.localizedDescription
        case .decodeError:
            return "Modelo divergente aos dados retornados"
        case .noInternet:
            return "Sem conexão com a internet"
        }
    }
}
