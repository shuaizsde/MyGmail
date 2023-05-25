/* * Copyright 2023 Simon Zhang. All rights reserved. */

import Foundation
import SwiftUI

struct GmailSize {
    public static let defaultHalf: CGFloat = 4.0
    public static let defaultSingle: CGFloat = 8.0
    public static let defaultDouble: CGFloat = 16.0
    public static let defaultTripple: CGFloat = 24.0
    public static let defaultQuad: CGFloat = 32.0
    public static let defaultPenta: CGFloat = 40.0
    public static let defaultSext: CGFloat = 48

    public static let defaultFont: CGFloat = 12.0
    public static let defaultFont2: CGFloat = 14.0
}

enum GmailFont {
    // Text("Hello").font(.system(size: 36, weight: .semibold))
    public static let defaultSmall = Font.system(size: 10)

    public static let defaultFont = Font.system(size: GmailSize.defaultFont)
    public static let defaultFont2 = Font.system(size: GmailSize.defaultFont2)

    public static let defaultDouble = Font.system(size: GmailSize.defaultDouble)
    public static let defaultTriple = Font.system(size: GmailSize.defaultTripple)
    public static let defaultLargeProfile = Font.system(size: GmailSize.defaultQuad)
}

enum GmailColor {
    public static let red = Color("gmailRed")
    public static let green = Color("gmailGreen")
    public static let gray = Color("gmailGray")
    public static let textGray = Color("gmailTextGray")
}

enum GmailIcons {
    static let gmailIcon = Image("gmail")
    static let backButtonIcon = Image(systemName: "chevron.left")
    static let envelopeIcon = Image(systemName: "envelope")
    static let videoIcon = Image(systemName: "video")
    static let chevronDownIcon = Image(systemName: "chevron.down")
    static let swipeDownIcon = Image(systemName: "square.and.arrow.down")
    static let trashIcon = Image(systemName: "trash")
    static let composeButtonIcon = Image(systemName: "pencil")

    static let importantIcon = Image(systemName: "chevron.right.2")

    static let returnIcon = Image(systemName: "return")
    static let ellipsisIcon = Image(systemName: "ellipsis")
    static let starIcon = Image(systemName: "star")
    static let starIconFill = Image(systemName: "star.fill")
    static let replyIcon = Image(systemName: "return.left")
    static let forwardIcon = Image(systemName: "return.right")

    static let menuIconArchived = Image(systemName: "square.and.arrow.down")
    static let personArchived = Image(systemName: "person.fill")
}

enum GmailStrings {
    static let searchbarPlaceHolder = "Search in mail"
    static let composeButton = "Compose"
    static let toMe = "to me"
    static let replyText = "Reply"
    static let forwardText = "Forward"
}
