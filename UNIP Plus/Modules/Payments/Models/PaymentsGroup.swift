//
//  PaymentsGroup.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 26/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import Foundation

class PaymentsGroup: Codable{
    var type: String?
    var name: String?
    var total: Double!
    var payments: [Payment]?
}
