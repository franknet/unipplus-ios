//
//  Session.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

protocol SessionDelegate: AnyObject {
    func logOut(_ session: Session)
}

class Session {
    
    static var shared: Session = {
        return Session()
    }()
    
    weak var delegate: SessionDelegate?
    
    var user: User?
    
}
