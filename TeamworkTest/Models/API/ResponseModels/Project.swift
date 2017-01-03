//
//  Project.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Base abstract class for serialization.
 Should not be used directly, use subclassing.
 */

enum ProjectKeys: String {
    case id
    case logo
    case createDate = "created-on"
    case startDate
    case endDate
    case name
    case company
    case starred
    case announcement
    case status
    case info = "description"
    
    static var requiredKeys: [String] {
        return [
            self.id.rawValue, self.logo.rawValue,
            self.createDate.rawValue, self.startDate.rawValue,
            self.endDate.rawValue, self.name.rawValue
        ]
    }
}

class Project: APIModel {
    let id: String
    let name: String
    let createDate: Date
    let startDate: Date
    let endDate: Date
    let company: String
    let starred: Bool
    let announcement: String
    let status: String
    let logo: String
    let info: String
    
    override class var requiredKeys: [String] {
        return ProjectKeys.requiredKeys
    }
    
    override class var arrayKey: String {
        return "projects"
    }
    
    required public init(
        id: String, name: String,
        createDate: Date, startDate: Date,
        endDate: Date, company: String,
        starred: Bool, announcement: String,
        status: String, logo: String,
        info: String
        ) {
        self.id = id
        self.name = name
        self.createDate = createDate
        self.startDate = startDate
        self.endDate = endDate
        self.company = company
        self.starred = starred
        self.announcement = announcement
        self.status = status
        self.logo = logo
        self.info = info
    }
    
    override open class func modelWithJSON(_ json: JSON) throws -> Self {
        let json = try dataJSON(json)
        let id = json[ProjectKeys.id.rawValue].string
        let name = json[ProjectKeys.name.rawValue].string
        let createDate = getDateFromISO8601String(
            ProjectKeys.createDate.rawValue, json: json
        )
        let startDate = getDate(
            ProjectKeys.startDate.rawValue, json: json
        )
        let endDate = getDate(
            ProjectKeys.endDate.rawValue, json: json
        )
        
        let company = json[ProjectKeys.company.rawValue, ProjectKeys.name.rawValue].string
        let starred = json[ProjectKeys.starred.rawValue].bool
        let announcement = json[ProjectKeys.announcement.rawValue].stringValue
        let status = json[ProjectKeys.status.rawValue].string
        let logo = json[ProjectKeys.logo.rawValue].string
        let info = json[ProjectKeys.info.rawValue].stringValue
        
        if let id = id, let name = name,
            let createDate = createDate, let startDate = startDate,
            let endDate = endDate, let company = company,
            let starred = starred, let status = status,
            let logo = logo {
            return self.init(
                id: id, name: name, createDate: createDate,
                startDate: startDate, endDate: endDate,
                company: company, starred: starred,
                announcement: announcement,
                status: status, logo: logo,
                info: info
            )
        } else {
            throw NSError.invalidServerResponseError()
        }
    }

}
