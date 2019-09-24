//
//  PagerCoordinator.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 24/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class PagerCoordinator: BaseCoordinator {
    var navigation: UINavigationController
    var homeCoordinator: HomeCoordinator?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let gradesVC = GradesViewController()
        gradesVC.coordinator = self
        gradesVC.viewModel = GradesViewModel()
        
        let paymentsVC = PaymentsViewController()
        paymentsVC.coordinator = self
        paymentsVC.viewModel = PaymentsViewModel()
        
        let academicRecordsVC = AcademicRecordsViewController()
        academicRecordsVC.coordinator = self
        academicRecordsVC.viewModel = AcademicRecordsViewModel()
        
        let pagerVC = PagerViewController()
        pagerVC.coordinator = self
        pagerVC.viewModel = PagerViewModel(viewControllers: [gradesVC, paymentsVC, academicRecordsVC])
        
        navigation.pushViewController(pagerVC, animated: true)
    }
    
    
}
