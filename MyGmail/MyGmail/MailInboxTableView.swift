//
//  MailInboxTableView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import SwiftUI

struct MailInboxTableView: View {
    
    @EnvironmentObject private var slideInMenuService: SlideInMenuService
    
    @ObservedObject var incomingMails: MailViewModel
    
    private let searchbarPrompt = "Search in mail"
    
    private let unreadBubbleSize: CGFloat = 16.0
    private let unreadBubbleFontSize: CGFloat = 12.0
    private let unreadBubbleOffset = CGSize(width: 10.0, height: -8)
    
    private let envelopeButtonImageName = "envelope"
    private let videoButtonImageName = "video"
    
    // MARK: search bar
    @State var searchString = ""
    
    private var searchResults: [MailViewModel.Mail] {
        guard !searchString.isEmpty else {
            return incomingMails.mails
        }
        
        return incomingMails.mails.filter { $0.sender.contains(searchString) }
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(searchResults) {createInboxMailCell(for: $0)}
            }
            .listStyle(.inset)
            .searchable(text: $searchString, prompt: searchbarPrompt)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        didTapMenuButton()
                    } label: {
                        Image(systemName: "filemenu.and.selection")
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    createToolBarButtons()
                }
            }
        }
    }
    
    // MARK: Bottom Tool Bar Buttons
    @ViewBuilder func createToolBarButtons()  -> some View {
        HStack{
            ZStack {
                Image(systemName: envelopeButtonImageName)
                Circle()
                    .fill(.red)
                    .frame(width: unreadBubbleSize, height: unreadBubbleSize)
                    .overlay(
                        Text("5")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.custom( "default", size: unreadBubbleFontSize))
                    )
                    .offset(unreadBubbleOffset)
            }
            
            Spacer()
            Image(systemName: videoButtonImageName)
            
        }.padding(80)
    }
    
    // MARK: Inbox Mail Cell
    @ViewBuilder func createInboxMailCell(for cell: MailViewModel.Mail)  -> some View {
        ZStack {
            NavigationLink(destination: MailInfoView(mail: cell)) { EmptyView() }
                .opacity(0.0)
            HStack {
                tableItemView(mail: cell)
//                Image(systemName: cell.isStarred ? "star" : "star.fill")
//                    .font(.custom( "default", size: 16))
//                    .foregroundColor(cell.isStarred ? Color.gray : Color.yellow)
//                    .onTapGesture { incomingMails.star(cell) }
            }.frame(height: 50)
        }

    }
    private func didTapMenuButton() {
        slideInMenuService.isPresented.toggle()
    }
}


struct tableItemView :View {
    
    public let mail: InboxMails.Mail
    private let profilePictureFrameWidth: CGFloat = 50.0
    private let profilePictureThumbnailPlaceHolder = "person.fill"
    
    // @Binding var incomingMails: MailViewModel
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
                    Image(systemName: "person.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }.frame(width: 60)
        }
    }

}

struct MailInboxTableView_Previews: PreviewProvider {
    static var previews: some View {
        MailInboxTableView(incomingMails: MailViewModel())
    }
}
