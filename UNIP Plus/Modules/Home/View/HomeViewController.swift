//
//  HomeViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomeCoordinator, HomeViewModel> {
    var pager: UINavigationController?
    
    override func viewDidLoad() {
        setup()
    }
    
    private func setup() {
        addContentsPager()
    }
    
    private func addContentsPager() {
        addViewController(pager!, toView: self.view)
    }
    
    func addRightMenuButton() {
        
    }
    
    @objc private func menuAction() {
        
    }
    
}
