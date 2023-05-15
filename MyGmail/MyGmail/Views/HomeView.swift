//
//  HomeView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/10/23.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: Static strings
    private let envelopeButtonImageName = "envelope"
    private let videoButtonImageName = "video"
    private let swipeArrowDownImage = "square.and.arrow.down"
    private let menuButtonImage = "chevron.right.2"
    
    // MARK: Static values
    private let unreadBubbleSize: CGFloat = 16.0
    private let unreadBubbleFontSize: CGFloat = 12.0
    private let unreadBubbleOffset = CGSize(width: 10.0, height: -8)
    
    @ObservedObject var model: InboxMailsViewModel
    var showToolBarService: ShowToolBarService
    
    @State var isCameraView = false
    
    var body: some View {
      //  var currentView = isCameraView ? CameraView() : InboxTableView(model: model, showToolBarService: showToolBarService)
        ZStack {
            if isCameraView {
                CameraView()
            }
            if !isCameraView {
                InboxTableView(model: model, showToolBarService: showToolBarService)
            }
        }.toolbar() {
            if showToolBarService.showToolBar {
                ToolbarItemGroup(placement: .bottomBar) {
                    createToolBarButtons()
                }
            }
        }
        
    }
    
    @ViewBuilder func createToolBarButtons()  -> some View {
        HStack {
            Button(action: {
                isCameraView = false
            } ,label: {
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
            Button(
                action: {isCameraView = true} ,
                label: { Image(systemName: videoButtonImageName).foregroundColor(Color("gmailGray"))}
            )
        }.padding(80)
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(model: InboxMailsViewModel(filterService: FilterService()), showToolBarService: ShowToolBarService())
//    }
//}
