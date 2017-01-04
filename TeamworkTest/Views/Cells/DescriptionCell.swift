//
//  DescriptionCell.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import UIKit

class DescriptionCell: BaseCell {
    @IBOutlet weak var title: UILabel!
    override func load(viewModel: CellModel) {
        if let viewModel = viewModel as? ViewModel {
            title.attributedText = viewModel.attributedTitle
        }
    }
    
    struct ViewModel: CellModel {
        let attributedTitle: NSAttributedString
        init(title: String) {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.minimumLineHeight = 20.0
            
            let attributes: [String: AnyObject] = [
                NSFontAttributeName : UIFont.systemFont(ofSize: 14),
                NSForegroundColorAttributeName: UIColor.black,
                NSParagraphStyleAttributeName: paragraphStyle
            ]
            
            attributedTitle = NSAttributedString(string: title, attributes: attributes)
        }
    }
}
