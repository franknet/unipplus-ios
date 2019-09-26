//
//  Payment.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 26/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import Foundation

class Payment: Codable {
    var sequecy: String?
    var install: String?
    var debt_desc: String?
    var maturity_dt: String?
    var doc_value: String?
    var payment_dt: String?
    var value: String?
    var reversal: String?
    var status: String?
    var payment_method: String?
    var difference: Double!
}
