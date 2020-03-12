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
    
    func showScrollIndicatiors(_ show: Bool) {
        self.showsVerticalScrollIndicator = show
        self.showsHorizontalScrollIndicator = show
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type, completion: @escaping (_ cell: T) -> Void) -> UITableViewCell {
        let identifier = String(describing: type)
        guard let cell = dequeueReusableCell(withIdentifier: identifier) as? T else { return UITableViewCell() }
        completion(cell)
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T>(_ type: T.Type, completion: @escaping (_ view: T) -> Void) -> T? {
        let identifier = String(describing: type)
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else { return nil }
        completion(view)
        return view
    }
    
}
