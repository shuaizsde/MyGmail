//
//  HomeView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/10/23.
//

import SwiftUI

struct HomeView: View {
    private let unreadBubbleOffset = CGSize(width: 10.0, height: -8)
    @State private var isPressed = false
    @State private var isPressed2 = false
    @ObservedObject var model: InboxMailsViewModel
    @ObservedObject var showToolBarService: ShowToolBarService

    @State var isCameraView = false

    var body: some View {
        VStack {
            if isCameraView {
                CameraView()
            } else {
                InboxTableView(showToolBarService: showToolBarService, model: model)
            }
        }.toolbar {
            if showToolBarService.showToolBar {
                ToolbarItemGroup(placement: .bottomBar) {
                    createToolBarButtons()
                }
            }
        }
    }

    @ViewBuilder func createToolBarButtons() -> some View {
    
        HStack {
            Button(action: {
                isCameraView = false
            }, label: {
                ZStack {
                    GmailIcons.envelopeIcon.foregroundColor(GmailColor.gray)
                    Circle()
                        .fill(GmailColor.red)
                        .frame(
                            width: GmailSize.defaultDouble,
                            height: GmailSize.defaultDouble
                        )
                        .overlay(
                            Text("\(model.unreads - model.getUnreads(of: "Spam") - model.getUnreads(of: "Trash"))")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(GmailFont.defaultFont)
                        )
                        .opacity(model.unreads - model.getUnreads(of: "Spam") - model.getUnreads(of: "Trash") > 0 ? 1.0 : 0)
                        .offset(unreadBubbleOffset)
                }
            })
            .background(){
                Circle()
                    .foregroundColor(isPressed ? Color.red : nil)
                    .opacity(0.1)
                    .frame(width: isPressed ? 250 : 0,
                           height: isPressed ? 250.0 : 0
                    )
                    .mask(Rectangle().frame(width: 500, height: 80).offset(y:12))
            }
            .pressEvents {
                // On press
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = true
                }
            } onRelease: {
                withAnimation {
                    isPressed = false
                }
            }

            Spacer()
            Button(
                action: { isCameraView = true },
                label: { GmailIcons.videoIcon.foregroundColor(GmailColor.gray) }
            ).background(){
                Circle()
                    .foregroundColor(isPressed2 ? Color.red : nil)
                    .opacity(0.1)
                    .frame(width: isPressed2 ? 250 : 0,
                           height: isPressed2 ? 250.0 : 0
                    )
                    .mask(Rectangle().frame(width: 500, height: 80).offset(y:12))
            }
            .pressEvents {
                // On press
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed2 = true
                }
            } onRelease: {
                withAnimation {
                    isPressed2 = false
                }
            }
        }.padding(80)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(model: InboxMailsViewModel(), showToolBarService: ShowToolBarService())
    }
}
