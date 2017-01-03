//
//  TableViewLoadingController.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import UIKit

protocol LoadingCapableView {
    func removeLoadingView()
    func addLoadingView()
}

class TableViewLoadingController: NSObject, LoadingCapableView {
    
    weak var tableView: UITableView!
    fileprivate var loadingView: UIActivityIndicatorView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        loadingView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        loadingView.hidesWhenStopped = true
        super.init()
    }
    
    func removeLoadingView() {
        tableView?.backgroundView = nil
        loadingView.stopAnimating()
    }
    
    func addLoadingView() {
        loadingView.startAnimating()
        tableView?.backgroundView = loadingView
    }
    
    deinit {
        if tableView?.delegate === self {
            tableView?.delegate = nil
        }
        if tableView?.dataSource === self {
            tableView?.dataSource = nil
        }
    }
}
