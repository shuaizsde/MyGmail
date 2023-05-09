//
//  MyGmailApp.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import SwiftUI

@main
struct MyGmailApp: App {
    @StateObject private var slideInMenuService = SlideInMenuService()
    
    var body: some Scene {
        WindowGroup {
            Group{
                MyGmailTableView(incomingMails: MyGailViewModel())
            }.environmentObject(slideInMenuService)
             .slideInView(
                isActive: $slideInMenuService.isPresented, 
                edge:.leading, 
                paddingPercentage: 0.3, 
                options: SlideInViewOptions(paddingColor: .gray, paddingColorOpacity: 0.8)) {
                    MyGmailSideMenuView()
                }
        }
    }
}

//TabView {
//    NavigationView {
//        MyGmailTableView(incomingMails: MyGailViewModel())
//    }.tabItem {
//        Image(systemName: "envelope")
//            .imageScale(.medium)
//    }
//    
//    NavigationView{
//        VideoChat()
//    }.tabItem {
//        Image(systemName: "video")
//            .imageScale(.medium)
//    }
//}
