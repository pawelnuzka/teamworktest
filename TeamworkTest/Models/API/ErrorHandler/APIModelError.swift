//
//  APIModelError.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation

enum APIModelError: Error, CustomDebugStringConvertible {
    case missingField(field: String)
    
    var debugDescription: String {
        switch self {
        case .missingField(let field):
            return field
        }
    }
}
