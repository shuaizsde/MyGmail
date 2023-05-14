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
    
    var showToolBarService = ShowToolBarService()
    
    private var searchResults: [InboxMailsViewModel.Mail] {
        guard !searchString.isEmpty else {
            return model.mails
        }
        return model.mails.filter { $0.sender.contains(searchString) }
    }
    
    // MARK: View Body
    var body: some View {
        NavigationView {
            ZStack {
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
                        showToolBarService.showToolBar = false
                    }
                )
                // MARK: search bar
                .searchable(text: $searchString, prompt: searchbarPrompt)
                
                NavigationLink {
                    ComposeMailView()
                } label: {
                    Capsule()
                        .foregroundColor(.white)
                        .shadow(radius: 4, x: 3, y: 3)
                        .frame(width: 110, height: 40)
                        .overlay(alignment: .center) {
                            HStack {
                                Image(systemName: "pencil").resizable().scaledToFit().frame(width: 15, height: 20)
                                Text("Compose").bold()
                            }.foregroundColor(Color("gmailRed")).font(.caption)
                        }
                } .position(x: 320, y: 640)
            }
        }
    }
    
    // MARK: Bottom Tool Bar Buttons
    @ViewBuilder func createToolBarButtons()  -> some View {
        HStack{
            Button(action: {} ,label: {
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
            })
            
            Spacer()
            Button(action: {} ,label: { Image(systemName: videoButtonImageName).foregroundColor(Color("gmailGray"))})

            
        }.padding(80)
    }
    
    // MARK: Inbox Mail Cell
    @ViewBuilder func createInboxMailCell(for cell: InboxMailsViewModel.Mail)  -> some View {
        ZStack {
            // Hide chevron visibility
            CustomNavigationLink(destination: EmailBodyView(mail: cell), showToolBarService: showToolBarService) { EmptyView() }
                .opacity(0.0)
            HStack {
                InboxTableItemView(mail: cell, starOnTapped: { model.star(cell) }) {
                    model.important(cell)
                }
            }.frame(height: 50)
        }

    }
    
}
//
//struct InboxTableView_Previews: PreviewProvider {
//    static var previews: some View {
//        InboxTableView(model: InboxMailsViewModel())
//    }
//}
