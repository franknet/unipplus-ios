//
//  RxExtension.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 15/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//
import RxSwift
import Foundation

extension ObservableType where Element: EventConvertible  {
    
    func isLoading() -> Observable<Bool> {
        return Observable.create { observer -> Disposable in
            _ = self.do(onNext: { event in
                switch event.event {
                case .completed:
                    observer.onNext(false)
                default:
                    observer.onNext(true)
                }
            })
            return Disposables.create()
        }
    }
}


