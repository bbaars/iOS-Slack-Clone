//
//  LoginVC.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/10/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        
        activitySpinner.isHidden = true
        
        usernameText.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor: smackColor])
        passwordText.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: smackColor])
    }


    @IBAction func closePressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        
        guard let email = usernameText.text , usernameText.text != "" else { return }
        guard let password = passwordText.text , passwordText.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.activitySpinner.stopAnimating()
                        self.activitySpinner.isHidden = true
                        self.dismiss(animated: true, completion: nil)
                    }
                    
                })
            }
            
        }
        
        
    }
}
