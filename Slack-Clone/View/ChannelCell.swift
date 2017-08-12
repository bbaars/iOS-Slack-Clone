//
//  ChannelCell.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/12/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    
    @IBOutlet weak var channelName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    // for rows in the view that are selected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            self.layer.backgroundColor = UIColor.init(white: 1.0, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel) {
        
        let title = channel.name ?? ""
        
        channelName.text = "#\(title)"
    }

}
