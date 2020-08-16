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
        
        viewModel.errorMessage.subscribe(onNext: { _ in
            XCTAssert(false)
            expect.fulfill()
        }).disposed(by: dispose)
        
        viewModel.model.subscribe(onNext: { _ in
            XCTAssert(true)
            expect.fulfill()
        }).disposed(by: dispose)
        
        viewModel.isLoading.subscribe(onNext: { loading in
            XCTAssert(loading)
        }).disposed(by: dispose)

        viewModel.submit.accept(())
        
        wait(for: [expect], timeout: 60)
        
        viewModel.isLoading.subscribe(onNext: { loading in
            XCTAssertFalse(loading)
        }).disposed(by: dispose)
    }
    
    func testSubmitButtonEnabled() {
        viewModel.ra.accept("123123")
        viewModel.password.accept("adasaf")
        
        viewModel.isSubmitEnabled.subscribe(onNext: { enabled in
            XCTAssert(enabled)
        }).disposed(by: dispose)
    }
    
    func testSubmitButtonDisenabled() {
        viewModel.ra.accept("")
        viewModel.password.accept("")
        
        viewModel.isSubmitEnabled.subscribe(onNext: { enabled in
            XCTAssertFalse(enabled)
        }).disposed(by: dispose)
    }

    func testAuthenticationWithFailure() {
        let expect = XCTestExpectation(description: "Return authentication with failure")
        
        let credentials = Credentials(ra: "", password: "")
        let provider = AuthenticationProvider.authenticate(credentials)
        service.mockProvider(provider, responseFile: "default-error-response", statusCode: 500)
        
        viewModel.errorMessage.subscribe(onNext: { message in
            XCTAssertEqual(message, "Something wrong is not right")
            expect.fulfill()
        }).disposed(by: dispose)
        
        viewModel.model.subscribe(onNext: { _ in
            XCTAssert(false)
            expect.fulfill()
        }).disposed(by: dispose)
        
        viewModel.submit.accept(())
        
        wait(for: [expect], timeout: 60)
    }
}
