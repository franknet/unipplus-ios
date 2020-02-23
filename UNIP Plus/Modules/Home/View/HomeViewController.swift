//
//  HomeViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomeCoordinator, HomeViewModel> {
    
    override func viewDidLoad() {
        setup()
    }
    
    private func setup() {
        addContentsPager()
        setMenuButton()
    }
    
    private func addContentsPager() {
        let gradesVC = DisciplinesViewController()
        gradesVC.coordinator = self.coordinator
        gradesVC.viewModel = DisciplinesViewModel()
        
        let paymentsVC = PaymentsViewController()
        paymentsVC.coordinator = self.coordinator
        paymentsVC.viewModel = PaymentsViewModel()
        
        let academicRecordsVC = AcademicRecordsViewController()
        academicRecordsVC.coordinator = self.coordinator
        academicRecordsVC.viewModel = AcademicRecordsViewModel()
        
        let pagerView = BaseUIPageView()
        pagerView.pageDelegate = self
        pagerView.setViews([gradesVC, paymentsVC, academicRecordsVC])
        
        addViewController(pagerView, toView: self.view)
    }
    
    func setMenuButton() {
        let menuBtn = UIBarButtonItem(barButtonSystemItem: .action, target: coordinator, action: #selector(coordinator?.showMenu))
        navigationItem.rightBarButtonItem = menuBtn
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
        coordinator?.logout()
    }
    
    func share() {
        coordinator?.share()
    }
    
}
