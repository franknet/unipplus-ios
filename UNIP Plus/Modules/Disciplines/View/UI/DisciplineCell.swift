//
//  GradeTableViewCell.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 23/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class DisciplineCell: UITableViewCell {
    @IBOutlet weak var np1Value: UILabel!
    @IBOutlet weak var np2Value: UILabel!
    @IBOutlet weak var msValue: UILabel!
    @IBOutlet weak var exValue: UILabel!
    @IBOutlet weak var mfValue: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        

        // Configure the view for the selected state
    }
    
}
