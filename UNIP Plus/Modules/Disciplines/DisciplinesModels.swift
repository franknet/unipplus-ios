//
//  Disciplines.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 09/03/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

class Disciplines: BaseModel {
    var status: DisciplinesStatus?
    var disciplines: [DisciplinesGroup]?
}

class DisciplinesStatus: BaseModel {
    var avg: Double?
    var code: Int?
    var message: String?
}

class DisciplinesGroup: BaseModel {
    var type: String?
    var disciplines: [Discipline]?
}

class Discipline: BaseModel {
    var absencePercent: String?
    var absense: String?
    var avg: Double?
    var code: String?
    var ex: Double?
    var mf: Double?
    var ms: Double?
    var name: String?
    var np1: Double?
    var np2: Double?
    var obs: String?
    var released: Bool?
    var specialClass: String?
    var status: DisciplineStatus?
}

class DisciplineStatus: BaseModel {
    var code: Int?
    var messages: [String]?
}

