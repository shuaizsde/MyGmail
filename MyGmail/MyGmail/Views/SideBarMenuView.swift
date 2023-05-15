//
//  MyGmailSideMenuView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/9/23.
//

import SwiftUI

struct SideBarMenuView: View {
    
    @ObservedObject public var model: SideMenuItemViewModel
    @State public var slideInMenuService: SlideInMenuService
    
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
}

extension SideBarMenuView {
    
    @ViewBuilder private func gmailLogoHeader() -> some View {
        HStack {
            GmailIcons.gmailIcon
                .resizable()
                .scaledToFit()
                .frame(
                    width: GmailSize.defaultTripple, 
                    height: GmailSize.defaultTripple
                )
            Text("Gmail")
                .font(GmailFont.defaultTriple)
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
                SideBarItemCellView(
                    slideInMenuService: $slideInMenuService, 
                    cell: $0 
                ) { tapOnCell($0) }
            }
            .listRowSeparator(.hidden)                    
        }
    }
    
    private func tapOnCell(_ cell: CellItem) {
        model.select(cell)
    }
}

struct SideBarMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarMenuView(
            model: SideMenuItemViewModel(filterService: FilterService()),
            slideInMenuService: SlideInMenuService()
        )
    }
}
