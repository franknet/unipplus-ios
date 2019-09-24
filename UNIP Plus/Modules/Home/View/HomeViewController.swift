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
    var menu: MenuViewController?
    
    override func viewDidLoad() {
        setup()
    }
    
    private func setup() {
        addContentsPager()
    }
    
    private func addContentsPager() {
        addViewController(pager!, toView: self.view)
    }
    
    private func setMenuViewController() {
        
        
    }
    
}
