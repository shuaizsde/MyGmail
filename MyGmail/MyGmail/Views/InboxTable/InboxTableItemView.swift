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
            profilePictureThumbnail(with: mail.profilePicture)
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
    
    @ViewBuilder func profilePictureThumbnail(with profilePictureName: String?)  -> some View {
        if let profilePictureName {
            Image(profilePictureName)
                .resizable()
                .scaledToFill()
                .cornerRadius(profilePictureFrameWidth)
                .frame(width: profilePictureFrameWidth, height: profilePictureFrameWidth)
                .cornerRadius(profilePictureFrameWidth)
                .frame(width: 55)
        } else {
            Circle()
                .fill(Color.gray)
                .frame(width: profilePictureFrameWidth, height: profilePictureFrameWidth)
                .overlay() {
                    Image(systemName: profilePictureThumbnailPlaceHolder)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }.frame(width: 60)
        }
    }
}


struct InboxTableItemView_Previews: PreviewProvider {
    static var previews: some View {
        InboxTableItemView(
            mail: MyGailViewModel().mails[0], 
            starOnTapped: {}
        )
        .frame(height: 50)
    }
}

