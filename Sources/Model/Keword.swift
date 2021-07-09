//
//  Keword.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/09.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import Foundation

struct Keyword: Codable {
    let title: String
    let category: String
    let isSaving: Bool
    let countSharing: Int
    let countComment: Int
}
