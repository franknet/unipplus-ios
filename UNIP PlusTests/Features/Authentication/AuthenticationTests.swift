//
//  AuthenticationTests.swift
//  UNIP PlusTests
//
//  Created by José Franklin Silva Alves on 05/02/22.
//

import XCTest
@testable import UNIP_Plus

class AuthenticationTests: XCTestCase {
    
    private var viewModel: AuthenticationViewModel?
    
    override func setUp() async throws {
        viewModel = AuthenticationViewModel()
    }
    
    override func tearDown() async throws {
        viewModel = nil
    }
    
    func testLoginWithSuccess() {
        
    }
    
    
}
