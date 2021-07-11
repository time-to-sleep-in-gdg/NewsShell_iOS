//
//  SearchVC.swift
//  NewsShell
//
//  Created by Jinwon Lee on 09/07/2021.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UISearchBarDelegate {

    private let searchVC = UISearchController(searchResultsController: nil)
    
    lazy var buttonOne: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("코로나 기록 갱신", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        button.layer.shadowRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        return button
    }()
    lazy var buttonTwo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("택배 노조 파업", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        button.layer.shadowRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        return button
    }()
    lazy var buttonThree: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("비트코인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        button.layer.shadowRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        return button
    }()
    lazy var buttonFour: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("아이폰 13", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        button.layer.shadowRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        return button
    }()
    lazy var buttonFive: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("2022 대선", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        button.layer.shadowRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createSearchBar()
        createLabel() //create label
        setUpContraints() //create button
    }
    
    private func createSearchBar() {
        navigationItem.searchController = searchVC
        searchVC.searchBar.delegate = self
    }
    
    //Search
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else {
            return
        }
        navigationItem.hidesSearchBarWhenScrolling = false
        print(text)
    }
    
    private func createLabel() {
        let label = UILabel.init(frame: CGRect.init(x: 24, y: 70, width: 100, height: 200))
        label.text = "인기 키워드"
        label.textColor = .black
        view.addSubview(label)
        label.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    //button helper
    func setUpContraints(){
        view.addSubview(buttonOne)
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        buttonOne.heightAnchor.constraint(equalToConstant: 45).isActive = true
        buttonOne.widthAnchor.constraint(equalToConstant: 140).isActive = true
        buttonOne.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -520).isActive = true
        buttonOne.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        view.addSubview(buttonTwo)
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        buttonTwo.heightAnchor.constraint(equalToConstant: 45).isActive = true
        buttonTwo.widthAnchor.constraint(equalToConstant: 130).isActive = true
        buttonTwo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -520).isActive = true
        buttonTwo.leftAnchor.constraint(equalTo: buttonOne.rightAnchor, constant: 10).isActive = true
        
        view.addSubview(buttonThree)
        buttonThree.translatesAutoresizingMaskIntoConstraints = false
        buttonThree.heightAnchor.constraint(equalToConstant: 45).isActive = true
        buttonThree.widthAnchor.constraint(equalToConstant: 90).isActive = true
        buttonThree.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 10).isActive = true
        buttonThree.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        view.addSubview(buttonFour)
        buttonFour.translatesAutoresizingMaskIntoConstraints = false
        buttonFour.heightAnchor.constraint(equalToConstant: 45).isActive = true
        buttonFour.widthAnchor.constraint(equalToConstant: 90).isActive = true
        buttonFour.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 10).isActive = true
        buttonFour.leftAnchor.constraint(equalTo: buttonThree.rightAnchor, constant: 10).isActive = true
        
        view.addSubview(buttonFive)
        buttonFive.translatesAutoresizingMaskIntoConstraints = false
        buttonFive.heightAnchor.constraint(equalToConstant: 45).isActive = true
        buttonFive.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buttonFive.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 10).isActive = true
        buttonFive.leftAnchor.constraint(equalTo: buttonFour.rightAnchor, constant: 10).isActive = true
    }
}
