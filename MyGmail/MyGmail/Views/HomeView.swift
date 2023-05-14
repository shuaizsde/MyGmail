//
//  HomeView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/10/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        InboxTableView(model: InboxMailsViewModel())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
