//
//  MyGmailSideMenuView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/9/23.
//

import SwiftUI

struct MyGmailSideMenuView: View {
    
    //MARK: Static fake iconItems and names
    @ObservedObject public var cells: SideMenuItemViewModel
    @EnvironmentObject private var slideInMenuService: SlideInMenuService
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
                List{
                    HStack {
                        Image(MyGmailSideMenuView.gmailIcon).resizable().scaledToFit().frame(width: gmailIconWidth, height: gmailIconWidth)
                        Text(MyGmailSideMenuView.gmailText).font(.custom(MyGmailSideMenuView.defaultFontType, size: gmailIconWidth)).foregroundColor(.gray)
                    }
                   
                    Section() {
                        ForEach(cells.cells.filter({$0.id < 4}), id: \.id) { 
                            MyGmailSideMenuCell(item: $0) {
                                tapOnCell($0)
                              
                            }
                        }
                        .listRowSeparator(.hidden)                    
                    }
                    menuSeperator()
                    
                    Section() {
                        ForEach(cells.cells.filter({$0.id >= 4 && $0.id < 12}), id: \.id) { 
                            MyGmailSideMenuCell(item: $0) {
                                tapOnCell($0)
                            }
                        }
                        .listRowSeparator(.hidden)                    
                    }
                    menuSeperator()
                    Section() {
                        ForEach(cells.cells.filter({$0.id > 12}), id: \.id) { 
                            MyGmailSideMenuCell(item: $0) {
                                tapOnCell($0)
                            }
                        } 
                        .listRowSeparator(.hidden)                    
                    }
                }
                .listStyle(.inset)
                .scrollIndicators(.hidden)                
            }
            Spacer()
            
        }.ignoresSafeArea(.all)
    }
    
    private func tapOnCell(_ cell: CellItem) {
        cells.select(cell)
    }
    
    @ViewBuilder private func menuSeperator() -> some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.gray).opacity(0.2)
            .offset(CGSize(width: 50, height: 10))
            .listRowSeparator(.hidden)
    }

    
    struct MyGmailSideMenuCell: View {
        
        @EnvironmentObject private var slideInMenuService: SlideInMenuService
         var item: CellItem
         // var cells: [CellItem]
        var iconOnTap: (CellItem)->()
        
        var body: some View {
            HStack {
                Image(systemName: item.profilePicture)
                Spacer().frame(width: 35)
                
                Text(item.title)
                Spacer()
                if let count = item.unreads {
                    Text("\(count)")
                }
            }.onTapGesture {
                iconOnTap(item)
            }
            .foregroundColor(item.isSelected ? Color("gmailRed") : Color("menuTextGray"))
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(item.isSelected ? Color("gmailRed") : Color.white)
                    .opacity(0.1)
                    .frame(width: 300, height: 44)
                    .offset(CGSize(width: -20, height: 0))
            )
                .font(
                .custom("default", size: 14)
            )  
        }
    }
}
