//
//  ContentView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import SwiftUI

struct ContentView: View {
    
    private let mails = Mail.preview
    @State var searchString = ""
    var body: some View {
        NavigationView{
            List(mails) { mail in
                NavigationLink(destination: Text("")) {
                    tableItemView(mail: mail)
                }
            }
            .listStyle(.inset)
            .searchable(text: $searchString)
            .navigationTitle("Inbox")
            .toolbar {
                ToolbarItem(placement: .primaryAction){
                    EditButton()
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                    Spacer()
                    Text("Updated Just now")
                        .font(.footnote)
                    Spacer()
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

struct tableItemView :View {
    
    public let mail: Mail
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(mail.sender)
                    .font(.title2)
                    .fontWeight(.medium)
                Spacer()
                Text(mail.time)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Text(mail.subject)
            Text(mail.content)
                .fontWeight(.light)
                .foregroundColor(.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
