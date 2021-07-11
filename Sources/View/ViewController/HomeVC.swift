//
//  ViewController.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/08.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit
import Tabman
import Pageboy
import RxSwift
import RxCocoa

class HomeVC: TabmanViewController {

    private var viewModel = MainViewModel()
    private var disposeBag = DisposeBag()
    private var viewControllers = [UIViewController]()
    private var categorys = [String]()
    private let bar = TMBar.ButtonBar()
    
    @IBOutlet weak var alarmBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        setNavigationBar()
        setTopTabbar()
        setTabbar()
    }
    
    func bind() {
        let input = MainViewModel.Input()
        let output = viewModel.transform(input)
        
        output.alarmCount.subscribe(onNext: {
            print($0)
            self.tabBarItem.badgeValue = "\($0)"
        })
        .disposed(by: disposeBag)
        
        output.categoryList.subscribe(onNext: { category in
            output.keywordList.subscribe(onNext: { keywords in
                self.categorys.append("전체")
                let vc = UIStoryboard.init(name: "main", bundle: nil).instantiateViewController(withIdentifier: "KeywordsVC") as! KeywordsVC
                for keyword in keywords {
                    vc.keywords += keyword
                }
                self.viewControllers.append(vc)
                for item in category {
                    self.categorys.append(item.category_name)
                    let vc = UIStoryboard.init(name: "main", bundle: nil).instantiateViewController(withIdentifier: "KeywordsVC") as! KeywordsVC
                    vc.keywords = keywords[category.firstIndex(of: item)!]
                    self.viewControllers.append(vc)
                }
                self.reloadData()
                self.bar.layer.addBorder([.bottom], color: #colorLiteral(red: 0.7685618401, green: 0.768670857, blue: 0.7685275674, alpha: 1), width: 0.3)
            })
            .disposed(by: self.disposeBag)
        })
        .disposed(by: disposeBag)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
    }
    
    func setNavigationBar(){
        navigationController?.navigationBar.standardAppearance.shadowColor = .white
        navigationController?.navigationBar.standardAppearance.backgroundColor = .white
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        for sview in navigationBar.subviews {
            for ssview in sview.subviews {
                guard let label = ssview as? UILabel else { break }
                if label.text == self.title {
                    label.numberOfLines = 0
                    label.lineBreakMode = .byWordWrapping
                    label.sizeToFit()
                    UIView.animate(withDuration: 0.3, animations: {
                        navigationBar.frame.size.height = 57 + label.frame.height
                    })
                }
            }
        }
    }
    
    func setTopTabbar(){
        self.dataSource = self
        bar.layout.contentInset  = UIEdgeInsets(top: 100.0, left: 0.0, bottom: 0.0, right: 0.0)
        bar.layout.transitionStyle = .snap
        bar.backgroundView.style = .clear
        bar.indicator.tintColor = .label
        bar.buttons.customize{ $0.selectedTintColor = .label }
        
        addBar(bar, dataSource: self, at: .top)
    }
    
    func setTabbar() {
        self.tabBarController!.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBarController?.tabBar.clipsToBounds = true
    }

}

extension HomeVC: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        item.title = categorys[index] + "          "
        
        return item
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
