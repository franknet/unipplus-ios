//
//  BaseModel.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 10/03/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

protocol BaseModel: Codable {

}

extension BaseModel {
    func serialize() -> Data? {
        let encoder = JSONEncoder()
        return try! encoder.encode(self)
    }
    static func descerialize<T: BaseModel>(data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            print("descerialization error:\n")
            print(error)
        }
        return nil
    }
}
