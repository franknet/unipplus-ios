//
//  BaseViewController.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

extension Reactive where Base: BaseViewController {
    
    var alertMassage: Binder<String> {
        return Binder(base) { vc, message in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
                vc.show(alert, sender: nil)
            }
        }
    }
    
    var animateShowKeyboard: Binder<Keyboard> {
        return Binder(base) { viewController, keyboard in
            let keyboardSize = keyboard.frameEnd.size
            let size = viewController.view.frame.size
            let origin = viewController.view.frame.origin
            let endOrigin = CGPoint(x: origin.x, y: keyboard.didShow ? origin.y - keyboardSize.height : origin.y + keyboardSize.height)
            
            UIView.animate(withDuration: keyboard.animationDuration) {
                viewController.view.frame = .init(origin: endOrigin, size: size)
                viewController.view.layoutIfNeeded()
            }
        }
    }
    
}
