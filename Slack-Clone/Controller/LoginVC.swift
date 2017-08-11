//
//  LoginVC.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/10/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func closePressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
        
    }
}
