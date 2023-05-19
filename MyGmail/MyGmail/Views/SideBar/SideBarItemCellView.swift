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
    var cell: CellItem
    var iconOnTap: (CellItem) -> Void

    var body: some View {
        HStack {
            Image(systemName: cell.profilePicture)
            Spacer().frame(width: 35)

            Text(cell.title)
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
        .onTapGesture {
            iconOnTap(cell)
            slideInMenuService.isPresented.toggle()
        }
        .foregroundColor(cell.isSelected ? GmailColor.red : GmailColor.textGray)
        .font(GmailFont.defaultFont2)
        .background(){
            RoundedRectangle(cornerRadius: 20)
              .fill(isPressed ? GmailColor.red : Color.white)
              .opacity(0.1)
              .frame(width: 300, height: 44)
              .offset(CGSize(width: -20, height: 0))
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
    }
}
