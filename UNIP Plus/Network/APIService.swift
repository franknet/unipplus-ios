//
//  APIService.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIService {
    
    enum Modules: String {
        case Login = "http://localhost:3000/api/v1/authentication"
        case Grades = "http://localhost:3000/api/v1/grades"
        case Payments = "http://localhost:3000/api/v1/payments"
        case AcademicRecords = "http://localhost:3000/api/v1/academic-records"
    }
    
    private var _request: URLRequest?
    private var _module: Modules?
    
    func requestModule(_ module: Modules) -> APIService {
        self._module = module
        return self
    }
    
    func get() -> APIService {
        self._request =  Alamofire.request(self._module!.rawValue, method: .get, parameters: nil, encoding: URLEncoding.default, headers:nil).request
        return self
    }
    
    func post(params: [String:String]) -> APIService {
        self._request =  Alamofire.request(_module!.rawValue, method: .post, parameters: params, encoding: JSONEncoding.default, headers:["Content-Type": "application/json"]).request
        return self
    }
    
    public func execute(onSuccess: @escaping (_ content: String) -> Void, onFailure: @escaping (_ error: String) -> Void) {
        if !NetworkReachabilityManager()!.isReachable {
            onFailure("Sem conexão com a internet")
        }
        
        let session = Alamofire.SessionManager.default
        session.request(_request!)
        .validate(statusCode: [200, 400])
        .responseString { (response) in
            switch response.result {
            case .success:
                guard let http_res = response.response else {
                    onFailure("Sem dados de resposta!")
                    return
                }
                if http_res.statusCode == 200 {
                    guard let body = response.result.value else {
                        onFailure("O serviçp não retornou nenhuma informação")
                        return
                    }
                    onSuccess(body)
                } else {
                    guard let body = response.result.value else {
                        onFailure("O serviçp não retornou nenhuma informação")
                        return
                    }
                    let json = JSON(parseJSON: body)
                    onFailure(json["message"].stringValue)
                }
            case .failure:
                onFailure("Os serviços do aplicativo encontra-se fora do ar.")
            }
            
        }
        
    }
    
}
