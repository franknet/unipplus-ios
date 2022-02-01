//
//  APIProviderTests.swift
//  UNIP PlusTests
//
//  Created by José Franklin Silva Alves on 31/01/22.
//

import XCTest
@testable import UNIP_Plus

class APIProviderTests: XCTestCase {
    
    private var authenticationAPIProvider: AuthenticationAPIProvider?
    private var disciplinesAPIProvider: DisciplinesAPIProvider?
    private var financePaymentsAPIProvider: FinanceAPIProvider?
    private var academicRecordsAPIProvider: AcademicRecordsAPIProvider?

    override func setUpWithError() throws {
        
        authenticationAPIProvider = AuthenticationAPIProvider(credentials: .init(id: "f11bhb1", password: "0107"))
        disciplinesAPIProvider = DisciplinesAPIProvider()
        financePaymentsAPIProvider = FinanceAPIProvider.payments
        academicRecordsAPIProvider = AcademicRecordsAPIProvider()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        authenticationAPIProvider = nil
        disciplinesAPIProvider = nil
        financePaymentsAPIProvider = nil
        academicRecordsAPIProvider = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchAllMainAPIServices() throws {
        
        let expectation = XCTestExpectation(description: "Expect to fetch all main api services with success!")
        
        let financePaymentsCompletionHandler: ((Result<Documents, RestError>) -> Void) = { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure(let error):
                XCTAssert(false)
                print(error.localizedDescription)
            }
            expectation.fulfill()
        }
        
        let academicRecordsCompletionHandler: ((Result<[ARSemester], RestError>) -> Void) = { result in
            switch result {
            case .success:
                self.financePaymentsAPIProvider?.fetch(modelType: Documents.self, financePaymentsCompletionHandler)
            case .failure(let error):
                XCTAssert(false)
                print(error.localizedDescription)
                expectation.fulfill()
            }
            
        }
        
        let disciplinesCompletionHandler: ((Result<Disciplines, RestError>) -> Void) = { result in
            switch result {
            case .success:
                self.academicRecordsAPIProvider?.fetch(modelType: [ARSemester].self, academicRecordsCompletionHandler)
            case .failure(let error):
                XCTAssert(false)
                print(error.localizedDescription)
                expectation.fulfill()
            }
            
        }
        
        let authenticationCompletionHandler: ((Result<Session, RestError>) -> Void) = { result in
            switch result {
            case .success:
                self.disciplinesAPIProvider?.fetch(modelType: Disciplines.self, disciplinesCompletionHandler)
            case .failure(let error):
                XCTAssert(false)
                print(error.localizedDescription)
                expectation.fulfill()
            }
            
        }
        
        authenticationAPIProvider?.fetch(modelType: Session.self, authenticationCompletionHandler)
        
        wait(for: [expectation], timeout: 30)
    }

}
