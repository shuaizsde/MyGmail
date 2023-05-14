//
//  InboxMails.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import Foundation

enum MailCatagory {
    case none
    case social
    case promotion
    case primary
    case spam
    
}
struct InboxMails {
    
    private(set) var mails: Array<Mail>
    
    init(_ mails: Array<Mail>) {
        self.mails = mails
    }
    
    struct Mail: Identifiable {
        let id = UUID()
        var profilePicture: String?
        let sender: String
        let time: String
        let subject: String
        let content: String
        
        var isStarred = false
        
        // For extra upcoming fancy crazy features
        var isUnread = false
        var attachments: [(String,String)]? // <Type: Name>
        var catagory: MailCatagory = .none
        
    } 
    
    mutating func star(_ mail: Mail) {
        let chosenIndex = mails.firstIndex(where: {$0.id == mail.id})
        mails[chosenIndex!].isStarred = !mail.isStarred
    }
}
