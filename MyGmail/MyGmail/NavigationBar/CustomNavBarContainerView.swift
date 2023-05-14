//
//  CustomNavBarContainerView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/14/23.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    let content: Content
    var showToolBarService: ShowToolBarService
    init(@ViewBuilder content:() -> Content, showToolBarService: ShowToolBarService){
        self.content = content()
        self.showToolBarService = showToolBarService
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(showToolBarService: showToolBarService)
            content.frame(maxWidth: .infinity,maxHeight: .infinity)
        }
    }
}

//struct CustomNavBarContainerView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomNavBarContainerView {
//            ZStack {
//                Color.green.ignoresSafeArea()
//                Text("Hello")
//                    .foregroundColor(.white)
//            }
//        }
//    }
//}
