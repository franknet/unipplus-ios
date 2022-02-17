//
//  DynamicObjectTests.swift
//  UNIP PlusTests
//
//  Created by José Franklin Silva Alves on 07/02/22.
//

import XCTest
@testable import UNIP_Plus

class DynamicObjectTests: XCTestCase {
    
    class BindableObject: NSObject {
        var text: String? {
            didSet {
                rx.value = self.text
            }
        }
        
        var rx: DynamicObject<String> {
            if let value = objc_getAssociatedObject(self, "rx") as? DynamicObject<String> {
                return value
            }
            
            let value = DynamicObject<String>()
            objc_setAssociatedObject(self, "rx", value, .OBJC_ASSOCIATION_RETAIN)
            return value
        }
    }
    
    var dynamicObject: DynamicObject<String>?
    var dynamicObject2: DynamicObject<String>?
    var bindableObject: BindableObject?

    override func setUpWithError() throws {
        dynamicObject = .init()
        dynamicObject2 = .init()
        bindableObject = .init()
    }

    override func tearDownWithError() throws {
        dynamicObject = nil
        dynamicObject2 = nil
        bindableObject = nil
    }

    func testSetValueWithSuccess() throws {
        dynamicObject?.subscribe(next:{ value in
            XCTAssertNotNil(value)
        })
        
        dynamicObject?.value = "Ok"
    }
    
    func testSetErrorEventWithSuccess() throws {
        dynamicObject?.subscribe(event:{ event in
            switch event {
            case .error:
                XCTAssert(true)
            default:
                XCTAssert(false)
            }
        })
        
        dynamicObject?.error = RestError.noData
    }
    
    func testCustomBinding() {
        bindableObject?.rx.bind(dynamicObject)
        .subscribe(event: { event in
            switch event {
            case .complete:
                XCTAssertNotNil(self.bindableObject?.text)
            default: break
            }
        })
        
        dynamicObject?.value = "Ok"
    }
    
    func testBindingTwoDynamicObjects() {
        dynamicObject2?
            .bind(dynamicObject)
            .subscribe(next: { value in
            XCTAssertNotNil(value)
        })
        dynamicObject?.value = "Ok"
    }


}
