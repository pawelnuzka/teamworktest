//
//  TeamworkAPI.swift
//  TeamworkTest
//
//  Created by Paweł Nużka on 03/01/2017.
//  Copyright © 2017 Pawel Nuzka Mobile Developers. All rights reserved.
//

import Foundation
import Moya
import PromiseKit


// Naive solution, don't really like this pattern
let TeamworkProvider = MoyaProvider<Teamwork>(
    plugins: [
        NetworkLoggerPlugin(verbose: true),
        CredentialsPlugin { _ -> URLCredential? in
            return URLCredential(user: "april294unreal", password: "x", persistence: .none)
        }
    ])

public enum Teamwork {
    case projects
}

extension Teamwork: TargetType {
    public var baseURL: URL { return URL(string: "https://yat.teamwork.com")! }
    public var path: String {
        switch self {
        case .projects:
            return "/projects.json"
        }
    }
    public var method: Moya.Method {
        return .get
    }

    public var parameters: [String: Any]? {
        return nil
    }

    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var task: Task {
        return .request
    }
    
    public var validate: Bool {
        return false
    }
    
    public var sampleData: Data {
        switch self {
        case .projects:
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
        }
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}


class TeamworkService {
    func getProjects() -> Promise<[Project]> {
        return fetchProjects().then { response -> Promise<[Project]> in
            // Should add a new layer to save data to database
            return Parser().parseArray(response)
        }
    }
    
    private func fetchProjects() -> Promise<Moya.Response> {
        return Promise(resolvers: { (fulfill, reject) in
            TeamworkProvider.request(.projects) { (result) in
                switch result {
                case let .success(response):
                    fulfill(response)
                case let .failure(error):
                    reject(error)
                }
            }
        })
    }
}
