//
//  JSONHelper.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 26/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import Foundation

class JSONHelper {
    static func SerializeToData<T: Codable>(obj: T) -> Data? {
        do {
            return try JSONEncoder().encode(obj)
        } catch { return nil }
    }
    
    static func SerializeToString<T: Codable>(obj: T) -> String? {
        do {
            let data = try JSONEncoder().encode(obj)
            return String(data: data, encoding: .utf8)
        } catch { return nil }
    }
    
    static func Deserialize<T: Codable>(type: T.Type, jsonData data: Data) -> T? {
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch { return nil }
    }
    
    static func Deserialize<T: Codable>(type: T.Type, jsonString string: String) -> T? {
        do {
            let data = string.data(using: .utf8)
            return try JSONDecoder().decode(type, from: data!)
        } catch { return nil }
    }
}
