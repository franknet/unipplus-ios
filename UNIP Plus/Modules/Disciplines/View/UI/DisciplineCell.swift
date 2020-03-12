//
//  GradeTableViewCell.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 23/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class DisciplineCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var np1Label: UILabel!
    @IBOutlet weak var np2Label: UILabel!
    @IBOutlet weak var msLabel: UILabel!
    @IBOutlet weak var exLabel: UILabel!
    @IBOutlet weak var mfLabel: UILabel!
    @IBOutlet weak var absenseLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) { }
    
    func setDiscipline(_ discipline: Discipline?) {
        guard
            let discipline = discipline
        else { return }
        nameLabel.text = discipline.name
        np1Label.text = "\(discipline.np1 ?? 0.0)"
        np2Label.text = "\(discipline.np2 ?? 0.0)"
        msLabel.text = "\(discipline.ms ?? 0.0)"
        exLabel.text = "\(discipline.ex ?? 0.0)"
        mfLabel.text = "\(discipline.mf ?? 0.0)"
        absenseLabel.text = discipline.absense
        guard
            let status = discipline.status,
            let _ = status.code,
            let messages = status.messages
        else { return }
        statusLabel.text = messages.joined(separator: "\n")
    }
}
