//
//  InboxTableItemView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/9/23.
//

import SwiftUI


struct InboxTableItemView :View {
    
    public var mail: InboxMails.Mail
    private let profilePictureFrameWidth: CGFloat = 50.0
    private let profilePictureThumbnailPlaceHolder = "person.fill"
    private let senderFontWidth: CGFloat = 14.0
    
    var starOnTapped: () -> Void

    
    var body: some View {
        HStack {
            profilePictureThumbnail(with: mail)
            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(mail.sender)
                        .font(.custom( "default", size: senderFontWidth))
                        .fontWeight(.light)
                        .foregroundColor(Color("gmailGray"))
                    
                    Spacer(minLength: 5)
                    
                    Text(mail.subject)
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Spacer(minLength: 0)
                    
                    Text(mail.content)
                        .font(.caption)
                        .lineLimit(1)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .trailing) {
                    Text(mail.time)
                        .foregroundColor(.gray)
                        .font(.custom( "default", size: 12))
                    
                    Spacer()
                    
                    Image(systemName: mail.isStarred ? "star" : "star.fill")
                        .foregroundColor(mail.isStarred ? Color.gray : Color.blue)
                        .font(.custom( "default", size: 14))
                        .onTapGesture {
                            starOnTapped()
                        }
                }
    
            }
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
                .frame(width: 55)
        } else {
            let placeHolder = String(mail?.sender.first ?? Character(""))
            Circle()
                .fill(Color.random())
                .frame(width: profilePictureFrameWidth, height: profilePictureFrameWidth)
                .overlay() {
                    Text("\(placeHolder)").font(.custom( "default", size: 30)).foregroundColor(.white)
                }.frame(width: 60)
        }
    }
}


struct InboxTableItemView_Previews: PreviewProvider {
    static var previews: some View {
        InboxTableItemView(
            mail: MyGailViewModel().mails[15], 
            starOnTapped: {}
        )
        .frame(height: 50)
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0.2...1), blue: Double.random(in: 0.3...1))
    }
}
