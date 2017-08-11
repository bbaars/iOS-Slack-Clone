//
//  Constants.swift
//  Slack-Clone
//
//  Created by Brandon Baars on 8/9/17.
//  Copyright © 2017 Brandon Baars. All rights reserved.
//

import Foundation

// MARK: - Type Alias

typealias CompletionHandler = (_ Success: Bool) -> ()

// MARK: - URL Constants

let BASE_URL =  "https://slack-clone-chat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"


// MARK: - Segues

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"


// MARK: - User Defaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// MARK: - Headers

let HEADER = [
    "Content-type": "application/json; charset=utf-8"
]

