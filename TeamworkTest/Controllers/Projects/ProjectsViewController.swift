//
//  ProjectsViewController.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var dataSource: ProjectsDataSource!
    var projects = [Project]()
    var teamworkService = TeamworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = ProjectsDataSource(
            delegate: self,
            tableView: self.tableView,
            projects: projects
        )
        fetchProjects()
    }
    
    private func fetchProjects() {
        dataSource.addLoadingView()
        teamworkService
            .getProjects()
            .then { [weak self] fetchedProjects -> Void in
            self?.dataSource.removeLoadingView()
            self?.dataSource.objects = fetchedProjects
        }.catch { [weak self] error -> Void in
            //handle error
            self?.dataSource.removeLoadingView()
        }
    }
}

extension ProjectsViewController: DataSourceProtocol {
    func didSelectItem(_ item: Any?) {
        
    }
}
