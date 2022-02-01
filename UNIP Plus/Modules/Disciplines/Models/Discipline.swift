//
//  Discipline.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

struct DisciplineStatus: CodableObject {
    let messages: [String]?
    let code: Int?
}

struct Discipline: CodableObject {
    let cod: String?
    let dicipline: String?
    let special: String?
    let type: String?
    let obs: String?
    let np1: Double?
    let np2: Double?
    let mf: Double?
    let obsences: String?
    let ms: Double?
    let ex: Double?
    let released: Bool?
    let avg: Double?
    let status: DisciplineStatus?
}
