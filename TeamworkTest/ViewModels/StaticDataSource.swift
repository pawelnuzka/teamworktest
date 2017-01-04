//
//  StaticDataSource.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 04/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import UIKit

protocol StaticCellModel {
    var cellType: BaseCell.Type { get }
    var viewModel: CellModel { get }
}


class StaticDataSource<T: StaticCellModel>: DataSource<T> {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellRow = data(at: indexPath) else {
            fatalError("Should not modify static cells")
        }
        
        let cell = tableView.dequeueReusableCell(cellRow.cellType, forIndexPath: indexPath)
        
        cell.load(viewModel: cellRow.viewModel)

        return cell
    }
}
