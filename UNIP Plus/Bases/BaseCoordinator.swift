//
//  BaseCoordinator.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

protocol BaseCoordinator {
    var navigation: UINavigationController { get set }
    func start()
}

extension BaseCoordinator {
    func showAlertWithMessage(_ message: String?) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        navigation.present(alert, animated: true, completion: nil)
    }
}
