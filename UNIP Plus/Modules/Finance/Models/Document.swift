//
//  Documents.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

struct Document: CodableObject {
    let type: String?
    let name: String?
    let totalPaid: Double?
    let payments: [Payment]?
}
