//
//  ProjectDetailsDataSource.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 04/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import UIKit

class ProjectDetailsDataSource: StaticDataSource<ProjectDetailsCellModel> {
    weak var project: Project?
    init(
        project: Project?,
        tableView: UITableView) {
        self.project = project
        super.init(tableView: tableView, objects: [])
        setupRows()
    }
    
    private func setupRows() {
        guard let project = project else { return }
        objects = [
            .name(project.name),
            .startDate(project.startDate),
            .endDate(project.endDate),
            .createDate(project.createDate),
            .company(project.company),
            .status(project.status),
            .starred(project.starred)
        ]
        
        if let announcement = project.announcement, announcement.isEmpty == false {
            objects.append(.announcement(announcement))
        }
        
        if let logo = project.logo {
            objects.insert(.logo(logo), at: 0)
        }
        
        if let info = project.info, info.isEmpty == false {
            objects.append(.info(info))
        }
    }
}
