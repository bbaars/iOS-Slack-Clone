//
//  MessageCell.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/13/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var messageBodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureCell(message: Message) {
        
        messageBodyLabel.text = message.message
        userNameLabel.text = message.username
        userImage.image = UIImage(named: message.userAvatar)
        userImage.layer.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor).cgColor
    }

}
