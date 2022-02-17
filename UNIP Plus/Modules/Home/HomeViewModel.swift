//
//  HomeViewModel.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 02/02/22.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    
}

class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
}
