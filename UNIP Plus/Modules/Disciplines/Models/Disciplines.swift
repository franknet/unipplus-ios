//
//  Disciplines.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

struct DisciplinesStatus: CodableObject {
    let avg: Double?
    let message: String?
    let code: Int?
}

struct Disciplines: CodableObject {
    let status: DisciplinesStatus?
    let disciplines: [Discipline]?
}
