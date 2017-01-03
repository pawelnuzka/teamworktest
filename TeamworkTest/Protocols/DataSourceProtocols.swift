//
//  DataSourceProtocols.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation

@objc protocol DataSourceProtocol: class {
    func didSelectItem(_ item: Any?)
}
