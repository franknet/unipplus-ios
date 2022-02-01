//
//  APIProvider.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 24/01/22.
//

import Foundation

protocol APIProvider {
    var path: String { get }
    var method: RestMethod { get }
    var headers: [String:String]? { get }
    var data: Data? { get }
    
    func fetch(_ completion: @escaping (Result<Data, RestError>) -> Void)
    func fetch<T: CodableObject>(modelType type: T.Type, _ completion: @escaping (Result<T, RestError>) -> Void)
}

extension APIProvider {
    
    var headers: [String:String]? { get { nil } }
    var data: Data? { get { nil } }
    
    func fetch(_ completion: @escaping (Result<Data, RestError>) -> Void) {
        RestHelper().fetch(provider: self, completion)
    }
    
    func fetch<T: CodableObject>(modelType type: T.Type, _ completion: @escaping (Result<T, RestError>) -> Void) {
        RestHelper().fetch(provider: self) { result in
            switch result {
            case .success(let data):
                if let model = type.decode(fromData: data) {
                    completion(.success(model))
                } else {
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
