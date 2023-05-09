//
//  emailContentView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import SwiftUI

struct MailInfoView: View {
    let mail: Mail
    var body: some View {
        Text(mail.content).padding(15)
    }
}

struct EmailContentView_Previews: PreviewProvider {
    static var previews: some View {
        MailInfoView(mail: Mail.preview[0])
    }
}
