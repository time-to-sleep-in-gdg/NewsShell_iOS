//
//  KeywordCell.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/10.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit

class KeywordCell: UICollectionViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var watchedCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    override func awakeFromNib() {
        self.layer.masksToBounds = true
        bgView.setKeywordCell()
        self.setKeywordCell()
    }
}
