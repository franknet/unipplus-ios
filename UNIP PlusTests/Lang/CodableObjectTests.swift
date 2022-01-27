//
//  CodableObjectTests.swift
//  UNIP PlusTests
//
//  Created by José Franklin Silva Alves on 26/01/22.
//

import XCTest
@testable import UNIP_Plus

class CodableObjectTests: XCTestCase {
    
    struct CodableObjectTest: CodableObject {
        var name: String?
        var age: Int?
    }
    
    var jsonData: Data?
    var jsonArrayData: Data?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        var json = [String:Any]()
        json["name"] = "José"
        json["age"] = 32
        
        jsonData = try? JSONSerialization.data(withJSONObject: json, options: [])
        jsonArrayData = try? JSONSerialization.data(withJSONObject: [json], options: [])
    }

    override func tearDownWithError() throws {
        jsonData = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecode() throws {
        guard let jsonData = jsonData, let jsonArrayData = jsonArrayData else {
            return
        }

        let model = CodableObjectTest.decode(fromData: jsonData)
        XCTAssertNotNil(model, "Could not decode json")
        XCTAssertNotNil(model?.name, "Could not decode name property")
        XCTAssertNotNil(model?.age, "Could not decode age property")
        
        let models = [CodableObjectTest].decode(fromData: jsonArrayData)
        XCTAssertNotNil(models, "Could not decode json array")
        XCTAssertTrue(models?.count ?? 0 > 0, "Could not decode json array elements")
    }
    
    func testEncode() {
        let model = CodableObjectTest(name: "José", age: 32)
        let objectData = model.encode()
        XCTAssertNotNil(objectData, "Could not encode Codable Object")
        
        let models: [CodableObjectTest] = [.init(name: "José", age: 32)]
        let arrayData = models.encode()
        XCTAssertNotNil(arrayData, "Could not encode Codable Array")
    }
}
