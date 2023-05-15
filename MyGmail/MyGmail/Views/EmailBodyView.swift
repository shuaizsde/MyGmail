//
//  EmailBodyView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import SwiftUI

struct EmailBodyView: View {
    let mail: InboxMails.Mail
  
    let thumbnailWidth = 40.0
    let defaultSpacing = 20.0
    let largeSpacing = 50.0
    let defaultOpacity = 0.6
    
    // Static Strings
    let toMe = "to me"
    let replyText = "Reply"
    let forwardText = "Forward"
    
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                titleSection
                Spacer().frame(height: defaultSpacing)
                
                senderSection
                Spacer().frame(height: defaultSpacing * 2)
                
                Text(mail.content)
                    .font(GmailFont.defaultDouble)
                    .lineSpacing(8)
                    .opacity(defaultOpacity)
                
                Spacer().frame(height: largeSpacing)
                
                replyForwardSection
                    .padding(.horizontal, 10)
            }
        }
        .scrollIndicators(.hidden)
        .padding()
    }
}

extension EmailBodyView {
    
    private var titleSection: some View {
        HStack() {
            HStack(alignment: .center) {
                Text(mail.subject)
                    .font(.title2)
                    .lineLimit(1)
                RoundedRectangle(cornerRadius: 2)
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(width: 36, height: 16)
                    .overlay(  
                        Text("Inbox")
                        .font(GmailFont.defaultFont)
                    )
            }
            Spacer()
            Button(action: {} ,label: {GmailIcons.starIcon})
                .font(GmailFont.defaultFont2)
                .foregroundColor(GmailColor.gray)
        }.opacity(0.7)
    }
    
    private var senderSection: some View {
        HStack {
            profilePictureThumbnail(with: mail)
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text("\(mail.sender)").font(GmailFont.defaultFont2)
                    Text("\(mail.time)").font(GmailFont.defaultFont2)
                }
                HStack() {
                    Text(toMe)
                    Spacer().frame(width: 4)
                    GmailIcons.chevronDownIcon
                        .resizable()
                        .frame(
                            width: 8, 
                            height: 5
                        )
                }.font(.caption2)
            }
            Spacer()
            Button(action: {} ,label: {GmailIcons.returnIcon})
                .font(GmailFont.defaultFont2)
            
            Spacer().frame(width: defaultSpacing)
            
            Button(action: {} ,label: {GmailIcons.ellipsisIcon})
                .font(GmailFont.defaultFont2)

        }.foregroundColor(GmailColor.gray)
    }
    
    private var replyForwardSection: some View {
        HStack {
            replyForwardButton(
                text: replyText, 
                icon: GmailIcons.replyIcon, 
                action: nil
            )
            Spacer()
            replyForwardButton(
                text: forwardText, 
                icon: GmailIcons.forwardIcon, 
                action: nil
            )
        }
    }
    
    
    @ViewBuilder func replyForwardButton(text: String, icon: Image, action: (()-> Void)?) -> some View {
         Button(
            action: action ?? {}, 
            label: {
                RoundedRectangle(cornerRadius: 5)
                    .stroke()
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .frame(width: 168, height: 32)
                    .overlay(  
                        HStack {
                            icon
                            Text(text)
                        }
                        .font(GmailFont.defaultFont2)
                        .fontWeight(.bold)
                        .foregroundColor(GmailColor.gray)
                    ) 
                    .fontWeight(.bold)
            }
        )
    }
    
    @ViewBuilder func profilePictureThumbnail(with mail: InboxMails.Mail?)  -> some View {
        if let profilePictureName = mail?.profilePicture  {
            Image(profilePictureName)
                .resizable()
                .scaledToFill()
                .cornerRadius(thumbnailWidth)
                .frame(width: thumbnailWidth, height: thumbnailWidth)
                .cornerRadius(thumbnailWidth)
                .frame(width: thumbnailWidth)
        } else {
            let placeHolder = String(mail?.sender.first ?? Character(""))
            Circle()
                .fill(mail?.defaultColor ?? .white)
                .frame(
                    width: thumbnailWidth, 
                    height: thumbnailWidth
                )
                .overlay() {
                    Text("\(placeHolder)")
                        .font(GmailFont.defaultTriple)
                        .foregroundColor(.white)
                }.frame(width: thumbnailWidth)
        }
    }
    
}

struct EmailBodyView_Previews: PreviewProvider {
    static var previews: some View {
        EmailBodyView(mail: InboxMailsViewModel().mails[0])
    }
}
