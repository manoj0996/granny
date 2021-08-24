//
//  Constants.swift
//  My Granny
//
//  Created by Sedenion technologies on 11/05/2020.
//  Copyright © 2020 Sedenion technologies. All rights reserved.
//

struct K {
    static let appName = "My Granny"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToHome"
    static let loginSegue = "LoginToHome"
    
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
