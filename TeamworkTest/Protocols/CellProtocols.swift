//
//  CellProtocols.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import UIKit

protocol CellIdentifierProtocol: class {
    static var cellIdentifier: String { get }
}

extension CellIdentifierProtocol
where Self: UITableViewCell {
    
    static var cellIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

protocol CellModel {}

protocol CellLoadDataProtocol {
    func load(viewModel: CellModel) -> Void
}

protocol BaseCellProtocol: CellIdentifierProtocol, CellLoadDataProtocol {}


class BaseCell: UITableViewCell, BaseCellProtocol {
     func load(viewModel: CellModel) {}
}
