//
//  EmailBodyView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import SwiftUI

struct EmailBodyView: View {
    let mail: InboxMails.Mail
    
    // Sizes
    let defaultIconFont = Font.custom( "default", size: 14)
    var profilePictureFrameWidth = 40.0
    var defaultSpacing = 20.0
    
    // Static Strings
    let toMe = "to me"
    
    // Icon 
    let returnIcon = "return"
    let ellipsisIcon = "ellipsis"
    let starIcon = "star"
    let defaultIconColor = Color("gmailGray")
    
    
    var body: some View {
        //Color.red
        VStack(alignment: .leading) {
            titleSection
            Spacer().frame(height: defaultSpacing)
            senderSection
            Spacer().frame(height: defaultSpacing)
            Text(mail.content)
                .font(16)
                .lineSpacing(8)
                .opacity(0.6)
            Spacer()
        }
        .padding()
    }
}
extension EmailBodyView {

    private var senderSection: some View {
        HStack {
            profilePictureThumbnail(with: mail)
            VStack(alignment: .leading) {
                HStack {
                    Text("\(mail.sender)").font(.body)
                    Text("\(mail.time)").font(.caption)
                }
                Text(toMe).font(.caption2)
            }
            Spacer()
            Button(action: {} ,label: {Image(systemName: returnIcon)})
                .font(defaultIconFont)
            Spacer().frame(width: defaultSpacing)
            Button(action: {} ,label: {Image(systemName: ellipsisIcon)})
                .font(defaultIconFont)

        }.foregroundColor(defaultIconColor)
    }
    private var titleSection: some View {
        HStack() {
            Text(mail.subject)
                .font(.title2)
            Spacer()
            Button(action: {} ,label: {Image(systemName: starIcon)})
                .font(defaultIconFont)
                .foregroundColor(defaultIconColor)
        }.opacity(0.7)
    }
    
    @ViewBuilder func profilePictureThumbnail(with mail: InboxMails.Mail?)  -> some View {
        if let profilePictureName = mail?.profilePicture  {
            Image(profilePictureName)
                .resizable()
                .scaledToFill()
                .cornerRadius(profilePictureFrameWidth)
                .frame(width: profilePictureFrameWidth, height: profilePictureFrameWidth)
                .cornerRadius(profilePictureFrameWidth)
                .frame(width: profilePictureFrameWidth)
        } else {
            let placeHolder = String(mail?.sender.first ?? Character(""))
            Circle()
                .fill(mail?.defaultColor ?? .white)
                .frame(width: profilePictureFrameWidth, height: profilePictureFrameWidth)
                .overlay() {
                    Text("\(placeHolder)").font(30).foregroundColor(.white)
                }.frame(width: profilePictureFrameWidth)
        }
    }
    
}

extension Text {
    func font(_ width: CGFloat) -> Text {
        return self.font(.custom( "default", size: width))
    }
}

struct EmailBodyView_Previews: PreviewProvider {
    static var previews: some View {
        EmailBodyView(mail: InboxMailsViewModel().mails[0])
    }
}
