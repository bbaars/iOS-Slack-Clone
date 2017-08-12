//
//  ChatVC.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/9/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var menuButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        // slide out the menu based on your thumb position on the screen
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // tap on previous screen to dismiss the controller
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                if success {
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                }
            })
        }
        
        MessageService.instance.findAllChannels { (success) in
            
            
            
        }
    }
}
