//
//  MyPageVC.swift
//  NewsShell
//
//  Created by Jinwon Lee on 09/07/2021.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit

class MyPageVC: UIViewController {
    
    lazy var subsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("프리미엄 이용권", for: .normal)
//        button.titleLabel?.lineBreakMode = .byWordWrapping //multi-line button
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.shadowRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 247.0 / 255.0, green: 209.0 / 255.0, blue: 165.0 / 255.0, alpha: 1.0)
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        button.titleEdgeInsets.left = 15 //add paddings
        button.titleEdgeInsets.right = 15 //add paddings
        button.titleEdgeInsets.top = 10 //add paddings
        button.titleEdgeInsets.bottom = 10 //add paddings
        return button
    }()
    
    lazy var listButton1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("프리미엄 이용권", for: .normal)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        return button
    }()
    
    lazy var listButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("내 키워드 관리", for: .normal)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        return button
    }()
    
    lazy var listButton3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("알림 설정", for: .normal)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        return button
    }()
    
    lazy var listButton4: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("고객센터", for: .normal)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        return button
    }()
    
    lazy var listButton5: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("이벤트", for: .normal)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false) //hide top bar
        createProfile()
        createSubsButton()
        createListButtons()
    }
    
    
    private func createProfile() {
        let profileIcon = UIImageView(frame: CGRect(x: 153, y:100, width: 70, height: 70))
        profileIcon.contentMode = .scaleAspectFit
        profileIcon.image = UIImage(systemName: "circle.fill")
        profileIcon.tintColor = .gray
        
        let profileLabel = UILabel.init(frame: CGRect.init(x: 146.5, y: 178, width: 70, height: 29))
        profileLabel.text = "어피치님"
        profileLabel.textColor = .black
        profileLabel.font = UIFont.boldSystemFont(ofSize: 20)
        profileLabel.textAlignment = .left
        profileLabel.numberOfLines = 1
        
        let preferenceIcon = UIImageView(frame: CGRect(x: 218, y:182, width: 20, height: 20))
        preferenceIcon.contentMode = .scaleAspectFit
        preferenceIcon.image = UIImage(systemName: "gearshape")
        preferenceIcon.tintColor = .lightGray
        
        view.addSubview(profileIcon)
        view.addSubview(profileLabel)
        view.addSubview(preferenceIcon)
    }
    
    func createSubsButton() {
        view.addSubview(subsButton)
        subsButton.translatesAutoresizingMaskIntoConstraints = false
        subsButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        subsButton.widthAnchor.constraint(equalToConstant: 327).isActive = true
        subsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 185).isActive = true
        subsButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        
        //segue to subscription page
        subsButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        let subsButtonLabel = UILabel.init(frame: CGRect.init(x: 44, y: 277, width: 180, height: 20))
        subsButtonLabel.text = "2021년 07월 15일에 결제 예정"
        subsButtonLabel.textColor = .lightGray
        subsButtonLabel.font = UIFont.boldSystemFont(ofSize: 14)
        subsButtonLabel.textAlignment = .left
        subsButtonLabel.numberOfLines = 1
        view.addSubview(subsButtonLabel)
        
        let subsIcon = UIImageView(frame: CGRect(x: 319, y:262, width: 15, height: 15))
        subsIcon.contentMode = .scaleAspectFit
        subsIcon.image = UIImage(systemName: "chevron.right")
        subsIcon.tintColor = .gray
        view.addSubview(subsIcon)
    }
    
    func createListButtons() {
        view.addSubview(listButton1)
        listButton1.translatesAutoresizingMaskIntoConstraints = false
        listButton1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        listButton1.widthAnchor.constraint(equalToConstant: 420).isActive = true
        listButton1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 295).isActive = true
        listButton1.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 35).isActive = true
        
        //segue (implement later!)
//        listButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        let arrowIcon1 = UIImageView(frame: CGRect(x: 319, y:355, width: 15, height: 15))
        arrowIcon1.contentMode = .scaleAspectFit
        arrowIcon1.image = UIImage(systemName: "chevron.right")
        arrowIcon1.tintColor = .gray
        view.addSubview(arrowIcon1)
        
        //----------------
        
        view.addSubview(listButton2)
        listButton2.translatesAutoresizingMaskIntoConstraints = false
        listButton2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        listButton2.widthAnchor.constraint(equalToConstant: 420).isActive = true
        listButton2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 345).isActive = true
        listButton2.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 35).isActive = true
        
        //segue (implement later!)
//        listButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        let arrowIcon2 = UIImageView(frame: CGRect(x: 319, y:402, width: 15, height: 15))
        arrowIcon2.contentMode = .scaleAspectFit
        arrowIcon2.image = UIImage(systemName: "chevron.right")
        arrowIcon2.tintColor = .gray
        view.addSubview(arrowIcon2)
        
        //----------------
        
        view.addSubview(listButton3)
        listButton3.translatesAutoresizingMaskIntoConstraints = false
        listButton3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        listButton3.widthAnchor.constraint(equalToConstant: 420).isActive = true
        listButton3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 395).isActive = true
        listButton3.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 35).isActive = true
        
        //segue (implement later!)
//        listButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        let arrowIcon3 = UIImageView(frame: CGRect(x: 319, y:449, width: 15, height: 15))
        arrowIcon3.contentMode = .scaleAspectFit
        arrowIcon3.image = UIImage(systemName: "chevron.right")
        arrowIcon3.tintColor = .gray
        view.addSubview(arrowIcon3)
        
        //----------------
        
        view.addSubview(listButton4)
        listButton4.translatesAutoresizingMaskIntoConstraints = false
        listButton4.heightAnchor.constraint(equalToConstant: 40).isActive = true
        listButton4.widthAnchor.constraint(equalToConstant: 420).isActive = true
        listButton4.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 445).isActive = true
        listButton4.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 35).isActive = true
        
        //segue (implement later!)
//        listButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        let arrowIcon4 = UIImageView(frame: CGRect(x: 319, y:503, width: 15, height: 15))
        arrowIcon4.contentMode = .scaleAspectFit
        arrowIcon4.image = UIImage(systemName: "chevron.right")
        arrowIcon4.tintColor = .gray
        view.addSubview(arrowIcon4)
        
        //----------------
        
        view.addSubview(listButton5)
        listButton5.translatesAutoresizingMaskIntoConstraints = false
        listButton5.heightAnchor.constraint(equalToConstant: 40).isActive = true
        listButton5.widthAnchor.constraint(equalToConstant: 420).isActive = true
        listButton5.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 495).isActive = true
        listButton5.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 35).isActive = true
        
        //segue (implement later!)
//        listButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        let arrowIcon5 = UIImageView(frame: CGRect(x: 319, y:550, width: 15, height: 15))
        arrowIcon5.contentMode = .scaleAspectFit
        arrowIcon5.image = UIImage(systemName: "chevron.right")
        arrowIcon5.tintColor = .gray
        view.addSubview(arrowIcon5)
    }
    
    
    @objc private func buttonClicked(sender: AnyObject?) {
        if sender === subsButton {
          // do something
            let vc = SubscriptionVC()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            present(vc, animated: true)
        }
    }
}
