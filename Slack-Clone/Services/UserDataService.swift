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
    
    func returnUIColor(components: String) -> UIColor {
        
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        
        scanner.charactersToBeSkipped = skipped
        
        var red, green, blue : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &red)
        scanner.scanUpToCharacters(from: comma, into: &green)
        scanner.scanUpToCharacters(from: comma, into: &blue)
        
        let defaultColor = UIColor.lightGray
        
        guard let redUnwrapped = red else { return defaultColor }
        guard let greenUnwrapped = green else { return defaultColor }
        guard let blueUnwrapped = blue else { return defaultColor }
        
        let redFloat = CGFloat(redUnwrapped.doubleValue)
        let greenFloat = CGFloat(greenUnwrapped.doubleValue)
        let blueFloat = CGFloat(blueUnwrapped.doubleValue)
        
        return UIColor(red: redFloat, green: greenFloat, blue: blueFloat, alpha: 1.0)
    }
    
    func logoutUser() {
        
        id = ""
        avatarColor = ""
        avatarName = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
        MessageService.instance.clearChannels()
        MessageService.instance.clearMessages()
    }
}













