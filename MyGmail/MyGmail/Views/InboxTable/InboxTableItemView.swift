/* * Copyright 2023 Simon Zhang. All rights reserved. */

import SwiftUI

struct InboxTableItemView: View {
    private let profilePictureFrameWidth = GmailSize.defaultSext

    var mail: InboxMails.Mail
    var starOnTapped: () -> Void
    var chevronOnTapped: () -> Void

    var body: some View {
        HStack {
            profilePictureThumbnail(with: mail)
            Spacer()

            HStack {
                VStack(alignment: .leading) {
                    // MARK: Important Icon

                    HStack {
                        GmailIcons.importantIcon
                            .font(GmailFont.defaultFont)
                            .fontWeight(mail.isImportant ? .bold : .regular)
                            .foregroundColor(mail.isImportant ? Color.yellow : GmailColor.gray)
                            .onTapGesture {
                                chevronOnTapped()
                            }
                        Spacer()
                            .frame(width: GmailSize.defaultHalf)
                        Text(mail.sender)
                            .foregroundColor(mail.isUnread ? .black : GmailColor.gray)
                            .font(GmailFont.defaultFont2)
                            .fontWeight(mail.isUnread ? .heavy : .regular)
                    }

                    Spacer(minLength: GmailSize.defaultHalf)

                    Text(mail.subject)
                        .font(GmailFont.defaultFont)
                        .fontWeight(mail.isUnread ? .bold : .regular)
                        .foregroundColor(mail.isUnread ? .black : GmailColor.gray)

                    Spacer(minLength: 0)

                    Text(mail.content)
                        .font(GmailFont.defaultFont)
                        .lineLimit(1)
                        .fontWeight(mail.isUnread ? .regular : .light)
                        .foregroundColor(.gray)
                }

                VStack(alignment: .trailing) {
                    Text(mail.time)
                        .foregroundColor(.gray)
                        .font(GmailFont.defaultFont)

                    Spacer()

                    Image(systemName: mail.isStarred ? "star.fill" : "star")
                        .foregroundColor(mail.isStarred ? Color.blue : Color.gray)
                        .font(GmailFont.defaultFont2)
                        .onTapGesture {
                            starOnTapped()
                        }
                }
            }
        }
    }

    @ViewBuilder
    func profilePictureThumbnail(with mail: InboxMails.Mail) -> some View {
        if let profilePictureName = mail.profilePicture {
            Image(profilePictureName)
                .resizable()
                .scaledToFill()
                .frame(
                    width: profilePictureFrameWidth,
                    height: profilePictureFrameWidth)
                .clipShape(Circle())
                .frame(width: 50)
        } else {
            let placeHolder = String(mail.sender.first ?? Character(""))
            Circle()
                .fill(mail.defaultColor)
                .frame(
                    width: profilePictureFrameWidth,
                    height: profilePictureFrameWidth)
                .overlay {
                    Text("\(placeHolder)")
                        .font(GmailFont.defaultLargeProfile)
                        .foregroundColor(.white)
                }
                .frame(width: 50)
        }
    }
}

struct InboxTableItemView_Previews: PreviewProvider {
    static var previews: some View {
        InboxTableItemView(
            mail: InboxMailsViewModel().mails[5],
            starOnTapped: {},
            chevronOnTapped: {})
            .frame(height: 50)
    }
}
