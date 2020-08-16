//
//  KeyboardManager.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 16/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay

struct Keyboard {
    let didShow: Bool
    let frameBegin: CGRect
    let frameEnd: CGRect
    let animationDuration: Double
    let animationCurve: Double
}

class KeyboardManager {
    private let keyboardWillShow = UIWindow.keyboardWillShowNotification
    private let keyboardWillHide = UIWindow.keyboardWillHideNotification
    private let keyboardEvent = PublishRelay<Keyboard>()
    private var isKeyboardShowing = false
    
    var keyboard: Observable<Keyboard>!
    
    private func enableNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: keyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: keyboardWillHide, object: nil)
    }
    
    @objc private func keyboardDidShow(_ notification: NSNotification) {
        if isKeyboardShowing { return }
        isKeyboardShowing = true
        keyboardAction(notification)
    }
    
    @objc private func keyboardDidHide(_ notification: NSNotification) {
        if !isKeyboardShowing { return }
        isKeyboardShowing = false
        keyboardAction(notification)
    
    }
    
    private func keyboardAction(_ notification: NSNotification) {
        guard let info = notification.userInfo else { return }
        keyboardEvent.accept(Keyboard(
            didShow: isKeyboardShowing,
            frameBegin: (info[UIWindow.keyboardFrameBeginUserInfoKey] as? CGRect) ?? .zero,
            frameEnd: (info[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect) ?? .zero,
            animationDuration: (info[UIWindow.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0.0,
            animationCurve: (info[UIWindow.keyboardAnimationCurveUserInfoKey] as? Double) ?? 0.0
        ))
    }
    
    func start() {
        enableNotification()
        keyboard = keyboardEvent.asObservable()
    }
    
    func stop() {
        NotificationCenter.default.removeObserver(self)
    }
}


