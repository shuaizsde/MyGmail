//
//  MyGmailTableView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import SwiftUI

struct InboxTableView: View {
    
    // MARK: Static values
    private let unreadBubbleSize = GmailSize.defaultSingle
    private let unreadBubbleFontSize = GmailSize.defaultFont
    private let unreadBubbleOffset = CGSize(width: 10.0, height: -1 * GmailSize.defaultSingle)
    private let composeButtonOffsetX = 320.0
    private let composeButtonOffsetY = 640.0
    // TODO: Fix this feature 
    var showToolBarService = ShowToolBarService()
    @EnvironmentObject private var slideInMenuService: SlideInMenuService
    @EnvironmentObject private var filterService: FilterService
    
    // MARK: viewModel
    @ObservedObject var model: InboxMailsViewModel
  
    // MARK: search bar
    @State var searchString = ""
    
    private var searchResults: [InboxMailsViewModel.Mail] {
        let filtedMails = model.mails.filter(filterService.currentFilter)
        guard !searchString.isEmpty else {
            return filtedMails
        }
        return filtedMails.filter {$0.sender.contains(searchString)}
    }
    
    // MARK: View Body
    var body: some View {
        NavigationView {
            ZStack {
                List{
                    ForEach(searchResults) {
                        createInboxMailCell(for: $0)
                        
                    }
                    .swipeActions(edge: .trailing) {
                        Button(action: {}, label:  {GmailIcons.swipeDownIcon})
                            .tint(.green)
                    }
                }
                .listStyle(.inset)
                // MARK: swipping gesture for side bar menu
                .gesture(
                    swipeToDisplayMenu()
                )
                .searchable(
                    text: $searchString, 
                    prompt: GmailStrings.searchbarPlaceHolder
                )
            
                composeButton()
            }
        }
    }
    
    @ViewBuilder func composeButton()  -> some View {
        NavigationLink {
            ComposeMailView()
        } label: {
            Capsule()
                .foregroundColor(.white)
                .shadow(radius: 4, x: 3, y: 3)
                .frame(width: GmailSize.defaultSingle * 15, height: GmailSize.defaultSingle * 5)
                .overlay(alignment: .center) {
                    HStack {
                        GmailIcons.composeButtonIcon
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: GmailSize.defaultDouble, 
                                height: GmailSize.defaultTripple
                            )
                        
                        Text(GmailStrings.composeButton).bold()
                    }
                    .foregroundColor(Color("gmailRed"))
                    .font(.caption)
                }
        }
        .position(
            x: composeButtonOffsetX, 
            y: composeButtonOffsetY
        )
    }
    
    // MARK: Bottom Tool Bar Buttons
    @ViewBuilder func createToolBarButtons()  -> some View {
        HStack{
            Button(action: {} ,label: {
                ZStack {
                    GmailIcons.envelopeIcon
                        .foregroundColor(Color("gmailGray"))
                    Circle()
                        .fill(Color("gmailRed"))
                        .frame(
                            width: unreadBubbleSize, 
                            height: unreadBubbleSize
                        )
                        .overlay(
                            // TODO: fix with actual unreads
                            Text("5") 
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.custom( "default", size: unreadBubbleFontSize))
                        )
                        .offset(unreadBubbleOffset)
                }
            })
    
            Spacer()
            Button(
                action: {},
                label: {GmailIcons.videoIcon.foregroundColor(Color("gmailGray"))}
            )
        }.padding(80)
    }
    
    // MARK: Inbox Mail Cell
    @ViewBuilder func createInboxMailCell(for cell: InboxMailsViewModel.Mail)  -> some View {
        ZStack {
            // Hide chevron visibility
            CustomNavigationLink(destination: EmailBodyView(mail: cell)) { EmptyView() }
                .opacity(0.0)
            HStack {
                InboxTableItemView(mail: cell, starOnTapped: { model.star(cell) }) {
                    model.important(cell)
                }
            }.frame(height: 50)
        }

    }
    
    private func swipeToDisplayMenu() -> _EndedGesture<DragGesture> {
        DragGesture(
            minimumDistance: 20, 
            coordinateSpace: .global
        )
        .onEnded { value in
            let horizontalAmount = value.translation.width as CGFloat
            let verticalAmount = value.translation.height as CGFloat
            
            if abs(horizontalAmount) > abs(verticalAmount) && horizontalAmount > 0 {
                slideInMenuService.isPresented.toggle()
                showToolBarService.showToolBar = false
            }
        }
    }
}

struct InboxTableView_Previews: PreviewProvider {
    static var previews: some View {
        InboxTableView(model: InboxMailsViewModel())
    }
}
