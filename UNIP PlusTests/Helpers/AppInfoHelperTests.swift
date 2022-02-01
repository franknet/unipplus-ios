//
//  AppInfoHelperTests.swift
//  UNIP PlusTests
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import XCTest
@testable import UNIP_Plus

class AppInfoHelperTests: XCTestCase {
    
    func testLoadProperties() {
        let baseURL = AppInfoHelper.baseURL
        XCTAssertNotEqual(baseURL, "")
    }
    
}
