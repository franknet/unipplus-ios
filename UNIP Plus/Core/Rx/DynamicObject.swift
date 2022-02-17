//
//  DynamicObject.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 05/02/22.
//

import Foundation

enum DynamicObjectEvent<T> {
    case next(T)
    case error(Error)
    case complete
}

class DynamicObject<T> {
    
    typealias NextHandler = ((T?) -> Void)
    typealias ErrorHandler = ((Error) -> Void)
    typealias CompletionHandler = (() -> Void)
    typealias EventHandler = ((DynamicObjectEvent<T>) -> Void)
    
    private var nextHandler: NextHandler?
    private var errorHandler: ErrorHandler?
    private var completionHandler: CompletionHandler?
    private var eventHandler: EventHandler?
    private var didComplete = false
    private var queue: DispatchQueue = .main
    
    var value: T? {
        didSet {
            queue.async {
                guard !self.didComplete else {
                    self.didComplete = false
                    return
                }
                self.nextHandler?(self.value)
                if let value = self.value {
                    self.eventHandler?(.next(value))
                }
                self.eventHandler?(.complete)
                self.completionHandler?()
            }
        }
    }
    
    var error: Error? {
        didSet {
            queue.async {
                guard let error = self.error, !self.didComplete else {
                    self.didComplete = false
                    return
                }
                self.errorHandler?(error)
                self.eventHandler?(.error(error))
                self.eventHandler?(.complete)
                self.completionHandler?()
            }
        }
    }
    
    var event: DynamicObjectEvent<T>? {
        didSet {
            queue.async {
                guard let event = self.event, !self.didComplete else {
                    self.didComplete = false
                    return
                }
                switch event {
                case .next(let value):
                    self.value = value
                case .error(let error):
                    self.error = error
                case .complete:
                    self.didComplete = true
                    self.completionHandler?()
                }
            }
        }
    }
    
    init() {}
    
    init(value: T?) {
        self.value = value
    }
    
    func subscribe(next: @escaping NextHandler, queue: DispatchQueue) {
        self.subscribe(next: next, error: nil, completion: nil, queue: queue)
    }
    
    func subscribe(next: @escaping NextHandler, error: @escaping ErrorHandler, queue: DispatchQueue = .main) {
        self.subscribe(next: next, error: error, completion: nil, queue: queue)
    }
    
    func subscribe(next: @escaping NextHandler, completion: @escaping CompletionHandler, queue: DispatchQueue = .main) {
        self.subscribe(next: next, error: nil, completion: completion, queue: queue)
    }
    
    func subscribe(next: @escaping NextHandler, error: ErrorHandler? = nil, completion: CompletionHandler? = nil, queue: DispatchQueue = .main) {
        self.nextHandler = next
        self.errorHandler = error
        self.completionHandler = completion
        self.queue = queue 
    }
    
    func subscribe(event: EventHandler?, queue: DispatchQueue = .main) {
        self.eventHandler = event
        self.queue = queue
    }
    
    func bind(_ dynamicObject: DynamicObject<T>?) -> Self {
        self.event = dynamicObject?.event
        return self
    }
    
}
