//
//  AddChannelVC.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/12/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.dismissView(_:)))
        self.backgroundView.addGestureRecognizer(tap)
        
        nameText.attributedPlaceholder = NSAttributedString(string: "Channel Name", attributes: [NSAttributedStringKey.foregroundColor: smackColor])
        descriptionText.attributedPlaceholder = NSAttributedString(string: "Channel Description", attributes: [NSAttributedStringKey.foregroundColor: smackColor])
    }
    
    @objc func dismissView(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }


    // MARK: - IBActions
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelButtonPressed(_ sender: Any) {
    
        guard let channelName = nameText.text , nameText.text != "" else { return }
        guard let channelDesc = descriptionText.text else { return }
        
        SocketService.instance.addChannel(name: channelName, description: channelDesc) { (success) in
            
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
