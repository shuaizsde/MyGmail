//
//  MyGmailBodyView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import SwiftUI

struct MyGmailBodyView: View {
    let mail: InboxMails.Mail
    var body: some View {
      VStack(alignment: .leading) {
      
            VStack(alignment: .leading) {
                Text(mail.subject).font(.title)
                Text("From: \(mail.sender)").font(.body).frame(width: .infinity, height: 20)
            }
            
          Spacer().frame(height: 50)
            Text(mail.content).font(.body)
            Spacer()
        }.padding()
    }
}

struct MyGmailBodyView_Previews: PreviewProvider {
    static var previews: some View {
        MyGmailBodyView(mail: MyGailViewModel().mails[0])
    }
}
