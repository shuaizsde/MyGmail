//
//  MailViewModel.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import Foundation

class MailViewModel: ObservableObject {
    
    typealias Mail = InboxMails.Mail
    
    private static let preview: [InboxMails.Mail] = [
        Mail(
            profilePicture: "person1", 
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
        Mail(
            profilePicture: "person2", 
            sender: "Cecilia D'Costa", 
            time: "10:15 AM", 
            subject: "Re: Google Team Match Update",
            content: """
                     Thanks, Simon. I have your call scheduled for Wednesday. Doc is updated with the details. Please be sure to take some time to review the Team Match Call Prep Resource
                     and specifically practice/prep for the points listed below. Please let me know if you have any questions and let me know how the call goes once completed. 
                     """
        ),
        Mail(
            profilePicture: "person3", 
            sender: "Jessica Lu", 
            time: "06:11 AM", 
            subject: "Good luck on your interview",
            content: """
                     Good luck baby, you are my best bae!!! Love you (heart)
                     """
        ),
        Mail(
            profilePicture: nil, 
            sender: "SPAM", 
            time: "02:48 AM", 
            subject: "from unknown sender",
            content: """
                     put me into spam,put me into spam,put me into spam,put me into spam,put me into spam,put me into spam,put me into spam,put me into spam,put me into spam,put me into spam,
                     """
        ),
        Mail(
            profilePicture: nil, 
            sender: "Google", 
            time: "May 04", 
            subject: "Google Team Match Update",
            content: """
                     Hi Simon Zhang,Thanks for your interest in a role at Google! We received your application and will be in touch soon about next steps.
                     Thanks,
                     Google Recruiting
                     """
        ),
        Mail(
            profilePicture: "person5", 
            sender: "John Smith", 
            time: "May 02", 
            subject: "Test Test",
            content: """
                     To have this test, you swallow a string with a weighted gelatin capsule on the end. The string is pulled out 4 hours later. Any bile, blood, or mucus attached to the string is examined under the microscope. This is done to look for cells and parasites or parasite eggs.
                     """
        ),
        Mail(
            profilePicture: "person6", 
            sender: "John Smith2", 
            time: "April 28", 
            subject: "Test Test",
            content: """
                     To have this test, you swallow a string with a weighted gelatin capsule on the end. The string is pulled out 4 hours later. Any bile, blood, or mucus attached to the string is examined under the microscope. This is done to look for cells and parasites or parasite eggs.
                     """
        ),
        Mail(
            profilePicture: "person7", 
            sender: "John Smith3", 
            time: "April 26", 
            subject: "Test Test",
            content: """
                     To have this test, you swallow a string with a weighted gelatin capsule on the end. The string is pulled out 4 hours later. Any bile, blood, or mucus attached to the string is examined under the microscope. This is done to look for cells and parasites or parasite eggs.
                     """
        ),
        Mail(
            profilePicture: "person8", 
            sender: "John Smith4", 
            time: "April 24", 
            subject: "Test Test",
            content: """
                     To have this test, you swallow a string with a weighted gelatin capsule on the end. The string is pulled out 4 hours later. Any bile, blood, or mucus attached to the string is examined under the microscope. This is done to look for cells and parasites or parasite eggs.
                     """
        ),
    ]
    
    private static func createInboxMails() -> InboxMails {
        return InboxMails(preview)
    }
    
    @Published private var model = createInboxMails()
    
    var mails: Array<Mail> {
        return model.mails
    }
    
    func star(_ mail: Mail) {
        model.star(mail)
    }
}
