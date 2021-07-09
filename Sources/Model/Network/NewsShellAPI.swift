//
//  NewsShellAPI.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/08.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import Foundation
import Alamofire

enum NewsShellAPI {
    
}

extension NewsShellAPI {

    public var uri: String {
        let baseUrl = "http://13.125.161.204:8080"
        return baseUrl + path
    }

    public var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    public var parameters: Parameters? {
        switch self {
        default:
            return nil
        }
    }

    public var encoding: ParameterEncoding {
        switch self.method {
        case .get:
            return URLEncoding.queryString
        default:
            return JSONEncoding.default
        }
    }

    public var header: HTTPHeaders? {
        switch self {
        default:
            return nil
        }
    }

    private var path: String {
        switch self {
        default:
            return ""
        }
    }

    private func encodingQuery(query: String) -> String {
        return query.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? query
    }
}
