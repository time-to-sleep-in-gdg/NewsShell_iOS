//
//  KeywordsVC.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/09.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class KeywordsVC: UIViewController {
    
    @IBOutlet weak var keywordsCollectionView: UICollectionView!
    
    private var flagOfCellHigh = true
    public var keywords = [Keyword]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keywordsCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        if let layout = keywordsCollectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        keywordsCollectionView.delegate = self
        keywordsCollectionView.dataSource = self
        registerCell()
        bind()
    }
    
    func bind() {
    }
    
    func getCellHigh(index: Int) -> CGFloat {
        let cellHighList = [90,110,130,150]
        if index == 0 {
            return 160
        } else {
            return CGFloat(cellHighList[Int.random(in: 0...3)])
        }
    }
    
}

extension KeywordsVC: PinterestLayoutDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func registerCell() {
        let clubMemberNib = UINib(nibName: "KeywordCell", bundle: nil)
        keywordsCollectionView.register(clubMemberNib, forCellWithReuseIdentifier: "KeywordCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KeywordCell", for: indexPath) as! KeywordCell
        let keyword = keywords[indexPath.row]
        
        cell.categoryLabel.text = keyword.category_name
        cell.titleLabel.text = keyword.keyword_name
        cell.watchedCountLabel.text = String(keyword.view_cnt)
        cell.commentCountLabel.text = String(keyword.comment_cnt)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let vc = UIStoryboard.init(name: "main", bundle: nil).instantiateViewController(withIdentifier: "TimeLineViewController") as! TimeLineVC
        vc.keywordId = keywords[indexPath.row].keyword_id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> CGFloat {
        return getCellHigh(index: indexPath.row)
    }
}
