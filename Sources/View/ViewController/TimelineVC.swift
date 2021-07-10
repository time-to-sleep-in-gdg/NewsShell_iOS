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

class TimeLineVC: UIViewController {

    var arr = [[false,false],[false,false],[false,false],[false,false]]
    
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
        
    }

}

extension TimeLineVC: UITableViewDelegate, UITableViewDataSource {
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        registerNibs()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        return view
    }
    
    func registerNibs() {
        var nib = UINib(nibName: "TimeLineCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TimeLineCell")
        nib = UINib(nibName: "TimeLineSectionHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "TimeLineSectionHeaderView")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineCell", for: indexPath) as! TimeLineCell
        
        if indexPath.row == 0 {
            cell.todaysFirstStatus.isHidden = true
        }
        if arr[indexPath.section][indexPath.row] {
            cell.openCell()
        } else {
            cell.closeCell()
        }
        
        cell.openBtn.rx.tap.asDriver()
            .throttle(.seconds(10), latest: false)
            .drive(onNext: {
                self.arr[indexPath.section][indexPath.row] = !self.arr[indexPath.section][indexPath.row]
                self.tableView.reloadData()
            })
            .disposed(by: cell.disposeBag)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? TimeLineCell {
            cell.disposeBag = DisposeBag()
        }
    }
}
