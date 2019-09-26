//
//  AcademicRecordsViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class AcademicRecordsViewController: BaseViewController<HomeCoordinator, AcademicRecordsViewModel> {
    @IBOutlet weak var table: BaseUITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }
    
    func setUp() {
        title = "Histórico"
        viewModel?.delegate = self
        
    }


}

extension AcademicRecordsViewController: AcademicRecordsViewModelDelegate {
    func error(message: String) {
        coordinator?.showAlertWithMessage(message)
    }
    
    func fetchAcademicRecordsFinished() {
        table?.reloadData()
    }
    
    
}
