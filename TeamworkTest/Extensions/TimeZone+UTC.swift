//
//  TimeZone+UTC.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation

extension TimeZone {
    static func UTCTimeZone() -> TimeZone {
        return TimeZone(identifier: "UTC")!
    }
}

