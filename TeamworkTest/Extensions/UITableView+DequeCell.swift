//
//  UITableView+DequeCell.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(
        forIndexPath indexPath: IndexPath
        ) -> T
        where T: CellIdentifierProtocol {
            guard let cell = dequeueReusableCell(
                withIdentifier: T.cellIdentifier,
                for: indexPath
                ) as? T else {
                fatalError("Could not dequeue cell with identifier: \(T.cellIdentifier)")
            }
            
            return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>(
        _ type: T.Type,
        forIndexPath indexPath: IndexPath)
        -> T
        where T: CellIdentifierProtocol {
            
            guard let cell = dequeueReusableCell(
                withIdentifier: type.cellIdentifier,
                for: indexPath
                ) as? T else {
                fatalError("Could not dequeue cell with identifier: \(T.cellIdentifier)")
            }
            
            return cell
    }
    
    
    
    func dequeueReusableCell<T: UITableViewCell>() -> T? where T: CellIdentifierProtocol {
        return dequeueReusableCell(withIdentifier: T.cellIdentifier) as? T
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type) -> T? where T: CellIdentifierProtocol {
        
        return dequeueReusableCell(withIdentifier: T.cellIdentifier) as? T
    }
}
