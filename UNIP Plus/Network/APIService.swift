//
//  APIService.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    private struct APIError: Codable {
        var message: String!
    }
    
    enum Modules: String {
        case Login = "http://localhost:3000/api/v1/authentication"
        case Disciplines = "http://localhost:3000/api/v1/disciplines"
        case Payments = "http://localhost:3000/api/v1/payments"
        case AcademicRecords = "http://localhost:3000/api/v1/academic-records"
    }
    
    private var _request: URLRequest?
    private var _module: Modules?
    
    func requestModule(_ module: Modules) -> APIService {
        self._module = module
        return self
    }
    
    func get(headers: HTTPHeaders? = nil) -> APIService {
        
        self._request =  AF.request(self._module!.rawValue, method: .get, parameters: nil, encoding: URLEncoding.default, headers:headers).request
        return self
    }
    
    func post(params: [String:String], headers: HTTPHeaders? = nil) -> APIService {
        self._request =  AF.request(_module!.rawValue, method: .post, parameters: params, encoding: JSONEncoding.default, headers:headers).request
        return self
    }
    
    public func execute(onSuccess: @escaping (_ data: Data?) -> Void, onFailure: @escaping (_ error: String) -> Void) {
        if !NetworkReachabilityManager()!.isReachable {
            onFailure("Sem conexão com a internet")
        }
        let session = Session.default
        session.request(_request!)
        .validate(statusCode: [200, 302, 400])
        .responseData { (response) in
            switch response.result {
            case .success:
                guard let http_res = response.response else {
                    onFailure("Sem dados de resposta!")
                    return
                }
                guard let data = response.data else {
                    onFailure("O serviçp não retornou nenhuma informação")
                    return
                }
                if http_res.statusCode == 200 {
                    onSuccess(data)
                } else {
                    let result = JSONHelper.Deserialize(type: APIError.self, jsonData: data)
                    onFailure(result!.message)
                }
            case .failure:
                onFailure("Os serviços do aplicativo encontra-se fora do ar.")
            }
            
        }
        
    }
    
}
