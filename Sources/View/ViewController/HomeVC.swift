//
//  ViewController.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/08.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBAction func keywordButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "TimelineSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("View has loaded")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
