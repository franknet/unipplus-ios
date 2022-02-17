//
//  Payment.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

struct Payment: CodableObject {
    let seq: String?
    let install: String?
    let docType: String?
    let paymentPlan: String?
    let dueDate: String?
    let docValue: Double?
    let paymentDate: String?
    let valuePaid: Double?
    let reversalValue: Double?
    let status: String?
    let receipt: String?
    let reversalDate: String?
    let difference: Double?
    let bankSlipUrl: String?
}
