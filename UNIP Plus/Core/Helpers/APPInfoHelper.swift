//
//  APPInfoHelper.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 24/01/22.
//

import Foundation

class AppInfoHelper {
    
    private static var info: NSDictionary? {
        guard
            let filePath = Bundle.main.path(forResource: "info", ofType: "plist"),
            let fileURL = URL(string: filePath)
        else { return nil }
        return NSDictionary(contentsOf: fileURL)
    }
    
    static var baseURL: String {
        info?["BASE_URL"] as? String ?? ""
    }
}
