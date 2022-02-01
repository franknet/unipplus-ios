//
//  ARDiscipline.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

struct ARDiscipline: CodableObject {
    let semester: String?
    let code: String?
    let name: String?
    let workload: String?
    let avg: Double?
    let year: String?
    let status: String?
}
