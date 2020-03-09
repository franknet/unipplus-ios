//
//  BaseModel.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 06/03/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

class BaseModel: Codable {
    
    func SerializeToData() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch { return nil }
    }
    
    func SerializeToString() -> String? {
        do {
            let data = try JSONEncoder().encode(self)
            return String(data: data, encoding: .utf8)
        } catch { return nil }
    }
    
    static func Deserialize<T: BaseModel>(jsonData data: Data) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch { return nil }
    }
    
    static func Deserialize<T: BaseModel>(jsonString string: String) -> T? {
        do {
            let data = string.data(using: .utf8)
            return try JSONDecoder().decode(T.self, from: data!)
        } catch { return nil }
    }
}
