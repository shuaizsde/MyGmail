//
//  MenuView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/9/23.
//

import SwiftUI

struct MenuView: View {
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
    
    var body: some View {
        VStack {
            Spacer()
            NavigationView {
                List{
                    HStack {
                        Image("gmail").resizable().scaledToFit().frame(width: 25, height: 25)
                        Text("Gmail").font(.custom("default", size: 25)).foregroundColor(.gray)
                    }
                    Section {
                        ForEach(MenuView.section1) { createIconCell(for: $0)}
                            .listRowSeparator(.hidden)
                    }
                    seperator()
                    Section {
                        ForEach(MenuView.section2) { createIconCell(for: $0)}
                            .listRowSeparator(.hidden)
                    }
                    seperator()
                    Section {
                        ForEach(MenuView.section3) { createIconCell(for: $0)}
                            .listRowSeparator(.hidden)
                    }

                } .scrollIndicators(.hidden)
                
            }.listStyle(.inset)
            
            Spacer()
        }.ignoresSafeArea(.all)
    }
    
    @ViewBuilder private func seperator() -> some View {
        Rectangle()
            .frame(height: 0.2)
            .foregroundColor(.gray)
            .offset(CGSize(width: 50, height: 10))
            .listRowSeparator(.hidden)
    }
    
    @ViewBuilder func createIconCell(for item: IconItem) -> some View {
        HStack {
            Image(systemName: item.profilePicture)
            Spacer().frame(width: 35)
            Text(item.title)
            Spacer()
            if let count = item.count {
                Text("\(count)")
            }
        }.font(.custom("default", size: 14))
    }   
}

struct IconItem: Identifiable {
    let id = UUID()
    let profilePicture: String
    let title: String
    var count: Int?
} 

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
