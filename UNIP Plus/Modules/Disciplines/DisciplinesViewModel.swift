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
        APIService().requestModule(.Disciplines).get()
        .execute(onSuccess: { (data) in
            self.gradesInfo = JSONHelper.Deserialize(type: Disciplines.self, jsonData: data!)
            self.delegate?.fetchGradesFinished()
        }) { (error) in
            self.delegate?.error(message: error)
        }
    }
    
}
