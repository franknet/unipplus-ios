//
//  HomeViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
    var pagerView: BaseUIPageView!
    var pageViews: [UIViewController]!
    
    override func viewDidLoad() {
        setup()
    }
    
    private func setup() {
        addContentsPager()
        setMenuButton()
    }
    
    private func addContentsPager() {
        pagerView = BaseUIPageView()
        pagerView.pageDelegate = self
        pagerView.setViews(pageViews)
        addViewController(pagerView, toView: self.view)
    }
    
    func setMenuButton() {
        
    }
    
}

extension HomeViewController: BaseUIPageViewDelegate {
    // MARK: BaseUIPageViewDelegate
    func didFinishTransitionTo(viewController: UIViewController) {
        title = viewController.title
    }
    
}

extension HomeViewController: MenuViewControllerDelegate {
    func logout() {
        
    }
    
    func share() {
        
    }
    
}
