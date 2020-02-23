//
//  Grade.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 26/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import Foundation

class Grade: Codable {
    var code: String!
    var name: String!
    var special_class: String!
    var obs: String!
    var absence_percent: String!
    var np1: String!
    var np2: String!
    var absence: String!
    var ms: String!
    var ex: String!
    var mf: String!
    var status: GradeStatus!
}
