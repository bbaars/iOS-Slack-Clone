//
//  Channel.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/12/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import Foundation

// SWIFT 4 For obtaining JSON, variable names must be same as JSON response and all must be there
//struct Channel: Decodable {
//    public private(set) var _id: String!
//    public private(set) var name: String!
//    public private(set) var description: String!
//    public private(set) var __v: Int?
//}

struct Channel{
    public private(set) var id: String!
    public private(set) var name: String!
    public private(set) var description: String!
}
