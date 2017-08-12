//
//  ChannelVC.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/9/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var loginButton: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // take up all the screen except for 60 pixels
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        setupUserInfo()
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
       setupUserInfo()
    }
    
    func setupUserInfo() {
        if AuthService.instance.isLoggedIn {
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.layer.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor).cgColor
        } else {
            loginButton.setTitle("Login", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    // MARK: - Table View Protocol
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell") as? ChannelCell {
            
            cell.configureCell(channel: MessageService.instance.channels[indexPath.row])
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
    // MARK: - IBActions
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if AuthService.instance.isLoggedIn {
            
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
            
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    @IBAction func addChannelPressed(_ sender: Any) {
        
        let addChannel = AddChannelVC()
        
        addChannel.modalPresentationStyle = .custom
        present(addChannel, animated: true, completion: nil)
    }
}






















