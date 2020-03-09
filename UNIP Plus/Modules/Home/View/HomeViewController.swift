//
//  HomeViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
    
    override func viewDidLoad() {
        setup()
    }
    
    private func setup() {
        addContentsPager()
        setMenuButton()
    }
    
    private func addContentsPager() {
        let gradesVM = DisciplinesViewModel()
        let gradesVC = DisciplinesViewController(viewModel: gradesVM)
        let paymentsVC = PaymentsViewController(viewModel: PaymentsViewModel())
        let academicRecordsVC = AcademicRecordsViewController(viewModel: AcademicRecordsViewModel())
        
        let pagerView = BaseUIPageView()
        pagerView.pageDelegate = self
        
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
