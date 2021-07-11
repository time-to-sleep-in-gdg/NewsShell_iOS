//
//  ViewModel.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/08.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class MainViewModel: ViewModel {
    var disposeBag = DisposeBag()
    var keywords = [[Keyword]()]
    
    struct Input {
    }
    
    struct Output {
        let alarmCount = BehaviorRelay<Int>(value: 0)
        let categoryList = PublishRelay<[Category]>()
        let keywordList = PublishRelay<[[Keyword]]>()
    }
    
    func transform(_ input: Input) -> Output {
        let output = Output()
        
        HTTPClient.shared.networking(.home(categoryId: "1", userId: "1"), HomeModel.self)
            .subscribe(onSuccess: { data in
                output.alarmCount.accept(data.alarm_cnt)
                output.categoryList.accept(data.categorys)
                
                for categoryIndex in 0..<data.categorys.count {
                    for keyword in data.keywords {
                        if keyword.category_id == data.categorys[categoryIndex].category_id {
                            self.keywords[categoryIndex].append(keyword)
                        }
                    }
                    self.keywords.append([])
                }
                _ = self.keywords.popLast()
                output.keywordList.accept(self.keywords)
            })
            .disposed(by: self.disposeBag)
        
        return output
    }
}
