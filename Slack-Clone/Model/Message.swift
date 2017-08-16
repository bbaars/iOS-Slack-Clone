//
//  Message.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/13/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import Foundation


struct Message {
    
    public private(set) var message: String!
    public private(set) var username: String!
    public private(set) var channelID: String!
    public private(set) var userAvatar: String!
    public private(set) var userAvatarColor: String!
    public private(set) var id: String!
    public private(set) var timeStamp: String!
}
