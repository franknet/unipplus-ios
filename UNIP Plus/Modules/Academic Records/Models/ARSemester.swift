//
//  ARSemester.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

struct ARSemesterStatus: CodableObject {
    let avg: Double?
    let message: String?
    let code: Int?
}

struct ARSemester: CodableObject {
    let status: ARSemesterStatus?
    let semester: String?
    let disciplines: [ARDiscipline]?
}
