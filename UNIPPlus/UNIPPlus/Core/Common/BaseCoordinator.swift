//
//  BaseCoordinator.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import UIKit

protocol BaseCoordinator {
    var navigator: UINavigationController? { get set }
    var children: [BaseCoordinator] { get set }
    func start()
    func end()
}
