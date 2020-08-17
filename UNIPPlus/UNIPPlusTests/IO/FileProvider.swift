//
//  FileProvider.swift
//  UNIPPlusTests
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation
@testable import UNIP_Plus

class FileProvider {
    
    static func loadDataFrom(fileName name: String) -> Data? {
        let bundle = Bundle(for: FileProvider.self)
        guard let url = bundle.url(forResource: name, withExtension: "json") else { return nil }
        return try? Data(contentsOf: url)
    }
    
    static func fileToModel<T: BaseModel>(fileName name: String) -> T? {
        guard let data = loadDataFrom(fileName: name) else { return nil }
        guard let model: T = T.deserialize(from: data) else { return nil }
        return model
    }
    
}
