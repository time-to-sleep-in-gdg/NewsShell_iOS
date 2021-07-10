//
//  StatusCode.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/08.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import Foundation

enum StatusCode: Error {
    /// 200; 성공
    case OK
    /// 400; 올바르지 않은 요청
    case badRequest
    /// 401; 토큰 인증 실패
    case unauthorized
    /// 402; 권한 없음
    case forbidden
    /// 404; 찾을 수 없는 경로
    case notFound
    /// 500; 서버 에러
    case internalServerError
    /// 알수 없는 에러
    case unkown
}
