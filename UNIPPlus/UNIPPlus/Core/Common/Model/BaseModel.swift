//
//  BaseModel.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

protocol BaseModel: Codable { }

extension BaseModel {
    func serialize() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    static func deserialize<T: BaseModel>(from data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data) as T
    }
}
