//
//  ImageCell.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class ImageCell: BaseCell {
    @IBOutlet weak var photoView: UIImageView!
    
    override func load(viewModel: CellModel) {
        if let viewModel = viewModel as? ViewModel {
            photoView.af_setImage(
                withURL: viewModel.image,
                placeholderImage: UIImage(named: "placeholder")!
            )
            //Should add image caching mechanism, this is naive solution
        }
    }
    
    struct ViewModel: CellModel {
        let image: URL
    }
}
