//
//  BaseUITableView.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 26/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class BaseUITableView: UITableView {
    fileprivate var numberOfSectionsCall: (() -> Int)?
    fileprivate var viewForHeaderInSectionCall: ((_ table: BaseUITableView, _ section: Int) -> UIView?)?
    fileprivate var numberOfRowsInSectionCall: ((_ section: Int) -> Int)?
    fileprivate var cellForRowAtCall: ((_ table: BaseUITableView, _ indexPath: IndexPath) -> UITableViewCell)?
    fileprivate var didSelectCellAtCall: ((_ indexPath: IndexPath) -> Void)?

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

extension BaseUITableView {
    func numberOfSections(call: @escaping () -> Int) {
        numberOfSectionsCall = call
    }
    
    func numberOfRowsInSection(call: @escaping (_ section: Int) -> Int) {
        numberOfRowsInSectionCall = call
    }
    
    func viewForHeaderInSection(call: @escaping (_ table: BaseUITableView, _ section: Int) -> UIView?) {
        viewForHeaderInSectionCall = call
    }
    
    func cellForRowAt(call: @escaping (_ table: BaseUITableView, _ index: IndexPath) -> UITableViewCell) {
        cellForRowAtCall = call
    }
    
    func didSelectCellAt(call: @escaping (_ indexPath: IndexPath) -> Void) {
        didSelectCellAtCall = call
    }
}

extension BaseUITableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let call = didSelectCellAtCall else { return }
        call(indexPath)
    }
}

extension BaseUITableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let call = numberOfSectionsCall else { return 0 }
        return call()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let call = numberOfRowsInSectionCall else { return 0 }
        return call(section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let call = viewForHeaderInSectionCall else { return nil }
        return call(self, section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let call = cellForRowAtCall else { return UITableViewCell(style: .default, reuseIdentifier: "cell") }
        return call(self, indexPath)
    }
}
