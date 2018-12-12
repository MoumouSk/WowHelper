//
//  MainViewController.swift
//  WowHelper
//
//  Created by Tom Hays on 11/12/2018.
//  Copyright © 2018 Msk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var token = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (!token) {
            performSegue(withIdentifier: "showAuth", sender: self)
        }
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
