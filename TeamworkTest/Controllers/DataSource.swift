//
//  DataSource.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import UIKit

//Virtual class
class DataSource<T>: TableViewLoadingController,
    UITableViewDataSource, UITableViewDelegate {
    
    var objects: [T] {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(tableView: UITableView, objects: [T] = [T]()) {
        self.objects = objects
        super.init(tableView: tableView)
        self.setupTableView()
    }
    
    fileprivate func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("This is virtual class")
    }
    
    func data(at indexPath: IndexPath) -> T? {
        guard indexPath.row < objects.count else {
            return nil
        }
        
        return objects[indexPath.row]
    }
}
