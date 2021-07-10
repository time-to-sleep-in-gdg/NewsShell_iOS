//
//  TimeLineCell.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/10.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TimeLineCell: UITableViewCell {
    
    public var stateOfExpandCell: StateOfExpandCell = .closed
    public var disposeBag = DisposeBag()
    
    @IBOutlet weak var articleView: UIView!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ctView: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var todaysFirstStatus: UIView!
    @IBOutlet weak var openBtn: UIButton!
    @IBOutlet weak var viewMoreBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bind()
        closeCell()
        setUI()
    }
    
    func bind() {
        
    }
    
    func setUI() {
        articleView.layer.cornerRadius = 8
        viewMoreBtn.layer.cornerRadius = 15
        viewMoreBtn.layer.masksToBounds = false
        viewMoreBtn.layer.shadowColor = UIColor.black.cgColor
        viewMoreBtn.layer.shadowOffset = CGSize(width: 0, height: 0)
        viewMoreBtn.layer.shadowRadius = 2
        viewMoreBtn.layer.shadowOpacity = 0.1
        circleView.layer.cornerRadius = 4
    }
    
    func cellExpand() {
        switch stateOfExpandCell {
        case .closed:
            openCell()
        case .opened:
            closeCell()
        }
    }
    
    func openCell() {
        self.contentViewHeightConstraint.constant = 164
        self.ctView.isHidden = false
        self.ctView.alpha = 1
        stateOfExpandCell = .opened
    }
    
    func closeCell() {
        self.contentViewHeightConstraint.constant = 0
        self.ctView.alpha = 0
        self.ctView.isHidden = true
        stateOfExpandCell = .closed
    }
    
    enum StateOfExpandCell {
        case opened
        case closed
    }
}
