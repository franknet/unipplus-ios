//
//  ApiServiceExtension.swift
//  UNIPPlusTests
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation
import Alamofire
import Mocker

@testable import UNIP_Plus

extension ApiService {
    static func mock() -> ApiService {
        let config = URLSessionConfiguration.af.default
        config.protocolClasses = [MockingURLProtocol.self]
        return ApiService(session: Session(configuration: config))
    }
    
    func mockResource(_ resource: String, method: Mock.HTTPMethod, responseFile name: String, statusCode code: Int) {
        guard let endpoint = URL(string: ApiEnvironment.host + resource) else { return }
        guard let data = FileProvider.loadDataFrom(fileName: name) else { return }
        Mock(url: endpoint, ignoreQuery: true, dataType: .json, statusCode: code, data: [method : data]).register()
    }
}
