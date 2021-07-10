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
    case home(categoryId: String, userId: String)
    case keyword(keywordId: String, userId: String)
}

extension NewsShellAPI {

    public var uri: String {
        let baseUrl = "https://newsshell-node-dev.herokuapp.com"
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
        case .home(let categoryId, let userId):
            return "/home?categoryId=\(categoryId)&userId=\(userId)"
        case .keyword(let keywordId, let userId):
            return "/keyword/\(keywordId)?userId=\(userId)"
        }
    }

    private func encodingQuery(query: String) -> String {
        return query.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? query
    }
}
