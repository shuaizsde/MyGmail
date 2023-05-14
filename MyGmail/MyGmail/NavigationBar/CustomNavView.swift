//
//  CustomNavView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/14/23.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    let content: Content
    var showToolBarService: ShowToolBarService
    
    init(@ViewBuilder content: ()-> Content, showToolBarService: ShowToolBarService) {
        self.content = content()
        self.showToolBarService = showToolBarService
    }
    var body: some View {
        NavigationView {
            CustomNavBarContainerView(content: { Color.orange}, showToolBarService: showToolBarService)
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

//struct CustomNavView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomNavView {
//            Color.red.ignoresSafeArea()
//        }
//    }
//}
