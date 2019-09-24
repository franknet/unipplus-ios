//
//  Encryptor.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 18/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import Foundation
import CryptoSwift

class Encryptor {
    
    static func encrypt(text: String, key: String) -> String? {
        do {
            let encryptor = try AES(key: key, iv: key)
            let result = try encryptor.encrypt(text.utf8.map { UInt8($0) })
            var data = Data(bytes: result, count: result.count)
            data = data.base64EncodedData(options: .lineLength64Characters)
            return String(data: data, encoding: .utf8)
        } catch  {
            return nil
        }
    }
    
}
