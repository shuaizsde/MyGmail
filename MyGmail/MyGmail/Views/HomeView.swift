//
//  HomeView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/10/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isPressed = false
    @State private var isPressed2 = false
    
    @EnvironmentObject var showToolBarService: ShowToolBarService
    
    @State var isCameraView = false
    
    var body: some View {
        VStack {
            if isCameraView {
                CameraView()
            } else {
                InboxTableView()
            }
        }.toolbar {
            if showToolBarService.showToolBar {
                ToolbarItemGroup(placement: .bottomBar) {
                    HStack {
                        switchButton(icon: GmailIcons.envelopeIcon, isPressed: $isPressed) {
                            self.isCameraView = false
                        }
                        Spacer()
                        switchButton(icon: GmailIcons.videoIcon, isPressed: $isPressed2) {
                            self.isCameraView = true
                        }
                    }
                        .padding(80)
                }
            }
        }
    }
}


struct switchButton: View {
    private let unreadBubbleOffset = CGSize(width: 10.0, height: -8)
    @EnvironmentObject var viewModel: InboxMailsViewModel
    
    let icon: Image
    @Binding var isPressed: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                icon.foregroundColor(GmailColor.gray)
                // Unread Bubble
                if icon == GmailIcons.envelopeIcon {
                    Circle()
                        .fill(GmailColor.red)
                        .frame(
                            width: GmailSize.defaultDouble,
                            height: GmailSize.defaultDouble
                        )
                        .overlay(
                            Text("\(viewModel.unreads - viewModel.getUnreads(of: "Spam") - viewModel.getUnreads(of: "Trash"))")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(GmailFont.defaultFont)
                        )
                        .opacity(viewModel.unreads - viewModel.getUnreads(of: "Spam") - viewModel.getUnreads(of: "Trash") > 0 ? 1.0 : 0)
                        .offset(unreadBubbleOffset)
                }
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
        .pressEvents(
            onPress: {
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = true
                }
            },
            onRelease: {
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = false
                }
            }
        )
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
