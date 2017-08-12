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
                } else {
                    completion(false)
                    print(response.result.error as Any)
                }
                
        }
    }
}
