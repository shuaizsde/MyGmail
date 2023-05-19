//
//  SideBarItemCellView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/15/23.
//

import SwiftUI

struct SideBarItemCellView: View {
    @ObservedObject var mailViewModel: InboxMailsViewModel
    @EnvironmentObject var slideInMenuService: SlideInMenuService
    @State private var isPressed = false
    
    let cell: CellItem
    let iconOnTap: (CellItem) -> Void

    var body: some View {
        HStack {
            Image(systemName: cell.profilePicture)
                .font(GmailFont.defaultFont2)
            Spacer().frame(width: 35)

            Text(cell.title)
                .font(GmailFont.defaultFont2)
            Spacer()

            let count = mailViewModel.getUnreads(of: cell.title)
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(GmailColor.green)
                .frame(
                    width: 48,
                    height: 18
                )
                .overlay(
                    Text(count >= 10 ? "\(count)" : "\(count) New")
                        .font(GmailFont.defaultFont)
                        .foregroundColor(.white)
                )
                .opacity(count == 0 ? 0 : 1)
        }
        // Text Color 
        .foregroundColor(cell.isSelected ? GmailColor.red : GmailColor.textGray)
        // Background Color
        .background(){
            RoundedRectangle(cornerRadius: 20)
              .fill(isPressed ? GmailColor.red : Color.white)
              .opacity(0.1)
              .frame(width: 300, height: 44)
              .offset(CGSize(width: -20, height: 0))
        }
        // Action
        .onTapGesture {
            iconOnTap(cell)
            slideInMenuService.isPresented.toggle()
        }
        // Animation
        .pressEvents(
            onPress: {
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = true
                }
            },
            onRelease: {
                withAnimation {
                    isPressed = false
                }
            }
        )
    }
}
