//
//  MyGmailTableItemView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/9/23.
//

import SwiftUI


struct MyGmailTableItemView :View {
    
    public let mail: InboxMails.Mail
    private let profilePictureFrameWidth: CGFloat = 50.0
    private let profilePictureThumbnailPlaceHolder = "person.fill"
    
    var body: some View {
        HStack{
            profilePictureThumbnail(with: mail.profilePicture)
            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(mail.sender)
                    Spacer(minLength: 5)
                    Text(mail.subject)
                        .font(.caption)
                    Spacer(minLength: 0)
                    Text(mail.content)
                        .font(.caption)
                        .lineLimit(1)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .trailing){
                    Text(mail.time)
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: mail.isStarred ? "star" : "star.fill")
                        .foregroundColor(mail.isStarred ? Color.gray : Color.yellow)
                        //.onTapGesture {  mail.isStarred }
                }.font(.custom( "default", size: 14))
    
            }
        }
    }
    
    @ViewBuilder func profilePictureThumbnail(with profilePictureName: String?)  -> some View {
        if let profilePictureName  {
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
