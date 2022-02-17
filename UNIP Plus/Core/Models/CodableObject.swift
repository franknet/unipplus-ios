//
//  CodableObject.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 26/01/22.
//

import Foundation

protocol CodableObject: Codable, Equatable { }

extension CodableObject {
    static func decode(fromData data: Data) -> Self? {
        return try? JSONDecoder().decode(Self.self, from: data)
    }
    
    func encode() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}

extension Array: CodableObject where Element: CodableObject { }
