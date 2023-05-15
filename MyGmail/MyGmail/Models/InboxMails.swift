//
//  InboxMails.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import Foundation
import SwiftUI


struct InboxMails {
    
    private(set) var mails: Array<Mail>
    
    init(_ mails: Array<Mail>) {
        self.mails = mails
    }
    
    struct Mail: Identifiable {
        let id = UUID()
        var profilePicture: String?
        var defaultColor = Color.random()
        let sender: String
        let time: String
        let subject: String
        let content: String
        
        var isUnread = false
        
        var isStarred = false
        var isImportant = false
        var attachments: [(String,String)]? // <Type: Name>
    } 
    
    mutating func star(_ mail: Mail) {
        let chosenIndex = mails.firstIndex(where: {$0.id == mail.id})
        mails[chosenIndex!].isStarred = !mail.isStarred
        var count = 0
        // Test Use
        for mail in mails {
            if mail.isStarred {
                count += 1
            }
        }
        print(count)
        print("------------")
    }
    
    mutating func important(_ mail: Mail) {
        let chosenIndex = mails.firstIndex(where: {$0.id == mail.id})
        mails[chosenIndex!].isImportant = !mail.isImportant
    }
}
