//
//  AuthenticationResponse.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 11/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import Foundation

struct AuthenticationResponse: BaseModel {
    var ra: String
    var name: String
    var courseName: String
    var courseType: String
    var situation: String
    var email: String
    var photoUri: String
}
