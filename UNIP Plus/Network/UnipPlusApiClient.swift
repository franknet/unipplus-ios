//
//  UnipPlusApiClient.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 10/03/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation
import Alamofire

enum UnipPlusApiClientResources {
    case authentication(_ credentials: Credentials)
    case disciplines
    case payments
    case paymentsDownloadPdf(_ dueDt: String)
    case academicRecords
    case academicRecordsDownloadPdf
    case library
    case librarySearch(_ library: Library)
    case resourcesUserImage(_ ra: String)
}

class UnipPlusApiClient {
    typealias onSuccessModelBlock<T: BaseModel> = (_ model: T?, _ error: String?) -> Void
    typealias onSuccessDataBlock = (_ data: Data?, _ error: String?) -> Void
    fileprivate final let API_BASE_URL = "https://07xc1cofdj.execute-api.sa-east-1.amazonaws.com/Prod"
    fileprivate final let API_VERSION = "/api/v1"
    fileprivate var resource: UnipPlusApiClientResources?
    fileprivate var defaultHeaders: [String: String] = [
        "Content-Type":"application/json; charset=utf-8"
    ]
    fileprivate var endpoint: String {
        switch resource! {
        case .authentication:
            return API_BASE_URL + API_VERSION + "/authentication"
        case .disciplines:
            return API_BASE_URL + API_VERSION + "/disciplines"
        case .payments:
            return API_BASE_URL + API_VERSION + "/payments"
        case .paymentsDownloadPdf(let dueDt):
            return API_BASE_URL + API_VERSION + "/payments/download?dueDt=" + dueDt
        case .academicRecords:
            return API_BASE_URL + API_VERSION + "/academic-records"
        case .academicRecordsDownloadPdf:
            return API_BASE_URL + API_VERSION + "/academic-records/download"
        case .library:
            return API_BASE_URL + API_VERSION + "/library"
        case .librarySearch:
            return API_BASE_URL + API_VERSION + "/library/search"
        case .resourcesUserImage(let ra):
            return API_BASE_URL + API_VERSION + "/resources/user?ra=" + ra
        }
    }
    fileprivate var method: String {
        switch resource! {
        case .authentication, .librarySearch:
            return "post"
        default:
            return "get"
        }
    }
    fileprivate var headers: [String:String] {
        switch resource! {
        case .academicRecordsDownloadPdf, .paymentsDownloadPdf:
            defaultHeaders["Content-Type"] = "application/pdf"
            defaultHeaders["Accept"] = "application/pdf"
        case .resourcesUserImage:
            defaultHeaders["Content-Type"] = "image/jpeg"
            defaultHeaders["Accept"] = "image/jpeg"
        default:
            break
        }
        return defaultHeaders
    }
    fileprivate var body: Data? {
        //TODO: serialize objects
        switch resource! {
        case .authentication(let credentials):
            return credentials.serialize()
        case .librarySearch(let library):
            return library.serialize()
        default:
            return nil
        }
    }
    fileprivate func buildRequest() -> URLRequest {
        let url = URL(string: endpoint)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method
        request.httpBody = body
        return request
    }
    func fetchResource(_ resource: UnipPlusApiClientResources) -> UnipPlusApiClient {
        self.resource = resource
        return self
    }
    func execute<T: BaseModel>(for model: T.Type, completionHandler: @escaping onSuccessModelBlock<T>) {
        let request = buildRequest()
        AF.request(request)
        .validate()
        .responseData { response in
            switch response.result {
            case .success(let data):
                completionHandler(model.descerialize(data: data), nil)
            case .failure(let error):
                if let data = response.data {
                    let apiError: ApiError = ApiError.descerialize(data: data)!
                    completionHandler(nil, apiError.message)
                } else {
                    completionHandler(nil, error.errorDescription)
                }
            }
        }
    }
    func execute(completionHandler: @escaping onSuccessDataBlock) {
        let request = buildRequest()
        AF.request(request)
        .validate()
        .responseData { response in
            switch response.result {
            case .success(let data):
                completionHandler(data, nil)
            case .failure(let error):
                if let data = response.data {
                    let apiError: ApiError = ApiError.descerialize(data: data)!
                    completionHandler(nil, apiError.message)
                } else {
                    completionHandler(nil, error.errorDescription)
                }
            }
        }
    }
    
}
