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

class HomeVC: TabmanViewController {

    private var viewControllers = [UIViewController]()
    private var category = ["실시간","정치","경제","사회","문화","IT"]
    
    @IBAction func keywordButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "TimelineSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        embeddViewControllers()
        setNavigationBar()
        setTabbar()
        setTopTabbar()
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
    
    func embeddViewControllers(){
        for keyword in category {
            let vc = UIStoryboard.init(name: "main", bundle: nil).instantiateViewController(withIdentifier: "KeywordsVC") as! KeywordsVC
            vc.keyword = keyword
            viewControllers.append(vc)
        }
    }
    
    func setTopTabbar(){
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.layout.contentInset  = UIEdgeInsets(top: 100.0, left: 0.0, bottom: 0.0, right: 0.0)
        bar.layout.transitionStyle = .snap
        bar.backgroundView.style = .clear
        bar.indicator.tintColor = .label
        bar.buttons.customize{ $0.selectedTintColor = .label }
        
        addBar(bar, dataSource: self, at: .top)
        bar.layer.addBorder([.bottom], color: #colorLiteral(red: 0.7685618401, green: 0.768670857, blue: 0.7685275674, alpha: 1), width: 0.3)
    }
    
    func setTabbar() {
        self.tabBarController!.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBarController?.tabBar.clipsToBounds = true
    }

}

extension HomeVC: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let indexViewController = viewControllers[index] as! KeywordsVC
        let item = TMBarItem(title: "")
        item.title = indexViewController.keyword + "      "
        
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
