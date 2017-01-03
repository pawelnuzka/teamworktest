//
//  NSError+APIErrors.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation

extension NSError {
    
    enum ErrorDomain: String {
        case invalidServerResponse = "InvalidServerResponseDomain"
    }
    
    class func invalidServerResponseError() -> NSError {
        let message = "The server response is invalid."
        return NSError(
            domain: ErrorDomain.invalidServerResponse.rawValue,
            code: 0,
            userInfo: ["message" : message]
        )
    }
}
