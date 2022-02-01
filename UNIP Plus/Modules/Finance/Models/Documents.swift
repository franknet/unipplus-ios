//
//  Payments.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

struct Documents: CodableObject {
    let totalPaid: Double?
    let docs: [Document]?
}
