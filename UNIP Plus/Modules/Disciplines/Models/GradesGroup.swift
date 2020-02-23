//
//  GradesGroup.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 26/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import Foundation

class GradesGroup: Codable {
    var grade_released: Bool = false
    var exploitation: Int = 0
    var name: String
    var grades: [Grade] = []
}
