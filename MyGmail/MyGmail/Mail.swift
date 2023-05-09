//
//  Mail.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import Foundation
struct Mail: Identifiable {
    let id = UUID()
    let profilePicture: String? = nil
    let sender: String
    let time: String
    let subject: String
    let content: String
    
    static let preview: [Mail] = [
        Mail(
            sender: "Simon Zhang", 
            time: "11:24 AM", 
            subject: "First Email from Simon", 
            content: """
                     Hi there, I’m emailing you today to let you know we have created a new project called myGmail. In this article, you’ll learn how to do it by yourself with SwiftUI
                     If you know anybody else who’ll find this useful, please forward the email to them.Let us know if you face any problems accessing the project 
                     by replying to this email. We’ll get back to you ASAP and ensure you gain access to it immediately.
                     Thank you
                     """
        ),
          Mail(sender: "Simon Zhang", time: "11:24 AM", subject: "First Email from Simon", content: "Hello World, hello Gmail Team"),
          Mail(sender: "Simon Zhang", time: "11:24 AM", subject: "First Email from Simon", content: "Hello World, hello Gmail Team"),
          Mail(sender: "Simon Zhang", time: "11:24 AM", subject: "First Email from Simon", content: "Hello World, hello Gmail Team")
    ]
    
    
}
