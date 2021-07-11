//
//  TimeLineVC.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/10.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher
import SafariServices

class TimeLineVC: UIViewController {

    private let disposeBag = DisposeBag()
    private let viewModel = TimeLineViewModel()
    var keywordId: Int!
    var articles = [Article]()
    var viewStatus: ViewStatus = .timeline
    private var wordCloudImageObservable: BehaviorRelay<String>?
    private var reactionObservable: BehaviorRelay<(Int,Int)>?
    private var isFlowing = false
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mockLargeNavigationBar: UIView!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var followerImage1: UIImageView!
    @IBOutlet weak var followerImage2: UIImageView!
    @IBOutlet weak var followerImage3: UIImageView!
    @IBOutlet weak var followerCounter: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewTimeLineBtn: UIButton!
    @IBOutlet weak var viewTimeLineStatusBar: UIView!
    @IBOutlet weak var ViewVisualBtn: UIButton!
    @IBOutlet weak var viewVisualStatusBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
        setUI()
        setNavigationBar()
        setTableView()
    }
    
    func setUI() {
        followBtn.layer.borderWidth = 1
        followBtn.layer.borderColor = #colorLiteral(red: 0.462745098, green: 0.462745098, blue: 0.462745098, alpha: 1)
        followBtn.layer.cornerRadius = 15
        followerImage1.layer.cornerRadius = 10.5
        followerImage2.layer.cornerRadius = 10.5
        followerImage3.layer.cornerRadius = 10.5
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.topItem?.title = ""
        mockLargeNavigationBar.layer.addBorder([.bottom], color: #colorLiteral(red: 0.7685618401, green: 0.768670857, blue: 0.7685275674, alpha: 1), width: 0.3)
    }
    
    func bind() {
        let input = TimeLineViewModel.Input(keywordId: self.keywordId)
        let output = viewModel.transform(input)
        
        output.infomation.bind(to: infoLabel.rx.text).disposed(by: disposeBag)
        output.title.bind(to: titleLabel.rx.text).disposed(by: disposeBag)
        output.follower.subscribe(onNext: { imageArr, followCntText in
            switch imageArr.count {
            case 3:
                self.followerImage1.kf.setImage(with: URL(string: imageArr[0]))
                self.followerImage2.kf.setImage(with: URL(string: imageArr[1]))
                self.followerImage3.kf.setImage(with: URL(string: imageArr[2]))
                self.followerCounter.text = followCntText
            case 2:
                self.followerImage1.kf.setImage(with: URL(string: imageArr[0]))
                self.followerImage2.kf.setImage(with: URL(string: imageArr[1]))
                self.followerImage3.isHidden = true
                self.followerCounter.text = followCntText
            case 1:
                self.followerImage1.kf.setImage(with: URL(string: imageArr[0]))
                self.followerImage2.isHidden = true
                self.followerImage3.isHidden = true
                self.followerCounter.text = followCntText
            default:
                self.followerImage1.isHidden = true
                self.followerImage2.isHidden = true
                self.followerImage3.isHidden = true
                self.followerCounter.text = "0명"
            }
        })
        .disposed(by: disposeBag)
        output.articleList.subscribe(onNext: {
            self.articles = $0
            for i in 0..<$0.count {
                self.articles[i].isOpening = false
            }
            self.tableView.dataSource = self
            self.tableView.reloadData()
        })
        .disposed(by: disposeBag)
        
        wordCloudImageObservable = output.wordCloud
        reactionObservable = output.reaction
        
        viewTimeLineBtn.rx.tap.subscribe(onNext: {
            self.viewStatus = .timeline
            self.viewTimeLineBtn.setTitleColor(.black, for: .normal)
            self.ViewVisualBtn.setTitleColor(#colorLiteral(red: 0.462745098, green: 0.462745098, blue: 0.462745098, alpha: 1), for: .normal)
            self.viewTimeLineStatusBar.isHidden = false
            self.viewVisualStatusBar.isHidden = true
            self.tableView.reloadData()
        })
        .disposed(by: disposeBag)
        
        ViewVisualBtn.rx.tap.subscribe(onNext: {
            self.viewStatus = .visual
            self.ViewVisualBtn.setTitleColor(.black, for: .normal)
            self.viewTimeLineBtn.setTitleColor(#colorLiteral(red: 0.462745098, green: 0.462745098, blue: 0.462745098, alpha: 1), for: .normal)
            self.viewVisualStatusBar.isHidden = false
            self.viewTimeLineStatusBar.isHidden = true
            self.tableView.reloadData()
        })
        .disposed(by: disposeBag)
        
        followBtn.rx.tap.subscribe(onNext: {
            self.isFlowing = !self.isFlowing
            self.followBtn.setTitle(self.isFlowing ? "팔로잉" : "팔로우", for: .normal)
            self.followBtn.backgroundColor = self.isFlowing ?  #colorLiteral(red: 1, green: 0.8941176471, blue: 0.6980392157, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        })
        .disposed(by: disposeBag)
    }

}

extension TimeLineVC: UITableViewDelegate, UITableViewDataSource {
    
    func setTableView() {
        self.tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        registerNibs()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        return view
    }
    
    func registerNibs() {
        var nib = UINib(nibName: "TimeLineCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TimeLineCell")
        nib = UINib(nibName: "VisualCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "VisualCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewStatus == .timeline ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewStatus {
        case .timeline:
            return section == 0 ? 1 : articles.count-1
        case .visual:
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewStatus {
        case .timeline:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineCell", for: indexPath) as! TimeLineCell
            
            let index = indexPath.section == 0 ? 0 : indexPath.row + 1
            if index == 0 {
                cell.articleView.backgroundColor = #colorLiteral(red: 1, green: 0.8941176471, blue: 0.6980392157, alpha: 1)
                cell.bar.backgroundColor = #colorLiteral(red: 1, green: 0.8941176471, blue: 0.6980392157, alpha: 1)
            }
            
            cell.titleLabel.text = articles[index].article_title
            cell.contentLabel.text = articles[index].article_summary
            cell.infoLabel.text = "\(articles[index].company) | \(articles[index].create_datetime.dateProcessing()) | \(articles[index].reporter_name)"
            if index == 0 {
                cell.todaysFirstStatus.isHidden = true
            }
            if articles[index].isOpening! {
                cell.openCell()
            } else {
                cell.closeCell()
            }
            
            cell.openBtn.rx.tap.asDriver()
                .throttle(.seconds(10), latest: false)
                .drive(onNext: {
                    cell.openBtn.isSelected = !cell.openBtn.isSelected
                    self.articles[index].isOpening = !self.articles[index].isOpening!
                    self.tableView.reloadData()
                })
                .disposed(by: cell.disposeBag)
            
            cell.viewMoreBtn.rx.tap.subscribe(onNext: {
                if let url = URL(string: self.articles[index].link) {
                    let safariViewController = SFSafariViewController(url: url)
                    self.present(safariViewController, animated: true, completion: nil)
                }
            })
            .disposed(by: disposeBag)
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSz"
            guard let temp = formatter.date(from: articles[index].create_datetime) else {return cell}
            formatter.dateFormat = "M월 d일 H:m"
            let current_time_string = formatter.string(from: temp)
            cell.timeLabel.text =  current_time_string
            
            return cell
        case .visual:
            let cell = tableView.dequeueReusableCell(withIdentifier: "VisualCell", for: indexPath) as! VisualCell
            
            wordCloudImageObservable?.subscribe(onNext: {
                cell.wordCloudImageView.kf.setImage(with: URL(string: $0))
            })
            .disposed(by: disposeBag)
            
            reactionObservable?.subscribe(onNext: {
                cell.setGraph(goodCnt: $0, badCnt: $1)
            })
            .disposed(by: disposeBag)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? TimeLineCell {
            cell.disposeBag = DisposeBag()
        }
    }
    
    enum ViewStatus {
        case timeline
        case visual
    }
}
