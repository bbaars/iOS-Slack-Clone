//
//  MessageService.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/12/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    var unreadChannels = [String]()
    var messages = [Message]()
    var seletedChannel: Channel?
    
    func findAllChannels(completion: @escaping CompletionHandler) {
        
        Alamofire.request(URL_GET_CHANNEL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER)
        
            .responseJSON { (response) in
                
                if response.result.error == nil {
                    
                    guard let data = response.data else { return }
                    
                    // SWIFT 4 Way to Obtain JSON
//                    do {
//                        self.channels = try JSONDecoder().decode([Channel].self, from: data)
//                    } catch let error {
//                        debugPrint(error)
//                    }
                    
                    if let json = JSON(data: data).array {

                        for item in json {
                            let name = item["name"].stringValue
                            let channelDescription = item["description"].stringValue
                            let id = item["_id"].stringValue
                            let channel = Channel(id: id, name: name, description: channelDescription)
                            self.channels.append(channel)
                        }
                    }
                    
                    NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                    completion(true)
                    
                } else {
                    completion(false)
                    print(response.result.error as Any)
                }
        }
    }
    
    func findAllMessagesForChannel(channelId: String, completion: @escaping CompletionHandler) {
        
        Alamofire.request("\(URL_GET_MESSAGES)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER)
        
            .responseJSON { (response) in
                
                if response.result.error == nil {
                    
                    self.clearMessages()
                    
                    guard let data = response.data else { return }
                    
                    if let json = JSON(data: data).array {
                        
                        for item in json {
                            
                            let messageBody = item["messageBody"].stringValue
                            let channelId  = item["channelId"].stringValue
                            let id = item["_id"].stringValue
                            let username = item["userName"].stringValue
                            let userAvatar = item["userAvatar"].stringValue
                            let userAvatarColor = item["userAvatarColor"].stringValue
                            let timeStamp = item["timeStamp"].stringValue
                            
                            self.messages.append(Message(message: messageBody, username: username, channelID: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp))
                        }
                    }
                    completion(true)
                    
                } else {
                    debugPrint(response.result.error as Any)
                    completion(false)
                }
                
        }
    }
    
    
    func clearChannels() {
        channels.removeAll()
    }
    
    func clearMessages() {
        messages.removeAll()
    }
}





















