//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by owner on 4/2/20.
//  Copyright © 2020 Yogi Chandra. All rights reserved.
//

struct Constants {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerRoute = "register"
    static let loginRoute = "login"
    static let registerToChat = "chatRegister"
    static let loginToChat = "chat"
    
    struct BrandColors {
           static let purple = "BrandPurple"
           static let lightPurple = "BrandLightPurple"
           static let blue = "BrandBlue"
           static let lighBlue = "BrandLightBlue"
       }
       
    struct FStore {
           static let collectionName = "messages"
           static let senderField = "sender"
           static let bodyField = "body"
           static let dateField = "date"
    }
}

