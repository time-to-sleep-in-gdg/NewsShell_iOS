//
//  AnalysisVC.swift
//  NewsShell
//
//  Created by Jinwon Lee on 09/07/2021.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit

class AnalysisVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false) //hide top bar
        createTitleLabel()
        createDescriptionLabel()
        createGraphLabels()
        loadGraphImage()
        loadChartImage()
    }
    
    private func createTitleLabel() {
        let label = UILabel.init(frame: CGRect.init(x: 24, y: 100, width: 111, height: 70))
        label.text = "어피치님의\n뉴스셸 일지"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        label.numberOfLines = 2
        view.addSubview(label)
    }
    private func createDescriptionLabel() {
        let label = UILabel.init(frame: CGRect.init(x: 24, y: 190, width: 300, height: 18))
        label.text = "어피치님의 뉴스셸 사용패턴과 함께 기사를 추천해드려요"
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 1
        view.addSubview(label)
    }
    private func createGraphLabels() {
        let timeLabel = UILabel.init(frame: CGRect.init(x: 57, y: 239, width: 270, height: 27))
        timeLabel.text = "어피치님은 아침을 뉴스셸로 시작해요"
        timeLabel.textColor = .black
    
        timeLabel.font = UIFont.boldSystemFont(ofSize: 18)
        timeLabel.textAlignment = .left
        timeLabel.numberOfLines = 1
        
        let categoryLabel = UILabel.init(frame: CGRect.init(x: 56, y: 480, width: 185, height: 27))
        categoryLabel.text = "사회에 관심이 많은 지식인"
        categoryLabel.textColor = .black
        categoryLabel.font = UIFont.boldSystemFont(ofSize: 18)
        categoryLabel.textAlignment = .left
        categoryLabel.numberOfLines = 1
        
        let timeIcon = UIImageView(frame: CGRect(x: 24, y:237, width: 28, height: 28))
        timeIcon.contentMode = .scaleAspectFit
        timeIcon.image = UIImage(systemName: "sun.max")
        timeIcon.tintColor = .black
        
        let categoryIcon = UIImageView(frame: CGRect(x: 24, y:480, width: 28, height: 28))
        categoryIcon.contentMode = .scaleAspectFit
        categoryIcon.image = UIImage(systemName: "newspaper")
        categoryIcon.tintColor = .black
        
        
        view.addSubview(timeLabel)
        view.addSubview(categoryLabel)
        view.addSubview(timeIcon)
        view.addSubview(categoryIcon)
    }
    func loadGraphImage(){
        let graphImg = "GraphAnalysis.png"
        let image = UIImage(named: graphImg)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 33, y: 303.4, width: 315, height: 140)
        view.addSubview(imageView)
    }
    func loadChartImage(){
        let chartImg = "ChartAnalysis.png"
        let image = UIImage(named: chartImg)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 115, y: 530, width: 170, height: 180)
        view.addSubview(imageView)
    }
}
