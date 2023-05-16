//
//  SideBarItemCellView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/15/23.
//

import SwiftUI

struct SideBarItemCellView: View {
    @ObservedObject var mailViewModel: InboxMailsViewModel
    @Binding var slideInMenuService: SlideInMenuService

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
                .foregroundColor(count >= 10 ? GmailColor.gray : GmailColor.green)
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
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(cell.isSelected ? GmailColor.red : Color.white)
                .opacity(0.1)
                .frame(width: 300, height: 44)
                .offset(CGSize(width: -20, height: 0))
        )
        .font(GmailFont.defaultFont2)
    }
}
