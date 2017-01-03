//
//  SubtitleCell.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import UIKit

class SubtitleCell:  UITableViewCell, BaseCellProtocol {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    func load(viewModel: CellModel) {
        if let viewModel = viewModel as? ViewModel {
            title.attributedText = viewModel.attributedTitle
            subtitle.attributedText = viewModel.attributedSubtitle
        }
    }
    
    struct ViewModel: CellModel {
        let attributedTitle: NSAttributedString
        let attributedSubtitle: NSAttributedString
        init(title: String, subtitle: String) {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.minimumLineHeight = 20.0
            
            var attributes: [String: AnyObject] = [
                NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14),
                NSForegroundColorAttributeName: UIColor.black,
                NSParagraphStyleAttributeName: paragraphStyle
            ]
            
            attributedTitle = NSAttributedString(string: title, attributes: attributes)
            
            attributes[NSFontAttributeName] = UIFont.systemFont(ofSize: 14)
            attributedSubtitle = NSAttributedString(string: subtitle, attributes: attributes)
        }
    }
}
