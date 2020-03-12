//
//  GradesViewModel.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

protocol DisciplinesViewCoordinatorDelegate: AnyObject {
    func disciplinets(_ viewModel: DisciplinesViewModel, didFinishWithResult: Disciplines)
    func disciplinets(_ viewModel: DisciplinesViewModel, didFinishWithError: String)
}

protocol DisciplinesViewModelDelegate: AnyObject {
    func reloadTable()
}

class DisciplinesViewModel: BaseViewModel {
    weak var delegate: DisciplinesViewModelDelegate!
    weak var coordinator: DisciplinesViewCoordinatorDelegate!
    var result: Disciplines!
    
    var groupsCount: Int {
        guard
            let result = self.result,
            let disciplines = result.disciplines
        else { return 0 }
        return disciplines.count + 1
    }
    
    func disciplinesGroupAt(_ section: Int) -> DisciplinesGroup? {
        guard
            let result = self.result,
            let disciplines = result.disciplines
        else { return nil }
        return disciplines[section - 1]
    }
    
    func disciplinesCountAt(_ section: Int) -> Int {
        guard
            section > 0,
            let result = self.result,
            let groups = result.disciplines,
            let disciplines = groups[section - 1].disciplines
        else { return 0 }
        return disciplines.count
    }
    
    var disciplinesStatus: DisciplinesStatus? {
        guard
            let result = self.result
        else { return nil }
        return result.status
    }
    
    func disciplineAt(_ indexPath: IndexPath) -> Discipline? {
        guard
            let result = self.result,
            let groups = result.disciplines,
            let disciplines = groups[indexPath.section - 1].disciplines
        else { return nil }
        return disciplines[indexPath.row]
    }
    
    func fetchDisciplines() {
        UnipPlusApiClient().fetchResource(.disciplines)
        .execute(for: Disciplines.self) { [weak self] (result, error) in
            guard let self = self else { return }
            if let error = error {
                print(error)
            } else {
                self.result = result
                self.delegate.reloadTable()
            }
        }
    }
}
