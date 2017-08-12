//
//  ProfileVC.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/12/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        usernameLabel.text = UserDataService.instance.name
        emailLabel.text = UserDataService.instance.email
        profileImage.layer.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor).cgColor
        
        // Tap Gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.dismissView(_:)))
        backgroundView.addGestureRecognizer(tap)
    }
    
    @objc func dismissView(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }


    // MARK: - IBActions
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
}
