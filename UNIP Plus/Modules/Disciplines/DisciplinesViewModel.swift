//
//  DisciplinesViewModel.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 01/02/22.
//

import Foundation

protocol DisciplinesViewModelDelegate: AnyObject {
    
}

class DisciplinesViewModel {
    
    weak var delegate: DisciplinesViewModelDelegate?
    var disciplines = DynamicObject<Disciplines>()
    var error = DynamicObject<RestError>()
    
    func loadData() {
        let completionHandler: ((Result<Disciplines, RestError>) -> Void) = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let disciplines):
                self.disciplines.value = disciplines
            case .failure(let error):
                self.error.value = error
            }
        }
        DisciplinesAPIProvider().fetch(modelType: Disciplines.self, completionHandler)
    }
    
}
