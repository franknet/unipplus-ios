//
//  GradesViewModel.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

protocol GradesViewModelDelegate {
    func error(message: String)
    func fetchGradesFinished()
}

class GradesViewModel: BaseViewModel {
    var delegate: GradesViewModelDelegate?
    var gradesInfo: GradesInfo?
    
    func viewDidLoad() {
        fetchGrades()
    }
    
    private func fetchGrades() {
        APIService().requestModule(.Grades).get()
        .execute(onSuccess: { (data) in
            self.gradesInfo = JSONHelper.Deserialize(type: GradesInfo.self, jsonData: data)
            self.delegate?.fetchGradesFinished()
        }) { (error) in
            self.delegate?.error(message: error)
        }
    }
    
}
