//
//  MyGmailSideMenuView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/9/23.
//

import SwiftUI

struct MyGmailSideMenuView: View {
    
    //MARK: Static fake iconItems and names
    private static var section1:[IconItem] {
        var previews = [IconItem]()
        previews.append(IconItem(profilePicture:"tray",title: "All Inboxes", count: 5))
        previews.append(IconItem(profilePicture:"timelapse",title: "Primary"))
        previews.append(IconItem(profilePicture:"person.2",title:"Social", count: 3))
        previews.append(IconItem(profilePicture:"tag",title:"Promotions",count: 1))

        return previews
    }
    private static var section2:[IconItem] {
        var previews = [IconItem]()
        previews.append(IconItem(profilePicture:"star",title:"Starred"))
        previews.append(IconItem(profilePicture:"timer",title:"Snoozed", count: 24))
        previews.append(IconItem(profilePicture:"flag",title:"Important"))
        previews.append(IconItem(profilePicture:"paperplane",title:"Sent", count: 123))
        previews.append(IconItem(profilePicture:"calendar",title:"Scheduled"))
        previews.append(IconItem(profilePicture:"square.and.pencil",title:"Drafts"))
        previews.append(IconItem(profilePicture:"mail.stack",title:"All mail", count: 528))
        previews.append(IconItem(profilePicture:"xmark.bin",title:"Spam", count: 20)) 
        previews.append(IconItem(profilePicture:"trash",title:"Trash"))
        return previews
    }
    private static var section3:[IconItem] {
        var previews = [IconItem]()
        previews.append(IconItem(profilePicture:"plus",title:"Create new"))
        previews.append(IconItem(profilePicture:"gear",title:"Settings"))
        previews.append(IconItem(profilePicture:"character.bubble",title:"Send feedback"))
        previews.append(IconItem(profilePicture:"questionmark.circle",title:"Help"))
       
        return previews
    }
    
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
                        ForEach(MyGmailSideMenuView.section1, id: \.id) { 
                            MyGmailSideMenuCell(item: $0)
                        } 
                        .listRowSeparator(.hidden)                    
                    }
                    
                    menuSeperator()
                    
                    Section() {
                        ForEach(MyGmailSideMenuView.section2, id: \.id) { 
                            MyGmailSideMenuCell(item: $0)
                        } 
                        .listRowSeparator(.hidden)                    
                    }
                    
                    menuSeperator()
                    
                    Section() {
                        ForEach(MyGmailSideMenuView.section3, id: \.id) { 
                            MyGmailSideMenuCell(item: $0)
                            
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
    
    @ViewBuilder private func menuSeperator() -> some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.gray).opacity(0.2)
            .offset(CGSize(width: 50, height: 10))
            .listRowSeparator(.hidden)
    }
}

struct MyGmailSideMenuCell: View {
   @State var item: IconItem
    var body: some View {
        HStack {
            Image(systemName: item.profilePicture)
            Spacer().frame(width: 35)
            
            Text(item.title)
            Spacer()
            if let count = item.count {
                Text("\(count)")
            }
        }
        .foregroundColor(item.isTapped ? Color("gmailRed") : Color("menuTextGray"))
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(item.isTapped ? Color("gmailRed") : Color.white)
                .opacity(0.1)
                .frame(width: 300, height: 44)
                .offset(CGSize(width: -20, height: 0))
        )
            .font(
            .custom("default", size: 14)
        ).onTapGesture {
            item.isTapped.toggle()
            // TODO: Switch table view by tapping
        }    
    }
}

struct IconItem: Identifiable {
    let id = UUID()
    let profilePicture: String
    let title: String
    var count: Int?
    
    var isTapped:Bool = false
} 

struct MyGmailSideMenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        HStack{
            MyGmailSideMenuView().frame(width: UIScreen.main.bounds.size.width * 0.7)
            Spacer()
        }
    }
}
