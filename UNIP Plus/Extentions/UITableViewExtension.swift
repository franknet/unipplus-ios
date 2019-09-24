//
//  UITableViewExtention.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 23/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCell(_ cell: AnyClass) {
        let nib = UINib(nibName: String(describing: cell), bundle: nil)
        register(nib, forCellReuseIdentifier: String(describing: cell))
    }
    
    func registerHeaderFooter(_ headerFooter: AnyClass) {
        let nib = UINib(nibName: String(describing: headerFooter), bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: String(describing: headerFooter))
    }
}
