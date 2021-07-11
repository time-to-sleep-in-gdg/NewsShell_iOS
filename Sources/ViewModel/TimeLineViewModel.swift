//
//  TimeLineViewModel.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/10.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TimeLineViewModel: ViewModel {
    var disposeBag = DisposeBag()
    
    struct Input {
        let keywordId: Int
    }
    
    struct Output {
        let title = BehaviorRelay<String>(value: " ")
        let articleList = PublishRelay<[Article]>()
        let infomation = BehaviorRelay<String>(value: "")
        let follower = PublishRelay<([String], String)>()
        let wordCloud = BehaviorRelay<String>(value: "http://drive.google.com/uc?export=view&id=1TbB3iZbiaaSnHflfr9gHviNDJzws-q1i")
        let reaction = BehaviorRelay<(Int,Int)>(value: (0,0))
    }
    
    func transform(_ input: Input) -> Output {
        let output = Output()
        
        HTTPClient.shared.networking(.keyword(keywordId: "\(input.keywordId)", userId: "1"), KeywordInfoModel.self)
            .subscribe(onSuccess: { data in
                
                print(data.graph.reaction)
                
                output.title.accept(data.keyword_name)
                
                var articles = [data.timeline.new_article]
                articles += data.timeline.articles
                output.articleList.accept(articles)
                
                let infomation = "\(data.category_name) | \(data.last_updated_at.dateProcessing()) |"
                output.infomation.accept(infomation)
                
                output.follower.accept((data.follow_user_profiles, "외 \(data.follow_cnt)명"))
                
                output.wordCloud.accept(data.graph.word_cloud_url)
                
                output.reaction.accept((data.graph.reaction.like ?? 0,
                                        data.graph.reaction.hate ?? 0))
            })
            .disposed(by: self.disposeBag)
        
        return output
    }
}

