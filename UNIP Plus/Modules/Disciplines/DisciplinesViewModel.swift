//
//  GradesViewModel.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

protocol DisciplinesViewModelDelegate {
    func error(message: String)
    func fetchGradesFinished()
}

class DisciplinesViewModel: BaseViewModel {
    var delegate: DisciplinesViewModelDelegate?
    var gradesInfo: Disciplines?
    
    func viewDidLoad() {
//        fetchGrades()
    }
    
    private func fetchGrades() {
        
    }
    
}
