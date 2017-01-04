//
//  UIViewController+SegueIdentifiers.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 04/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func performSegue(withIdentifier identifier: SegueIdentifier, sender: AnyObject?) {
        performSegue(withIdentifier: identifier.rawValue, sender: sender)
    }
}
