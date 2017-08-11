//
//  CreateAccountVC.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/10/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
