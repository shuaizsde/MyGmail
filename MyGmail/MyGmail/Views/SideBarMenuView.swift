//
//  MyGmailSideMenuView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/9/23.
//

import SwiftUI

struct SideBarMenuView: View {
    
    //MARK: Static fake iconItems and names
    @ObservedObject public var model: SideMenuItemViewModel
    @State public var slideInMenuService: SlideInMenuService
    
    // MARK: private static values for pictures and strings
    private static let gmailIcon = "gmail"
    private static let gmailText = "Gmail"
    private static let defaultFontType = "default"
    private let gmailIconWidth: CGFloat = 25.0
    private static let iconFontSize: CGFloat = 14.0
    
    
    // MARK: Body
    var body: some View {
        VStack {
            Spacer()
            NavigationView {
                List {
                    gmailLogoHeader()
                    
                    createSection(with: model, filter: {$0.id < 4})
                    sectionSeperator()
                    createSection(with: model, filter: {$0.id >= 4 && $0.id < 12})
                    sectionSeperator()
                    createSection(with: model, filter: {$0.id > 12})
                }
                .listStyle(.inset)
                .scrollIndicators(.hidden)                
            }
            Spacer()
            
        }.ignoresSafeArea(.all)
    }
    
    @ViewBuilder private func gmailLogoHeader() -> some View {
        HStack {
            Image(SideBarMenuView.gmailIcon)
                .resizable()
                .scaledToFit()
                .frame(width: gmailIconWidth, height: gmailIconWidth)
            Text(SideBarMenuView.gmailText)
                .font(.custom(SideBarMenuView.defaultFontType, size: gmailIconWidth))
                .foregroundColor(.gray)
        }
    }
    
    @ViewBuilder private func sectionSeperator() -> some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.gray)
            .opacity(0.2)
            .offset(CGSize(width: 50, height: 10))
            .listRowSeparator(.hidden)
    }
    
    @ViewBuilder private func createSection(with model: SideMenuItemViewModel, filter: (CellItem) -> Bool) -> some View {
        Section() {
            ForEach(model.cells.filter(filter), id: \.id) { 
                SideBarItemCellView(slideInMenuService: $slideInMenuService, cell: $0 ) { tapOnCell($0) }
            }
            .listRowSeparator(.hidden)                    
        }
    }
    
    private func tapOnCell(_ cell: CellItem) {
        model.select(cell)
    }
    
}

struct SideBarItemCellView: View {
    
    @Binding var slideInMenuService: SlideInMenuService
    
    var cell: CellItem
    var iconOnTap: (CellItem) -> Void
    
    var body: some View {
        
        HStack {
            Image(systemName: cell.profilePicture)
            Spacer().frame(width: 35)
            Text(cell.title)
            Spacer()
            if let count = cell.unreads { Text("\(count)") }
            
        }
        .onTapGesture {
            iconOnTap(cell)
            // MARK: completion handler, unmark when filter is done
            // slideInMenuService.isPresented.toggle()
        }
        .foregroundColor(cell.isSelected ? Color("gmailRed") : Color("menuTextGray"))
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(cell.isSelected ? Color("gmailRed") : Color.white)
                .opacity(0.1)
                .frame(width: 300, height: 44)
                .offset(CGSize(width: -20, height: 0)))
        .font(.custom("default", size: 14))  
    }
}
