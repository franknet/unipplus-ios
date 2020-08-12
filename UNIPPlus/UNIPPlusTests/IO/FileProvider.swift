//
//  FileProvider.swift
//  UNIPPlusTests
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

class FileProvider {
    
    static func loadDataFrom(fileName name: String) -> Data? {
        let bundle = Bundle(for: FileProvider.self)
        guard let url = bundle.url(forResource: name, withExtension: "json") else { return nil }
        return try? Data(contentsOf: url)
    }
    
}
