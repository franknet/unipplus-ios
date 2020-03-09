//
//  AcademicRecordsViewModel.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

protocol AcademicRecordsViewModelDelegate {
    func error(message: String)
    func fetchAcademicRecordsFinished()
}

class AcademicRecordsViewModel: BaseViewModel {
    var delegate: AcademicRecordsViewModelDelegate?
    
    func viewDidLoad() {
        
    }
    
    func fetchAcademicRecords() {
        
    }
    
}
