//
//  HomeModel.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/10.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import Foundation

struct HomeModel: Codable {
    let user_nickname: String
    let alarm_cnt: Int
    let categorys: [Category]
    let keywords: [Keyword]
}

struct Category: Codable, Equatable {
    let category_id: Int
    let category_name: String
}

struct Keyword: Codable {
    let category_id: Int
    let category_name: String
    let keyword_id: Int
    let keyword_name: String
    let is_follow: Bool
    let follow_cnt: Int
    let follow_user_profiles: [String]
    let view_cnt: Int
    let comment_cnt: Int
}
