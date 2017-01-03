//
//  Date+Formatting.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation

extension Date {
    fileprivate static var isoDateFormatter: ISO8601DateFormatter {
        struct Formatter {
            static let formatter = ISO8601DateFormatter()
        }
        Formatter.formatter.timeZone = TimeZone.UTCTimeZone()
        return Formatter.formatter
    }
    
    fileprivate static var dateFormatter: DateFormatter {
        struct Formatter {
            static let formatter = DateFormatter()
        }
        Formatter.formatter.timeZone = TimeZone.UTCTimeZone()
        Formatter.formatter.dateFormat = "YYYYMMDD"
        return Formatter.formatter
    }
    
    public static func date(fromISO8601 string: String) -> Date? {
        return isoDateFormatter
            .date(from: string)
    }
    
    
    public static func date(string: String) -> Date? {
        return dateFormatter
            .date(from: string)
    }
    
    public func iso8601String() -> String {
        return Date.isoDateFormatter.string(from: self)
    }
}
