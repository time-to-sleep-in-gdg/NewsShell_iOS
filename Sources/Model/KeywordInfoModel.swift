//
//  KeywordInfoModel.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/10.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import Foundation

struct KeywordInfoModel: Codable {
    let alarm_cnt: Int
    let category_name: String
    let keyword_id: Int
    let keyword_name: String
    let last_updated_at: String
    let is_follow: Bool
    let follow_cnt: Int
    let follow_user_profiles: [String]
    let timeline: TimeLine
    let graph: Graph
}

struct TimeLine: Codable {
    let new_article: Article
    let articles: [Article]
}

struct Article: Codable {
    let article_id: Int
    let article_title: String
    let article_summary: String
    let is_bookmark: Bool
    let is_hot: Bool
    let company: String
    let reporter_name: String
    let create_datetime: String
    let link: String
}

struct Graph: Codable {
    let gender: Gender
    let age: Age
    let reaction: Reaction
    let cloud_text: [CloudText]
}

struct Gender: Codable {
    let female: Int?
    let male: Int?
}

struct Age: Codable {
    let age10: Int?
    let age20: Int?
    let age30: Int?
    let age40: Int?
    let age50: Int?
    let age60: Int?
}

struct Reaction: Codable {
    let like: Int?
    let hate: Int?
}

struct CloudText: Codable {
    let priority: Int
    let text: String
}
