//
//  InboxMails.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import Foundation
import SwiftUI

struct InboxMails {
    private(set) var mails: [Mail]

    init(_ mails: [Mail]) {
        self.mails = mails
    }

    struct Mail: Identifiable {
        let id = UUID()
        var profilePicture: String?
        var defaultColor = Color.randomColor()
        let sender: String
        let time: String
        let subject: String
        let content: String

        var isUnread = true

        var isPrimary = false
        var isSocial = false
        var isPromotions = false
        var isStarred = false
        var isSnoozed = false
        var isImportant = false
        var isSent = false
        var isScheduled = false
        var isDraft = false
        var isSpam = false
        var isTrash = false
        var isArchived = false

        var attachments: [(String, String)]? // <Type: Name>
    }

    mutating func star(_ mail: Mail) {
        let chosenIndex = mails.firstIndex(where: { $0.id == mail.id })
        mails[chosenIndex!].isStarred = !mail.isStarred
    }

    mutating func important(_ mail: Mail) {
        let chosenIndex = mails.firstIndex(where: { $0.id == mail.id })
        mails[chosenIndex!].isImportant = !mail.isImportant
    }

    mutating func archive(_ mail: Mail) {
        let chosenIndex = mails.firstIndex(where: { $0.id == mail.id })
        mails[chosenIndex!].isArchived = true
    }

    mutating func read(_ mail: Mail) {
        let chosenIndex = mails.firstIndex(where: { $0.id == mail.id })
        mails[chosenIndex!].isUnread = false
    }
}

extension Color {
    static func randomColor() -> Color {
        Color(
            red: Double.random(in: 0 ... 1),
            green: Double.random(in: 0.2 ... 1),
            blue: Double.random(in: 0.3 ... 1)
        )
    }
}
