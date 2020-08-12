//
//  AuthenticationTests.swift
//  UNIPPlusTests
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import XCTest
import RxSwift

@testable import UNIP_Plus

class AuthenticationTests: XCTestCase {
    private var service: ApiService!
    private var viewModel: AuthenticationViewModel!
    private var dispose: DisposeBag!

    override func setUp() {
        super.setUp()
        dispose = DisposeBag()
        service = ApiService.mock()
        viewModel = AuthenticationViewModel(service: service)
    }

    override func tearDown() {
        super.tearDown()
        dispose = nil
        service = nil
        viewModel = nil
    }

    func testAuthenticationWithSuccess() {
        let expect = XCTestExpectation(description: "Return authentication with success")
        
        let credentials = Credentials(ra: "", password: "")
        let provider = AuthenticationProvider.authenticate(credentials)
        service.mockProvider(provider, responseFile: "authentication-response", statusCode: 200)
        
        viewModel.result.subscribe(onNext: { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure(let error):
                print("Error: " + error.localizedDescription)
                XCTAssert(false)
            }
            expect.fulfill()
        }, onError: { error in
            print("Error: " + error.localizedDescription)
            XCTAssert(false)
            expect.fulfill()
        }).disposed(by: dispose)
        
        viewModel.submit.accept(())

        wait(for: [expect], timeout: 60)
    }

    func testAuthenticationWithFailure() {
        let expect = XCTestExpectation(description: "Return authentication with failure")
        
        let credentials = Credentials(ra: "", password: "")
        let provider = AuthenticationProvider.authenticate(credentials)
        service.mockProvider(provider, responseFile: "authentication-response", statusCode: 500)
        
        viewModel.result.subscribe(onNext: { response in
            switch response {
            case .success:
                XCTAssert(false)
            case .failure:
                XCTAssert(true)
            }
            expect.fulfill()
        }, onError: { error in
            XCTAssert(true)
            expect.fulfill()
        }).disposed(by: dispose)
        
        viewModel.submit.accept(())
        
        wait(for: [expect], timeout: 60)
    }

}
