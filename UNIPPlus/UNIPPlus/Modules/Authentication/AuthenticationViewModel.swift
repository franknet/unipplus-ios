//
//  AuthenticationViewModel.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class AuthenticationViewModel {
    let disposer = DisposeBag()
    var service: ApiService
    
    //MARK:  Inputs
    let ra = BehaviorRelay<String>(value: "")
    let password = BehaviorRelay<String>(value: "")
    
    //MARK: Outputs
    var result: Observable<Result<AuthenticationResponse, Error>>!
    var isLoading: Observable<Bool>!
    var isSubmitEnabled: Observable<Bool>!
    
    //MARK: Actions
    let submit = PublishRelay<Void>()
    
    //MARK: Setup
    init() {
        service = ApiService()
        setupRx()
    }
    
    init(service: ApiService) {
        self.service = service
        setupRx()
    }
    
    private func setupRx() {
        let raAndPassowrd = Observable.combineLatest(ra, password)
        
        result = submit.withLatestFrom(raAndPassowrd)
        .flatMap { (raValue, passwordValue) -> Observable<Result<AuthenticationResponse, Error>> in
            let credentials = Credentials(ra: raValue, password: passwordValue)
            return self.service.fetch(provider: AuthenticationProvider.authenticate(credentials))
        }
        
        isLoading = Observable.merge(
            submit.map({ true }),
            result.map({ _ in false })
        )
        
        isSubmitEnabled = Observable.merge(
            raAndPassowrd.map({ !$0.isEmpty && !$1.isEmpty }),
            isLoading.map(!)
        )
    }
}
