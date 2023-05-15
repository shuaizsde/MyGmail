//
//  GmailSize.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/15/23.
//

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

struct GmailFont {
    
    public static let defaultSmall = Font.custom( "default", size: 10)
    
    public static let defaultFont = Font.custom( "default", size: GmailSize.defaultFont)
    public static let defaultFont2 = Font.custom( "default", size: GmailSize.defaultFont2)
    public static let defaultLargeProfile = Font.custom( "default", size: GmailSize.defaultQuad)
}
