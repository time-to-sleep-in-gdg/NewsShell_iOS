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
    
    override func awakeFromNib() {
        self.layer.masksToBounds = true
        
    }
}
