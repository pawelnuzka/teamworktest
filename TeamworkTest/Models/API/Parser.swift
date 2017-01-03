//
//  Parser.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation

import SwiftyJSON
import PromiseKit
import Moya

class Parser {
    
    fileprivate let parseQueue = DispatchQueue.global()
    
    func parse<T: APIModel>(_ response: Moya.Response) -> Promise<T> {
        return parseQueue.promise() {
            let json = JSON(data: response.data)
            return try T.modelWithJSON(json)
        }
    }
    
    func parseArray<T: APIModel>(_ response: Moya.Response)
        -> Promise<[T]> {
            return parseQueue.promise() {
                let json = JSON(data: response.data)
                return try T.modelWithJSONArray(T.self, json: json)
            }
    }
}
