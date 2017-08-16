//
//  SocketService.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/13/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

    static let instance = SocketService()
    
    private override init() {
        super.init()
    }
    
    var socket : SocketIOClient = SocketIOClient(socketURL: URL(string: "\(BASE_URL)")!)
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func addChannel(name: String, description: String, completion: @escaping CompletionHandler) {
        
        socket.emit("newChannel", name, description)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        
        socket.on("channelCreated") { (dataArray, ack) in
            
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDesc = dataArray[1] as? String else { return }
            guard let channelID = dataArray[2] as? String else { return }
            
            let newChannel = Channel(id: channelID, name: channelName, description: channelDesc)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        
        let user = UserDataService.instance
        
        socket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        
        completion(true)
    }
    
    func getChatMessage(completion: @escaping CompletionHandler) {
        
        socket.on("messageCreated") { (dataArray, ack) in
            
            guard let msgBody = dataArray[0] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            guard let username = dataArray[3] as? String else { return }
            guard let userAvatar = dataArray[4] as? String else { return }
            guard let userAvatarColor = dataArray[5] as? String else { return }
            guard let messageId = dataArray[6] as? String else { return }
            guard let timeStamp = dataArray[7] as? String else { return }
            
            if channelId == MessageService.instance.seletedChannel?.id && AuthService.instance.isLoggedIn {
                let newMessage = Message(message: msgBody, username: username, channelID: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: messageId, timeStamp: timeStamp)
                MessageService.instance.messages.append(newMessage)
                
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    // Our closure returns a dictionary of type String : String
    func getTypingUsers(_ completionHandler: @escaping (_ typingUsers: [String:String]) -> Void) {
        
        socket.on("userTypingUpdate") { (dataArray, ack) in
            
            guard let typingUsers = dataArray[0] as? [String:String] else { return }
            
            completionHandler(typingUsers)
        }
    }
}















