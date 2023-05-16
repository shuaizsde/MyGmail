//
//  HomeView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/10/23.
//

import SwiftUI

struct HomeView: View {
    private let unreadBubbleOffset = CGSize(width: 10.0, height: -8)

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

            Spacer()
            Button(
                action: { isCameraView = true },
                label: { GmailIcons.videoIcon.foregroundColor(GmailColor.gray) }
            )
        }.padding(80)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(model: InboxMailsViewModel(), showToolBarService: ShowToolBarService())
    }
}
