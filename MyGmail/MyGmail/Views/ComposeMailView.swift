//
//  ComposeMailView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/13/23.
//

import SwiftUI

struct ComposeMailView: View {
    var body: some View {
        // TODO: Now it's just a image
        VStack {
            Spacer().frame(height: 50)
            Image("composeView").resizable().scaledToFill().frame(width: 395, height: 350)
            Spacer()
        }
    }
}

struct ComposeMailView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeMailView()
    }
}
