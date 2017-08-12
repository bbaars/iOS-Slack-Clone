//
//  UserDataService.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/11/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import Foundation


class UserDataService {
    
    static let instance = UserDataService()
    
    // public 'getter' private 'setter'
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserDataService(id: String, color: String, avatarName: String, email :String, name: String) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
}
