//
//  ViewController.swift
//  WowTest
//
//  Created by Tom Hays on 29/10/2018.
//  Copyright © 2018 Msk. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    let sessionHandler = OAuth2Object()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func SignInButton(_ sender: UIButton) {
        sessionHandler.handleSignIn()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
}

