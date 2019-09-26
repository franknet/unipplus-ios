//
//  BaseUITableView.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 26/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

protocol BaseUITableViewDelegate {
    func numberOfSections() -> Int
    func viewForHeaderInSection(_ section: Int) -> UIView?
    func numberOfRowsInSection(_ section: Int) -> Int
    func cellForRowAt(_ indexPath: IndexPath) -> UITableViewCell
    func didSelectCellAt(_ indexPath: IndexPath)
}

class BaseUITableView: UITableView {
    var tableDelegate: BaseUITableViewDelegate?

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.delegate = self
        self.dataSource = self
        showScrollIndicatiors(false)
    }
    
    func showScrollIndicatiors(_ show: Bool) {
        self.showsVerticalScrollIndicator = show
        self.showsHorizontalScrollIndicator = show
    }

}

extension BaseUITableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableDelegate?.didSelectCellAt(indexPath)
    }
}

extension BaseUITableView: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableDelegate?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDelegate?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableDelegate?.viewForHeaderInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return (tableDelegate?.cellForRowAt(indexPath))!
    }
}
