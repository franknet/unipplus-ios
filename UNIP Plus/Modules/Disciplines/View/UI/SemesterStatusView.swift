//
//  SemesterStatusView.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 13/11/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class SemesterStatusView: UITableViewHeaderFooterView {
    @IBOutlet weak var avg: UILabel!
    @IBOutlet weak var message: UILabel!
    
    func setStatus(_ status: DisciplinesStatus?) {
        guard let status = status else { return }
        avg.text = "\(status.avg ?? 0)"
        message.text = status.message
    }
}
 
