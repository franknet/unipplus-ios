//
//  BaseAdapter.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 07/03/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import UIKit

protocol AdapterDelegate {
    func didSelectRowAt(_ indexPath: IndexPath)
}

protocol BaseAdapter: UITableViewDelegate, UITableViewDataSource {
    var delegate: AdapterDelegate? { get set }
    func cellForRowAt(_ indexPath: IndexPath) -> UITableViewCell
    func viewForHeaderInSection(_ section: Int) -> UIView?
}

extension BaseAdapter {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return viewForHeaderInSection(section)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForRowAt(indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = delegate else { return}
        delegate.didSelectRowAt(indexPath)
    }
}
