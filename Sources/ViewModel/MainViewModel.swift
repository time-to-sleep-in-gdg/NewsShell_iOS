//
//  ViewModel.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/08.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

class MainViewModel: ViewModel {
    
    var disposeBag = DisposeBag()
    private var caregorys = [String]()

    struct Input {
        let viewDidLoad: PublishRelay<Void>
        let changeCategory: PublishRelay<Int>
    }
    
    struct Output {
        let categoryList = BehaviorRelay<[String]>(value: [])
        let keywordList = BehaviorRelay<[Keyword]>(value: [])
    }
    
    func transform(_ input: Input) -> Output {
        let output = Output()
        
        input.viewDidLoad
            .subscribe(onNext: { [weak self] in
                output.categoryList.accept(self!.getCategory())
            })
            .disposed(by: disposeBag)
        
        return output
    }
    
    /// 카테고리 불러오기
    private func getCategory() -> [String] {
        return ["1","2","3"]
    }
    
    /// 키워드들 불러오기
    private func getKeywords(categoryIndex: Int) -> [Keyword] {
        let TestKeyword = Keyword(title: "test",
                                  category: "",
                                  isSaving: false,
                                  countSharing: 99,
                                  countComment: 99)
        return [TestKeyword]
    }
}
