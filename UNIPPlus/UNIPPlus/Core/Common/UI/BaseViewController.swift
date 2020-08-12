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
    
}

extension Reactive where Base: BaseViewController {
    
    var alertMassage: Binder<String> {
        return Binder(base) { vc, message in
            let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
            vc.show(alert, sender: nil)
        }
    }
    
}
