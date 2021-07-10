//
//  TimelineVC.swift
//  NewsShell
//
//  Created by Jinwon Lee on 09/07/2021.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit

class TimelineVC: UIViewController {

    @IBAction func backToKeywordButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "TimelineBackSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
