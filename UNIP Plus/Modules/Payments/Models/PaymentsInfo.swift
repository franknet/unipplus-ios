//
//  PaymentsInfo.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 26/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import Foundation

class PaymentsInfo: Codable {
    var total_paid: Int!
    var payments: [PaymentsGroup]?
}
