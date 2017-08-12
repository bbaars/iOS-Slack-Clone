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
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    // MARK: - Variables
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1.0]" // Default Light gray color
    var bgColor: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDataService.instance.avatarName != "" {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            
            if avatarName.contains("light") && bgColor == nil {
                userImage.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    func setupView() {
        
        activitySpinner.isHidden = true
        
        usernameText.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor: smackColor])
        emailText.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor: smackColor])
        passwordText.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: smackColor])
        
        // TAP gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    
    // MARK: - IBActions

    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
  
        guard let email = emailText.text , emailText.text != "" else { return }
        
        guard let pass = passwordText.text , passwordText.text != "" else { return }
        
        guard let name = usernameText.text , usernameText.text != "" else { return }
        
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            
            if success {
                
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    
                    if success {
                        
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            
                            if success {
                                
                                self.activitySpinner.isHidden = true
                                self.activitySpinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    }
                })
                
            } else {
                print("Could NOT register user")
            }
            
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBackgroundColorPressed(_ sender: Any) {
        
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        self.bgColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        avatarColor = "[\(r), \(g), \(b), 1.0]"
        
        UIView.animate(withDuration: 0.2) {
           self.userImage.backgroundColor = self.bgColor
        }
        
        
    }
    
    
    
}
