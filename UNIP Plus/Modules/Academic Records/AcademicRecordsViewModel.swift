//
//  AcademicRecordsViewModel.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 01/02/22.
//

import Foundation

protocol AcademicRecordsViewModelDelegate: AnyObject {
    
}

class AcademicRecordsViewModel {
    
    weak var delegate: AcademicRecordsViewModelDelegate?
    var error = DynamicObject<RestError>()
    var academicRecords = DynamicObject<[ARSemester]>()
    
    func loadData() {
        let completionHandler: ((Result<[ARSemester], RestError>) -> Void) = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let academicRecords):
                self.academicRecords.value = academicRecords
            case .failure(let error):
                self.error.value = error
            }
        }
        AcademicRecordsAPIProvider().fetch(modelType: [ARSemester].self, completionHandler)
    }
    
}
