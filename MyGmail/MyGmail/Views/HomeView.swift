//
//  HomeView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/10/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            InboxTableView(model: MyGailViewModel())
            Button {
                // TODO compose button onTap()
            } label: {
                Capsule()
                    .foregroundColor(.white)
                    .shadow(radius: 4, x: 3, y: 3)
                    .frame(width: 110, height: 40)
                    .overlay(alignment: .center) {
                        HStack {
                            Image(systemName: "pencil").resizable().scaledToFit().frame(width: 15, height: 20)
                            Text("Compose").bold()
                        }.foregroundColor(Color("gmailRed")).font(.caption)
                    }.offset(CGSize(width: -10, height: -50))
                    
            }.padding(5)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
