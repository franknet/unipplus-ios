//
//  BaseViewModel.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import Foundation

@objc protocol BaseViewModel: AnyObject {
    @objc optional func viewDidLoad()
    @objc optional func viewWillAppear()
    @objc optional func viewWillDisappear()
}
