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
import RxSwiftExt

class AuthenticationViewModel {
    typealias ResulEvent = Observable<Event<AuthenticationResponse>>
    private var service: ApiService
    
    init() {
        service = ApiService()
        setupRx()
    }
    
    init(service: ApiService) {
        self.service = service
        setupRx()
    }
    
    //MARK:  Inputs
    let ra = BehaviorRelay<String>(value: "")
    let password = BehaviorRelay<String>(value: "")
    
    //MARK: Outputs
    var model: Observable<AuthenticationResponse>!
    var isLoading: Observable<Bool>!
    var errorMessage: Observable<String>!
    var isSubmitEnabled: Observable<Bool>!
    
    //MARK: Actions
    let submit = PublishRelay<Void>()
    
    //MARK: Events
    private var resultEvent: ResulEvent!
    
    //MARK: Setup
    private func setupRx() {
        let raAndPassowrd = Observable.combineLatest(ra, password)
        
        resultEvent = submit.withLatestFrom(raAndPassowrd)
        .flatMap { (raValue, passwordValue) -> ResulEvent in
            let credentials = Credentials(ra: raValue, password: passwordValue)
            return self.service.fetch(provider: AuthenticationProvider.authenticate(credentials)).materialize()
        }
        
        model = resultEvent.elements()
        
        errorMessage = resultEvent.errors()
        .map({ $0.localizedDescription })
        
        isLoading = resultEvent.isLoading()
        
        isSubmitEnabled = Observable.merge(
            raAndPassowrd.map({ $0.count > 0 && $1.count > 0 })
        )
    }
}
