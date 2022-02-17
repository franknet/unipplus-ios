//
//  Coordinator.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 01/02/22.
//

import UIKit

protocol Coordinator {
    
    var navigator: UINavigationController { get }
    
    var children: [Coordinator] { get }
    
    func setUp()
    
    func finish()
    
}
