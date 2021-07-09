//
//  ViewModelProtocol.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/09.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import Foundation

protocol ViewModel {
    associatedtype input
    associatedtype output
    
    func transform(_ input: input) -> output
}
