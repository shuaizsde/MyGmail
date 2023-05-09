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
                    .swipeActions(edge: .trailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "square.and.arrow.down")
                        }.tint(.green)
                    }
            }
            .listStyle(.inset)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        didTapMenuButton()
                    } label: {
                        Image(systemName: "chevron.right.2")
                            .foregroundColor(.gray)
                            .font(.custom( "default", size: unreadBubbleFontSize))
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    createToolBarButtons()
                }
            }
            .searchable(text: $searchString, prompt: searchbarPrompt)
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

struct MailInboxTableView_Previews: PreviewProvider {
    static var previews: some View {
        MailInboxTableView(incomingMails: MailViewModel())
    }
}
