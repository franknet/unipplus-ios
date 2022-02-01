//
//  FinanceAPIProvider.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

enum FinanceAPIProvider: APIProvider {
    
    case payments
    case bankSlip(String)
    
    var path: String  {
        switch self {
        case .payments:
            return "/v1/finance/payments"
        case .bankSlip(let path):
            return path
        }
    }
    
    var method: RestMethod  {
        .GET
    }
    
}
