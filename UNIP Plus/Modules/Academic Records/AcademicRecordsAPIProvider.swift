//
//  AcademicRecordsAPIProvider.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 29/01/22.
//

import Foundation

struct AcademicRecordsAPIProvider: APIProvider {
    
    var path: String = "/v1/academic_records"
    
    var method: RestMethod = .GET
    
}
