//
//  HomeViewModel.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

protocol HomeViewModelCoordinatorDelegate {
    func home(_ viewModel: HomeViewModel, openMenuWithCompletion completion: (() -> Void)?)
}

class HomeViewModel: BaseViewModel {
    var coordinator: HomeViewModelCoordinatorDelegate
    
    init(coordinator: HomeViewModelCoordinatorDelegate) {
        self.coordinator = coordinator
    }
}
