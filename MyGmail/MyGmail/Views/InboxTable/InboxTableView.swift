//
//  MyGmailTableView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import SwiftUI

struct InboxTableView: View {
    
    // MARK: Static strings
    private let searchbarPrompt = "Search in mail"
    private let envelopeButtonImageName = "envelope"
    private let videoButtonImageName = "video"
    private let swipeArrowDownImage = "square.and.arrow.down"
    private let menuButtonImage = "chevron.right.2"
    
    // MARK: Static values
    private let unreadBubbleSize: CGFloat = 16.0
    private let unreadBubbleFontSize: CGFloat = 12.0
    private let unreadBubbleOffset = CGSize(width: 10.0, height: -8)
    
    @EnvironmentObject private var slideInMenuService: SlideInMenuService
    // MARK: viewModel
    @ObservedObject var model: InboxMailsViewModel
  
    // MARK: search bar
    @State var searchString = ""
    
    private var searchResults: [InboxMailsViewModel.Mail] {
        guard !searchString.isEmpty else {
            return model.mails
        }
        return model.mails.filter { $0.sender.contains(searchString) }
    }
    
    // MARK: View Body
    var body: some View {
        NavigationView {
            List{
                ForEach(searchResults) {createInboxMailCell(for: $0)}
                    .swipeActions(edge: .trailing) {
                        Button {
                            // TODO
                        } label: {
                            Image(systemName: swipeArrowDownImage)
                        }.tint(.green)
                    }
            }
            .listStyle(.inset)
            // MARK: bottom Buttons
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    createToolBarButtons()
                }
            }
            // MARK: swipping gesture for side bar menu
            .gesture(
                DragGesture(
                    minimumDistance: 20, 
                    coordinateSpace: .global
                )
                .onEnded { value in
                    let horizontalAmount = value.translation.width as CGFloat
                    let verticalAmount = value.translation.height as CGFloat
                    
                    if abs(horizontalAmount) > abs(verticalAmount) && horizontalAmount > 0 {
                        slideInMenuService.isPresented.toggle()
                    }
                }
            )
            // MARK: search bar
            .searchable(text: $searchString, prompt: searchbarPrompt)
        }
    }
    
    // MARK: Bottom Tool Bar Buttons
    @ViewBuilder func createToolBarButtons()  -> some View {
        HStack{
            ZStack {
                Image(systemName: envelopeButtonImageName).foregroundColor(Color("gmailGray"))
                Circle()
                    .fill(Color("gmailRed"))
                    .frame(width: unreadBubbleSize, height: unreadBubbleSize)
                    .overlay(
                        Text("5") // TODO: unread placeholder 
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.custom( "default", size: unreadBubbleFontSize))
                    )
                    .offset(unreadBubbleOffset)
            }
            
            Spacer()
            Image(systemName: videoButtonImageName).foregroundColor(Color("gmailGray"))
            
        }.padding(80)
    }
    
    // MARK: Inbox Mail Cell
    @ViewBuilder func createInboxMailCell(for cell: InboxMailsViewModel.Mail)  -> some View {
        ZStack {
            // Hide chevron visibility
            NavigationLink(destination: EmailBodyView(mail: cell)) { EmptyView() }
                .opacity(0.0)
            HStack {
                InboxTableItemView(mail: cell, starOnTapped: { model.star(cell) }) {
                    model.important(cell)
                }
            }.frame(height: 50)
        }

    }
    
}

struct InboxTableView_Previews: PreviewProvider {
    static var previews: some View {
        InboxTableView(model: InboxMailsViewModel())
    }
}
