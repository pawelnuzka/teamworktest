//
//  ProjectDetailsViewController.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import UIKit

class ProjectDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    weak var project: Project?
    var dataSource: ProjectDetailsDataSource!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = ProjectDetailsDataSource(
            project: project, tableView: tableView
        )
    }
}
