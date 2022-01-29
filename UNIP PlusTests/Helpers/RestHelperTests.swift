//
//  RestHelperTests.swift
//  UNIP PlusTests
//
//  Created by José Franklin Silva Alves on 27/01/22.
//

import XCTest
@testable import UNIP_Plus

class RestHelperTests: XCTestCase {
    
    struct TestAAPIProvider: APIProvider {
        var path: String
        
        var method: RestMethod
        
        var headers: [String : String]?
        
        var data: Data?
    }
    
    struct SuccessMessage: CodableObject {
        var message: String?
    }
    
    private var provider: TestAAPIProvider?

    override func tearDownWithError() throws {
        provider = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetRequestSuccess() throws {
        let expect = XCTestExpectation(description: "Expect to return status 200")
        
        provider = .init(path: "/v1/test_get_success", method: .GET, headers: nil, data: nil)
        
        provider?.fetch(type: SuccessMessage.self, { result in
            expect.fulfill()
            switch result {
            case .success(let model):
                XCTAssertNotNil(model)
            case .failure(let error):
                XCTAssert(false, error.failureReason ?? "")
            }
        })
        
        wait(for: [expect], timeout: 30)
    }
    
    func testRequestServiceError() throws {
        let expect = XCTestExpectation(description: "Expect to return status 302")
        
        provider = .init(path: "/v1/test_service_error", method: .GET, headers: nil, data: nil)
        
        provider?.fetch(type: SuccessMessage.self, { result in
            expect.fulfill()
            switch result {
            case .success:
                XCTAssert(false)
            case .failure(let error):
                XCTAssertNotNil(error.localizedDescription)
                XCTAssert(error.localizedDescription == "sessão expirada!")
            }
        })
        
        wait(for: [expect], timeout: 30)
    }


}
