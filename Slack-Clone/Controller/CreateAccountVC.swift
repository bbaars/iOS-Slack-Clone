//
//  CreateAccountVC.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/10/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions

    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        
        guard let email = emailText.text , emailText.text != "" else { return }
        
        guard let pass = passwordText.text , passwordText.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            
            if success {
                print("Successfully registered user")
                
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    
                    if success {
                        print("Logged in user ", AuthService.instance.authToken)
                    }
                    
                })
                
            } else {
                print("Could NOT register user")
            }
            
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func pickBackgroundColorPressed(_ sender: Any) {
    }
    
    
    
}
