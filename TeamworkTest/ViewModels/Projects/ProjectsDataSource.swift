//
//  ProjectsDataSource.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import UIKit

class ProjectsDataSource: DataSource<Project> {
    weak var delegate: DataSourceProtocol!
    init(delegate: DataSourceProtocol, tableView: UITableView, projects: [Project] = [Project]()) {
        self.delegate = delegate
        super.init(tableView: tableView, objects: projects)
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TitleCell = tableView
            .dequeueReusableCell(
                forIndexPath: indexPath
        )
        
        if let viewModel = viewModel(at: indexPath) {
            cell.load(viewModel: viewModel)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        if let data = viewModel(at: indexPath) {
            self.delegate.didSelectItem(data)
        }
    }
    
    func viewModel(at indexPath: IndexPath) -> CellModel? {
        guard let project = data(at: indexPath) else {
            return nil
        }
        
        return TitleCell.ViewModel(title: project.name)
    }

}
