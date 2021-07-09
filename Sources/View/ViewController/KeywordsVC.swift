//
//  KeywordsVC.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/09.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit

class KeywordsVC: UIViewController {
    
    @IBOutlet weak var keywordsCollectionView: UICollectionView!
    
    public var keyword: String = ""
    private var flagOfCellHigh = true
    
    override func viewDidLoad() {
        keywordsCollectionView.delegate = self
        keywordsCollectionView.dataSource = self
    }
    
    func getCellHigh(index: Int) -> CGFloat {
        if index%3 == 0 { flagOfCellHigh = !flagOfCellHigh }
        return flagOfCellHigh ? 90 : 160
    }
    
}

extension KeywordsVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "firstCellView", for: indexPath) as! FirstCellReusableView
        headerView.firstCellView.setKeywordCell()
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 200
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! KeywordCell
        cell.setKeywordCell()
        return cell
    }
    
    // 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellWithd = collectionView.frame.width / 2 - 21
        return CGSize(width: collectionViewCellWithd, height: self.getCellHigh(index: indexPath.row))
    }
    //위아래 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    //옆 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
