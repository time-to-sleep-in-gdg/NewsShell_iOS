//
//  Extensions.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/10.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit

extension UIView {
    func setKeywordCell() {
        self.layer.masksToBounds = false
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 8
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.1
    }
}

extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}

extension String {
    func dateProcessing() -> String{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier:"ko_KR")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSz"
            
        guard let temp = formatter.date(from: self) else {return ""}
            
        let diff = Date().timeIntervalSince1970 - temp.timeIntervalSince1970 + 32400
        let day_diff = Int(diff / 86400)
            
        if day_diff < 0 || day_diff >= 31 {
            formatter.dateFormat = "yyyy년 MM월 dd일"
            let current_time_string = formatter.string(from: temp)
            return current_time_string
        } else {
            return day_diff == 0 ? (
                diff < 60 ? "방금":
                diff < 120 ? "1분 전":
                diff < 3600 ? "\(Int(diff/60))분 전":
                diff < 7200 ? "1시간 전":
                "\(Int(diff/3600))시간 전"
            ): (
                day_diff == 1 ? "어제":
                day_diff < 7 ? "\(day_diff)일 전":
                "\(Int(day_diff/7))주 전"
            )
        }
    }
}
