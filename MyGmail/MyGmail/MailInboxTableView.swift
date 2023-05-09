//
//  ContentView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import SwiftUI

struct MailInboxTableView: View {
    
    private let mails = Mail.preview
    @State var searchString = ""
    
    var body: some View {
        NavigationView{
            List(mails) { mail in
                NavigationLink(destination: MailInfoView(mail: mail)) {
                    tableItemView(mail: mail)
                }
            }
            .listStyle(.inset)
            .searchable(text: $searchString, prompt: "Search in mail")
            .navigationTitle("Inbox")
            .toolbar {
//                ToolbarItem(placement: .primaryAction){
//                    EditButton()
//                }
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
        
        HStack{
            if let image = mail.profilePicture {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                    
            }else{
                Circle()
                    .fill(Color.gray)
                    .frame(width: 50, height: 50)
                    .overlay() {
                        Image(systemName: "person.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
            }
            Spacer(minLength: 10)
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
                    .font(.body)
                Text(mail.content)
                    .font(.caption)
                    .lineLimit(1)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            Image(systemName: "star")
                .font(.custom( "default", size: 15))
                .foregroundColor(.gray)
        }
    }

}

struct MailInboxTableView_Previews: PreviewProvider {
    static var previews: some View {
        MailInboxTableView()
    }
}
