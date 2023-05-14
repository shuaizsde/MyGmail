//
//  EmailBodyView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import SwiftUI

struct EmailBodyView: View {
    let mail: InboxMails.Mail
    var profilePictureFrameWidth = 40.0
    var body: some View {
        //Color.red
        VStack(alignment: .leading) {
            titleSection
            Spacer().frame(height: 20)
            senderSection
            Spacer().frame(height: 30)
            Text(mail.content).font(.body)
                Spacer()
        }
        .padding()
//        Spacer()
    }
}
extension EmailBodyView {

    private var senderSection: some View {
        HStack {
            profilePictureThumbnail(with: mail)
            VStack(alignment: .leading) {
                HStack {
                    Text("\(mail.sender)").font(.body)
                    Text("\(mail.time)").font(.body)
                }
                Text("to me").font(.caption2)
            }
            Spacer()
            Image(systemName: "return")
            Spacer().frame(width: 20)
            Image(systemName: "ellipsis")

        }
    }
    private var titleSection: some View {
        HStack() {
            Text(mail.subject).font(.title2)
            Spacer()
            Image(systemName: "star")
        }
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
                    Text("\(placeHolder)").font(.custom( "default", size: 30)).foregroundColor(.white)
                }.frame(width: 60)
        }
    }
    
}

struct EmailBodyView_Previews: PreviewProvider {
    static var previews: some View {
        EmailBodyView(mail: InboxMailsViewModel().mails[0])
    }
}
