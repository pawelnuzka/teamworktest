//
//  APIModel.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import SwiftyJSON

enum BaseArrayKeys: String {
    case Count = "count"
}

open class APIModel: NSObject {
    
    // Names of required keys in json. Used in `validateJSON`.
    class var requiredKeys: [String] {
        struct Keys {
            static let keys: [String] = []
        }
        return Keys.keys
    }
    
    // Used to get array out of response.
    class var arrayKey: String {
        return "data"
    }
    
    // Valide if JSON contains all requried keys
    class func validateJSON(_ json: JSON) -> Error? {
        for property in requiredKeys {
            if json[property].exists() == false {
                return APIModelError.missingField(field: property)
            }
        }
        return nil
    }
    
    
    //Do not call init method directly
    override init() {}
    
    open class func modelWithJSON(_ json: JSON) throws -> Self {
        fatalError("This is an abstract class")
    }
    
    // Gets subjson using `topLevelKey` and `mainKey` if they are defined.
    
    open class func dataJSON(_ json: JSON) throws -> JSON {
        if let error = validateJSON(json) {
            throw error
        } else {
            return json
        }
    }
    
    
    open class func getDateFromISO8601String(_ key: String, json: JSON) -> Date? {
        guard let dateString = json[key].string else {
            return nil
        }
        
        // If is on main thread, return result immediately
        if Thread.isMainThread {
            return Date.date(fromISO8601: dateString)
        } else /* DateFormatter can be only used on main thread */{
            var result: Date?
            DispatchQueue.main.sync { () -> Void in
                result = Date.date(fromISO8601: dateString)
            }
            return result
        }
    }
    
    class func getDate(_ key: String, json: JSON) -> Date? {
        guard let dateString = json[key].string else {
            return nil
        }
        
        // If is on main thread, return result immediately
        if Thread.isMainThread {
            return Date.date(string: dateString)
        } else /* DateFormatter can be only used on main thread */{
            var result: Date?
            DispatchQueue.main.sync { () -> Void in
                result = Date.date(string: dateString)
            }
            return result
        }
    }

    
    /*
     Tries to serialize JSON response to model array.
     Generics are used to return array of self, -> [Self] not supported yet
     Please see http://stackoverflow.com/questions/24537238/swift-return-array-of-type-self
     */
    
    open class func modelWithJSONArray<T: APIModel>(
        _ type: T.Type,
        json: JSON
    ) throws -> [T] {
        var result: [T] = []
        var json = json
        
        if let jsonArray = json[arrayKey].array {
            for subJSON in jsonArray {
                let element = try T.modelWithJSON(subJSON)
                result.append(element)
            }
            
            guard jsonArray.count == 0 || (jsonArray.count > 0 && result.count > 0) else {
                throw NSError.invalidServerResponseError()
            }
            
            return result
        } else {
            throw NSError.invalidServerResponseError()
        }
    }
}
