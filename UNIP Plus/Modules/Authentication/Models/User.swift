//
//  User.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

enum UserGender: CodableObject {
    case F
    case M
}

struct User: CodableObject {
    let id: String?
    let userName: String?
    let status: String?
    let gender: UserGender?
    let campus: String?
}
