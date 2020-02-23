//
//  GradesInfo.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 26/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import Foundation

class Disciplines: Codable {
    var avg: Int?
    var message: Message!
    var groups: [GradesGroup] = []
}
