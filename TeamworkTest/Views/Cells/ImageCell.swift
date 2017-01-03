//
//  ImageCell.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import UIKit

class ImageCell: UITableViewCell, BaseCellProtocol {
    @IBOutlet weak var photoView: UIImageView!
    
    func load(viewModel: CellModel) {
        if let viewModel = viewModel as? ViewModel {
            photoView.image = viewModel.image
        }
    }
    
    struct ViewModel: CellModel {
        let image: UIImage
    }
}
