//
//  UIViewExtention.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addViewController(_ viewController: UIViewController, toView view: UIView) {
        viewController.willMove(toParent: self)
        viewController.view.frame = view.frame
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
}
