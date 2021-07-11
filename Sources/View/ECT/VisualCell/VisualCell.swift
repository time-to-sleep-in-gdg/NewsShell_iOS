//
//  VisualCell.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/11.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit

class VisualCell: UITableViewCell {

    @IBOutlet weak var graphView: UIView!
    @IBOutlet weak var wordCloudImageView: UIImageView!
    @IBOutlet weak var goodGraphWhiteSpace: NSLayoutConstraint!
    @IBOutlet weak var badGraphWhiteSpace: NSLayoutConstraint!
    @IBOutlet weak var goodGraphPercent: UILabel!
    @IBOutlet weak var badGraphPercent: UILabel!
    @IBOutlet weak var voteCntLabel: UILabel!
    @IBOutlet weak var voteBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }
    
    func setUI() {
        graphView.layer.cornerRadius = 8
        graphView.layer.cornerRadius = 15
        graphView.layer.masksToBounds = false
        graphView.layer.shadowColor = UIColor.black.cgColor
        graphView.layer.shadowOffset = CGSize(width: 0, height: 0)
        graphView.layer.shadowRadius = 3
        graphView.layer.shadowOpacity = 0.2
    }

}

extension VisualCell {
    public func setGraph(goodCnt: Int, badCnt: Int) {
        let total = CGFloat(goodCnt + badCnt)
        goodGraphWhiteSpace.constant = getPercentWidth(percent: CGFloat(goodCnt)/total*100)
        goodGraphPercent.text = "\(Int(CGFloat(goodCnt)/total*100))%"
        badGraphWhiteSpace.constant = getPercentWidth(percent: CGFloat(badCnt)/total*100)
        badGraphPercent.text = "\(Int(CGFloat(badCnt)/total*100))%"
        voteCntLabel.text = "\(goodCnt + badCnt)명 투표"
    }
    
    private func getPercentWidth(percent: CGFloat) -> CGFloat {
        let totalWidth = graphView.frame.width - 32
        return totalWidth*((100-percent)/100)
    }
}
