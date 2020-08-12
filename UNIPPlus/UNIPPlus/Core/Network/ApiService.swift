//
//  ApiService.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class ApiService {
    private var session: Session?
    
    init(session: Session) {
        self.session = session
    }
    
    init() {
        let config = URLSessionConfiguration.af.default
        session = Session(configuration: config)
    }
    
    func fetch<T: BaseModel>(provider: ApiProvider) -> Observable<T> {
        return Observable.create { observer -> Disposable in
            if !self.isConnected() {
                observer.onError(ApiError.noInternetConnection)
            }
            
            guard let request = self.buildRequestFromProvider(provider) else {
                observer.onError(ApiError.malFormedUrl)
                return Disposables.create { }
            }
            
            self.execute(request) { response in
                switch response.result {
                case .success(let data):
                    guard let model: T = T.deserialize(from: data) else {
                        observer.onError(ApiError.parserError)
                        return
                    }
                    observer.onNext(model)
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create { }
        }
    }
    
    func download(provider: ApiProvider) -> Observable<Data> {
        return Observable.create { observer -> Disposable in
            if !self.isConnected() {
                observer.onError(ApiError.noInternetConnection)
            }
            
            guard let request = self.buildRequestFromProvider(provider) else {
                observer.onError(ApiError.malFormedUrl)
                return Disposables.create { }
            }
            
            self.execute(request) { response in
                switch response.result {
                case .success(let data):
                    observer.onNext(data)
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create { }
        }
    }
    
    private func isConnected() -> Bool {
        return NetworkReachabilityManager()?.isReachableOnEthernetOrWiFi ?? false
    }
    
    private func buildRequestFromProvider(_ provider: ApiProvider) -> URLRequest? {
        guard let endpoint = provider.endpoint else { return nil }
        var request = URLRequest(url: endpoint)
        request.httpMethod = provider.method
        request.allHTTPHeaderFields = provider.headers
        request.httpBody = provider.body
        request.timeoutInterval = 60
        return request
    }
    
    private func execute(_ request: URLRequest, response: @escaping (AFDataResponse<Data>) -> Void) {
        session?.request(request)
        .validate()
        .responseData(completionHandler: response)
    }
    
}
