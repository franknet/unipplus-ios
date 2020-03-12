//
//  HomeCoordinator.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class HomeCoordinator: BaseCoordinator {
    var navigation: UINavigationController
    
    var homeVM: HomeViewModel!
    var homeVC: HomeViewController!
    
    var disciplinesVM: DisciplinesViewModel!
    var disciplinesVC: DisciplinesViewController!
    
    var paymentsVM: PaymentsViewModel!
    var paymentsVC: PaymentsViewController!
    
    var academicRecordsVM: AcademicRecordsViewModel!
    var academicRecordsVC: AcademicRecordsViewController!
    
    init(navigationController: UINavigationController) {
        navigation = navigationController
    }
    
    func start() {
        disciplinesVM = DisciplinesViewModel()
        disciplinesVC = DisciplinesViewController(viewModel: disciplinesVM)
        
        paymentsVM = PaymentsViewModel()
        paymentsVC = PaymentsViewController(viewModel: paymentsVM)
        
        academicRecordsVM = AcademicRecordsViewModel()
        academicRecordsVC = AcademicRecordsViewController(viewModel: academicRecordsVM)
        
        homeVM = HomeViewModel(coordinator: self)
        homeVC = HomeViewController(viewModel: homeVM)
        homeVC.pageViews = [disciplinesVC, paymentsVC, academicRecordsVC]
        
        navigation.interactivePopGestureRecognizer?.isEnabled = false
        navigation.modalPresentationStyle = .overFullScreen
        navigation.modalTransitionStyle = .coverVertical
        navigation.pushViewController(homeVC, animated: false)
    }
}

extension HomeCoordinator: HomeViewModelCoordinatorDelegate {
    func home(_ viewModel: HomeViewModel, openMenuWithCompletion completion: (() -> Void)?) {
        let menuVC = MenuViewController()
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.modalTransitionStyle = .crossDissolve
        navigation.present(menuVC, animated: true, completion: completion)
    }
    
}
