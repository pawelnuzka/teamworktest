//
//  ProjectDetailsCellModel.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 04/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation

enum ProjectDetailsCellModel: StaticCellModel {
    case logo(URL)
    case createDate(Date)
    case startDate(Date)
    case endDate(Date)
    case name(String)
    case company(String)
    case announcement(String)
    case status(String)
    case info(String)
    case starred(Bool)
    
    var cellType: BaseCell.Type {
        switch self {
        case .logo:
            return ImageCell.self
        case .createDate, .startDate, .endDate, .name, .company, .status, .starred:
            return SubtitleCell.self
        case .announcement, .info:
            return DescriptionCell.self
        }
    }
    
    var viewModel: CellModel {
        switch self {
        case .logo(let image):
            return ImageCell.ViewModel(image: image)
        case .createDate(let date):
            return SubtitleCell.ViewModel(title: "Create date:", subtitle: "\(date)")
        case .startDate(let date):
            return SubtitleCell.ViewModel(title: "Start date:", subtitle: "\(date)")
        case .endDate(let date):
            return SubtitleCell.ViewModel(title: "End date:", subtitle: "\(date)")
        case .name(let name):
            return SubtitleCell.ViewModel(title: "Name:", subtitle: name)
        case .company(let company):
            return SubtitleCell.ViewModel(title: "Company:", subtitle: company)
        case .status(let status):
            return SubtitleCell.ViewModel(title: "Status:", subtitle: status)
        case .starred(let starred):
            return SubtitleCell.ViewModel(title: "Starred: ", subtitle: "\(starred)")
        case .announcement(let text):
            return DescriptionCell.ViewModel(title: text)
        case .info(let text):
            return DescriptionCell.ViewModel(title: text)
        }
    }
}
