//
//  MailInboxTableView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import SwiftUI
// aa
struct MailInboxTableView: View {
    
    @ObservedObject var incomingMails: MailViewModel
    
    //private let mails = incomingMails.mails
    
    @State var searchString = ""
    
    var searchResults: [MailViewModel.Mail] {
        if searchString.isEmpty {
            return incomingMails.mails
        } else {
            return incomingMails.mails.filter { $0.sender.contains(searchString) }
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(searchResults) { mail in
                    NavigationLink(destination: MailInfoView(mail: mail)) {
                        HStack{
                            tableItemView(mail: mail)
                            Image(systemName: mail.isStarred ? "star": "star.fill")
                                .font(.custom( "default", size: 15))
                                .foregroundColor(mail.isStarred ? Color.gray : Color.yellow)
                                .onTapGesture {
                                    incomingMails.star(mail)
                                }
                            
                        }
                    }
                }
            }
            .listStyle(.inset)
            .searchable(text: $searchString, prompt: "Search in mail")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    HStack{
                        ZStack {
                            Image(systemName: "envelope")
                            Circle()
                                .fill(.red)
                                .frame(width: 16, height: 16)
                                .overlay(
                                    Text("5")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .font(.custom( "default", size: 12))
                                )
                                .offset(x: 10, y: -8)
                        }
                
                        Spacer()
                        Image(systemName: "video")
                    }.padding(80)
                }
            }
            
        }
    }
}

struct tableItemView :View {
    public let mail: InboxMails.Mail
    let profilePictureFrameWidth: CGFloat = 50
    var body: some View {
        
        HStack{
            if let image = mail.profilePicture {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: profilePictureFrameWidth, height: profilePictureFrameWidth)
                    .cornerRadius(profilePictureFrameWidth)
                    
            }else{
                Circle()
                    .fill(Color.gray)
                    .frame(width: profilePictureFrameWidth, height: profilePictureFrameWidth)
                    .overlay() {
                        Image(systemName: "person.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
            }
            Spacer(minLength: 10)
            VStack(alignment: .leading) {
                HStack {
                    Text(mail.sender)
                        .bold()
                        .font( .custom( "default", size: 14))
                    Spacer()
                    Text(mail.time)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Text(mail.subject)
                    .font(.caption)
                Text(mail.content)
                    .font(.caption)
                    .lineLimit(1)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
        }
    }

}

struct MailInboxTableView_Previews: PreviewProvider {
    static var previews: some View {
        MailInboxTableView(incomingMails: MailViewModel())
    }
}
